.PHONY: build run shell

SHELL := /bin/bash

build:
	docker build . -t analyze-catalog

run:
	test -n "$(AC_WORKING_DIR)" # $$AC_WORKING_DIR
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

update-gogs-json:
	@echo "About to download the latest additional_contents.json file from PROD to data/gogs.json."; \
	echo "Please enter username and password for Jenkins, or Ctrl-C to abort."; \
	read -p "Username: " USERNAME; \
	read -s -p "Password: " PASSWORD; \
	echo; \
	curl -u $$USERNAME:$$PASSWORD https://jenkins.walink.org/view/GOGS%20PROD/job/5_DW_BIEL_Feed_PROD/lastSuccessfulBuild/artifact/additional_contents.json > data/gogs.json
	
