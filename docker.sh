(
    export $(aws-vault exec rafael-root -- env | grep ^AWS | xargs) && \
      docker run --rm -ti -e AWS_SESSION_TOKEN=$AWS_SESSION_TOKEN terraform deploy.sh
)
