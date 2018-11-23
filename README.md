# docker-istio
Istio, helm and kubectl running on top of alpline with bash for use with kubernetes clusters
## Overview

This lightweight alpine docker image provides the istio install files with istioctl, kubectl and helm binaries for working with a Kubernetes cluster.

A local configured kubectl is a prerequisite to use helm per [helm documentation](https://github.com/kubernetes/helm/blob/master/docs/quickstart.md).  This image is useful for general helm administration such as deploying helm charts and managing releases. 

Having bash installed allows for better support for troubleshooting by being able to exec / terminal in and run desired shell scripts.  

Git installed allows installation of [helm plugins](https://github.com/kubernetes/helm/blob/master/docs/plugins.md).

If it is desired to only use kubectl and have kubectl as the entry command (versus this image as bash entry command), I recommend checking out this image instead:
[lachlanevenson/kubectl](https://hub.docker.com/r/lachlanevenson/k8s-kubectl/)

## Run

Examples
`docker run --rm dpguk/istio helm`  
`docker run --rm dpguk/istio kubectl`  
`docker run --rm dpguk/istio istioctl`
  
By default kubectl will try to use /root/.kube/config file for connection to the kubernetes cluster, but does not exist by default in the image.

Example for use with personal administration or troubleshooting with volume mount for kubeconfig files:  
`docker run -it -v ~/.kube:/root/.kube dpguk/istio`  
The -v maps your host docker machine Kubernetes configuration directory (~/.kube) to the container's Kubernetes configuration directory (root/.kube).

## Build

For doing a manual local build of the image:  
`make docker_build`
