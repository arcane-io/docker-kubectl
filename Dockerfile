FROM google/cloud-sdk:alpine

RUN apk add --update --no-cache \
            bash \
            gpgme \
            openssh-client \
            curl \
            jq 

ENV PATH $PATH:/google-cloud-sdk/bin

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl \
    && chmod +x ./kubectl \
    && mv ./kubectl /usr/local/bin/kubectl

ENTRYPOINT [ "/bin/bash", "-l", "-c" ]