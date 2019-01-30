set -e
docker build . -t analyze-catalog
docker run \
    --rm \
    --volume /c/Users/${USER}/AppData/Local/Temp:/working \
    analyze-catalog
