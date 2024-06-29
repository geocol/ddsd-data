CURL = curl

all:

ciconfig:
	$(CURL) -sSLf https://raw.githubusercontent.com/wakaba/ciconfig/master/ciconfig | RUN_GIT=1 REMOVE_UNUSED=1 perl

build-github-pages:
	mkdir -p local
	docker run -v `pwd`/local:/local --user `id --user` $$DDSDRUN_DOCKER_IMAGE cp -R /app/data /local/ddsddata-data
	mv local/ddsddata-data/snapshots ./
	mv local/ddsddata-data/indexes ./
	rm -fr local

## License: Public Domain.
