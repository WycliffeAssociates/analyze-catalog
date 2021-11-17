.PHONY: build run shell

build:
	docker build . -t analyze-catalog

run:
	docker run \
		--rm \
		--volume ${AC_WORKING_DIR}:/working \
		analyze-catalog

shell:
	docker run \
		-it \
		--rm \
		--volume /tmp/working:/working \
		--entrypoint=/bin/bash \
		analyze-catalog
