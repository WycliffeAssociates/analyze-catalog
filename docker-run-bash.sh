docker build -t analyze-catalog .
docker run \
    -it \
    --rm \
    --volume /tmp/working:/working \
    --entrypoint=/bin/bash \
    analyze-catalog
