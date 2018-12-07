default: docker_build

DOCKER_IMAGE ?= dpguk/istio
DOCKER_TAG ?= 1.0.4

build:
	@docker build \
	  --build-arg VCS_REF=`git rev-parse --short HEAD` \
	  --build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` \
	  -t $(DOCKER_IMAGE):$(DOCKER_TAG) .
	  
push:
	# Push to DockerHub
	docker push $(DOCKER_IMAGE):$(DOCKER_TAG)

interactive:
	docker run -it -v ~/.kube:/root/.kube $(DOCKER_IMAGE):$(DOCKER_TAG)
