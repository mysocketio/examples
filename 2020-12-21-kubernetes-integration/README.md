This is an example Kubernetes worload definition used as part of our Dec22 2020 blog post "Global load balancing with Kubernetes and Mysocket".
https://www.mysocket.io/

First download the mysocketd controller from https://github.com/mysocketio/kubernetes_controller/blob/main/mysocketd.yaml

Make sure to update line 14,15 and 16 with the correct mysocket credentials.  Then deploy the controller:


```kubectl apply -f mysocketd.yaml```

Next: start a demo workload

```kubectl apply -f demo-deploy.yaml```

Then validate all pods have started

```kubectl get pods -n demo-app```

Then we'll start the Service, to provide one logical entry point (in-cluser load balancer) for the deployment we just created:

```kubectl apply -f demo-service.yaml```

Validate with:

```kubectl get service -n demo-app```

