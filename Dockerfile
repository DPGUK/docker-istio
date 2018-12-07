FROM alpine

ARG VCS_REF
ARG BUILD_DATE

# Metadata
LABEL org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.name="helm-kubectl" \
      org.label-schema.url="https://hub.docker.com/r/dpguk/istio/" \
      org.label-schema.vcs-url="https://github.com/DPGUK/docker-istio" \
      org.label-schema.build-date=$BUILD_DATE

ENV KUBE_LATEST_VERSION="v1.11.3"
ENV HELM_VERSION="v2.11.0"
ENV  ISTIO_VERSION="1.0.4"
	

RUN apk add --no-cache ca-certificates bash git \
    && wget -q https://storage.googleapis.com/kubernetes-release/release/${KUBE_LATEST_VERSION}/bin/linux/amd64/kubectl -O /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl \
    && wget -q https://storage.googleapis.com/kubernetes-helm/helm-${HELM_VERSION}-linux-amd64.tar.gz -O - | tar -xzO linux-amd64/helm > /usr/local/bin/helm \
    && chmod +x /usr/local/bin/helm \
    && wget -q https://github.com/istio/istio/releases/download/${ISTIO_VERSION}/istio-${ISTIO_VERSION}-linux.tar.gz  \
    && tar -xvzf istio-${ISTIO_VERSION}-linux.tar.gz \
    && rm ./istio-${ISTIO_VERSION}-linux.tar.gz -f  \
    && apk add --no-cache ca-certificates openssl
    
    
WORKDIR /istio-${ISTIO_VERSION}

ENV PATH=/istio-${ISTIO_VERSION}/bin:$PATH

CMD bash