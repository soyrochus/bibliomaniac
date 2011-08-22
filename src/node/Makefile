# Makefile for Coffeescript / Node.js version of Bibliomaniac
CF=coffee
CFLAGS=-c
CWATCH=-w
SRC=*.coffee
TESTSRC=test/*.coffee
MAIN=main.js
NODE=node
NPM=npm
MODULES=coffee-script vows

.PHONY: show all run compile compile-tests watch run-tests docs clean 

show:
	@echo "make all          : build all files"
	@echo "     run          : run application"
	@echo "     deps         : install node packages needed to build & run the application"
	@echo "     compile      : compile all coffeescript files to javascript"
	@echo "     compile-tests: as above; for test files"
	@echo "     watch        : compile all and watch for changes; compile as needed"
	@echo "     runt-tests   : compile all and run tests"
	@echo "     docs         : generate docco documentation"
	@echo "     clean        : cleanup"

all: compile compile-tests docs run-tests deps

run: compile
	${NODE} ${MAIN}

compile:
		${CF} ${CFLAGS} ${SRC}

deps:
		${NPM} install ${MODULES}

compile-tests:
		${CF} ${CFLAGS} ${TESTSRC}

watch:
		${CF} ${CFLAGS} ${CWATCH} ${SRC} ${TESTSRC}

run-tests:
		vows --spec test/*.js

docs:
		docco ${SRC} #${TESTSRC}
clean:
		rm *.js test/*.js
		rm -rf docs/*
