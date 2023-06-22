![Kubernetes](../../images/agent_kubernetes.png){ width="150" align=right}

# :simple-kubernetes: Kubernetes

## Introduction

The Kubernetes agent is designed to monitor your kubernetes cluster and should be deployed as a pod in your kubernetes cluster.


## Prerequisites

* The Kubernetes-agent requires a valid [token](../../api/authentication.md).
* The Kubernetes-agent requires an asset Id if you want to use a _Deployment_ instead of a _StatefulSet_.

## Installation

Create a file `namespace.yaml`:

```yaml
apiVersion: v1
kind: Namespace
metadata:
  name: monitoring
```

Create a new file for a service account, `service_account.yaml`:

```yaml
apiVersion: v1
kind: ServiceAccount
metadata:
  name: infrasonar
  namespace: monitoring
```

Create a new file `cluster_role.yaml`:

```yaml
kind: ClusterRole
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: infrasonar
rules:
- apiGroups: ["metrics.k8s.io", "apiregistration.k8s.io", ""]
  resources: ["pods", "namespaces", "nodes", "apiservices"]
  verbs: ["list"]
```

Create a new file for the cluster role binding, `cluster_role_binding.yaml`:

```yaml
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

Apply the files above:


```bash
kubectl apply -f namespace.yaml
kubectl apply -f service_account.yaml
kubectl apply -f cluster_role.yaml
kubectl apply -f cluster_role_binding.yaml
```

### Deployment

If you have already have an asset or manually want to create an asset in InfraSonar, you just need the asset Id and use a Deployment.
It is also possible to let the agent create the asset for you, in that case you should skip this part and read the [stateful-set](#statefulset) section.

Create a file `deployment.yaml`:

```yaml
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

Use a stateful-set _only_ if you want the agent to create the asset for you, otherwise use a [deployment](#deployment).

Create a file `stateful_set.yaml`:

```yaml
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

Apply the _statefulset_:

```bash
kubectl apply -f stateful_set.yaml
```


## Cleanup

When you no longer want to use the Kubernetes agent, it can be removed with the following steps:

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
kubectl delete ServiceAccount infrasonar --namespace=monitoring
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
