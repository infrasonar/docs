![Kubernetes](../../images/agent_kubernetes.png){ width="150" align=right}

# :simple-kubernetes: Kubernetes

## Introduction

The Kubernetes agent monitors your Kubernetes cluster.<br>
Deploy it as a pod in your cluster.

## Prerequisites

* A valid Kubernetes [token](../../api/authentication.md).
* An InfraSonar asset ID if you want to use a *Deployment* instead of a *StatefulSet*.

## Installation

Create a namespace for the agent:

```yaml title="namespace.yaml"
apiVersion: v1
kind: Namespace
metadata:
  name: monitoring
```

Create a cluster role for the agent:

```yaml title="cluster_role.yaml"
kind: ClusterRole
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: infrasonar
rules:
- apiGroups: ["metrics.k8s.io", "apiregistration.k8s.io", ""]
  resources: ["pods", "namespaces", "nodes", "nodes/proxy", "apiservices", "persistentvolumeclaims", "services"]
  verbs: ["list", "get"]
```

Create a cluster role binding for the agent:

```yaml title="cluster_role_binding.yaml"
kind: ClusterRoleBinding
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: infrasonar
subjects:
- kind: ServiceAccount
  name: default
  namespace: monitoring
roleRef:
  kind: ClusterRole
  name: infrasonar
  apiGroup: rbac.authorization.k8s.io
```

Apply the above files:

```bash
kubectl apply -f namespace.yaml
kubectl apply -f cluster_role.yaml
kubectl apply -f cluster_role_binding.yaml
```

### Deployment

If you already have an asset or want to create one manually in InfraSonar, you only need the asset ID and can use a Deployment. Otherwise, skip this part and read the [StatefulSet](#statefulset) section.

Create a deployment for the agent:

```yaml title="deployment.yaml"
apiVersion: apps/v1
kind: Deployment
metadata:
  name: infrasonar
  namespace: monitoring
  labels:
    app: infrasonar
spec:
  selector:
    matchLabels:
      app: infrasonar
  template:
    metadata:
      labels:
        app: infrasonar
    spec:
      containers:
      - name: infrasonar
        image: ghcr.io/infrasonar/kubernetes-agent:latest
        imagePullPolicy: Always
        env:
        - name: ASSET_ID
          value: "<REPLACE_WITH_YOUR_ASSET_ID>"
        - name: TOKEN
          value: "<REPLACE_WITH_YOUR_AGENT_TOKEN>"
```

Apply the _deployment_:

```bash
kubectl apply -f deployment.yaml
```

### StatefulSet

Use a StatefulSet _only_ if you want the agent to create the asset for you, otherwise use a [Deployment](#deployment).

Create a StatefulSet for the agent:

```yaml title="stateful_set.yaml"
apiVersion: apps/v1
kind: StatefulSet
metadata:
  name: infrasonar
  namespace: monitoring
  labels:
    app: infrasonar
spec:
  selector:
    matchLabels:
      app: infrasonar
  serviceName: infrasonar
  replicas: 1
  template:
    metadata:
      labels:
        app: infrasonar
    spec:
      containers:
      - name: infrasonar
        image: ghcr.io/infrasonar/kubernetes-agent:latest
        imagePullPolicy: Always
        env:
        - name: ASSET_ID
          value: "/mnt/data/asset.json"
        - name: TOKEN
          value: "<REPLACE_WITH_YOUR_AGENT_TOKEN>"
        volumeMounts:
        - name: data
          mountPath: /mnt/data
  volumeClaimTemplates:
  - metadata:
      name: data
    spec:
      accessModes: ["ReadWriteOnce"]
      resources:
        requests:
          storage: 1Mi
```

Apply the *StatefulSet*:

```bash
kubectl apply -f stateful_set.yaml
```


## Cleanup

When you no longer want to use the Kubernetes agent, you can remove it with the following steps:

If a **Deployment** was used:

```bash
kubectl delete deployment infrasonar --namespace=monitoring
```

If a **StatefulSet** was used:

```bash
kubectl delete sts infrasonar --namespace=monitoring
kubectl delete pvc -l app.kubernetes.io/name=infrasonar --namespace=monitoring
```

Cleanup the namespace, service account and associated role and binding:

```bash
kubectl delete ClusterRoleBinding infrasonar
kubectl delete ClusterRole infrasonar
kubectl delete ns monitoring
```

## My CPU and Memory metrics are missing

If the pod and node CPU and Memory metrics are missing, please check the agent logging.
Most likely the metric server is not running. This can be checked using the following command:

```bash
kubectl get apiservices v1beta1.metrics.k8s.io
```

The above should return with something like:
```
NAME                     SERVICE                      AVAILABLE   AGE
v1beta1.metrics.k8s.io   kube-system/metrics-server   True        123d
```

Click [here](https://github.com/kubernetes-sigs/metrics-server) for information on how to install the metrics server.

## Additional information

:material-github: [Kubernetes agent source code](https://github.com/infrasonar/kubernetes-agent)
