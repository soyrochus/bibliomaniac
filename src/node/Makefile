# Makefile for Coffeescript / Node.js version of Bibliomaniac
CF=coffee
CFLAGS=-c
CWATCH=-w
SRC=*.coffee
TESTSRC=test/*.coffee

.PHONY: show all compile compile-tests watch run-tests docs clean

show:
	@echo "make all          : build all files"
	@echo "     compile      : compile all coffeescript files to javascript"
	@echo "     compile-tests: as above; for test files"
	@echo "     watch        : compile all and watch for changes; compile as needed"
	@echo "     runt-tests   : compile all and run tests"
	@echo "     docs         : generate docco documentation"
	@echo "     clean        : cleanup"

all: compile compile-tests docs run-tests

compile:
		${CF} ${CFLAGS} ${SRC}

compile-tests:
		${CF} ${CFLAGS} ${TESTSRC}

watch:
		${CF} ${CFLAGS} ${CWATCH} ${SRC} ${TESTSRC}

run-tests:
		vows --spec test/*.js

docs:
		docco ${SRC} ${TESTSRC}
clean:
		rm *.js test/*.js
		rm -rf docs/*
