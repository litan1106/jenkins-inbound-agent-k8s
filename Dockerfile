FROM jenkins/inbound-agent:4.7-1
# Websocket broke on JDK11

ARG user=jenkins

USER root

# Install kubectl from Docker Hub.
COPY --from=lachlanevenson/k8s-kubectl:v1.20.5 /usr/local/bin/kubectl /usr/local/bin/kubectl
# Install helm cli from Docker Hub.
COPY --from=lachlanevenson/k8s-helm:v3.5.3 /usr/local/bin/helm /usr/local/bin/helm

USER ${user}
