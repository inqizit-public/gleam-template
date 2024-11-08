

CWD := $(shell pwd)
DIST := ${CWD}/dist


run:
	gleam run -m lustre/dev start
.PHONY: run

build: tailwind
	gleam run -m lustre/dev build app
.PHONY: build

dist: 
	rm -rf ${DIST}
	echo ${DIST}
	mkdir  ${DIST}
	gleam run -m lustre/dev build app --outdir=dist --minify=true
	cp ${CWD}/deploy/prod/html/index.html ${DIST}/index.html 

deploy-web: dist
	-rm -rf tmp
	git clone --depth 1 https://github.com/inqizit-public/gleam-template.git tmp
	cd tmp; git checkout --orphan gh-pages; rm -rf *; cp ${DIST}/* .; git add .; git commit -m "deploy"; git push --set-upstream origin gh-pages --force;
	-rm -rf tmp

