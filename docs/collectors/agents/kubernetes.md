![Kubernetes](../../images/agent_kubernetes.png){ width="150" align=right}

# :simple-kubernetes: Kubernetes

## Introduction

The Kubernetes agent is designed to monitor your kubernetes cluster and should be deployed as a pod in your kubernetes cluster.

## Deployment

Create a file `namespace.yaml`:

```yaml
apiVersion: v1
kind: Namespace
metadata:
  name: monitoring
```

Create a new file `cluster_role.yaml`:

```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: infrasonar
rules:
- apiGroups: [""]
  resources:
  - nodes
  - services
  - endpoints
  - pods
  verbs: ["get", "list", "watch"]
- apiGroups:
  - extensions
  resources:
  - ingresses
  verbs: ["get", "list", "watch"]
```

Create a new file for a service account, `service_account.yaml`:

```yaml
apiVersion: v1
kind: ServiceAccount
metadata:
  name: infrasonar
  namespace: monitoring
```

Create a new file for the cluster role binding, `cluster_role_binding.yaml`:

```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: infrasonar
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: infrasonar
subjects:
- kind: ServiceAccount
  name: infrasonar
  namespace: monitoring
```

Apply the files above:


```bash
kubectl apply -f namespace.yaml
kubectl apply -f cluster_role.yaml
kubectl apply -f service_account.yaml
kubectl apply -f cluster_role_binding.yaml
```

If you have an asset Id, then a Deployment is sufficient. If you want the agent to create the asset for you, skip the deployment and use a [stateful-set](#statefulset).

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

### StatefulSet

Use a stateful-set _only_ if you want the agent to create the asset for you. In this case a volume is required so the agent can store the asset Id in a file to prevent creating one on every restart.

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
          storage: 5Mi
```

## Cleanup

If a deployment was used:

```bash
kubectl delete deployment infrasonar --namespace=monitoring
```

If a state-ful set was used:

```bash
kubectl delete sts infrasonar --namespace=monitoring
kubectl delete pvc -l app.kubernetes.io/name=infrasonar --namespace=monitoring
```

Cleanup the namespace, service account and associated role and binding:

```bash
kubectl delete ClusterRoleBinding infrasonar
kubectl delete ServiceAccount infrasonar
kubectl delete ClusterRole infrasonar
kubectl delete ns monitoring
```

## Additional information

:material-github: [Kubernetes agent source code](https://github.com/infrasonar/kubernetes-agent)
