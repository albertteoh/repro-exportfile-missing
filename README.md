# Reproduce No Export Data Error

This is an example program reproducing the a `could not load export data: no export data for...` golangci-lint error

Related issue: https://github.com/golangci/golangci-lint/issues/3376

## Running the Program

````shell
$ make run 
````

## Reproducing the Error

UPDATE: The problem is because this example relies on a library that uses CGO
to wrap the Proj library.
As the library was not installed locally, the export files weren't generated
by the GC compiler.
I've since modified the Dockerfile to install golangci-lint v1.50.1 and ran
golangci-lint within the container itself and the error no longer appears.


```shell
$ golangci-lint --version
golangci-lint has version 1.50.1 built from 8926a95f on 2022-10-22T10:50:47Z

$ golangci-lint run
WARN [runner] Can't run linter goanalysis_metalinter: buildir: failed to load package proj: could not load export data: no export data for "github.com/pebbe/go-proj-4/proj"
ERRO Running error: 1 error occurred:
	* can't run linter goanalysis_metalinter: buildir: failed to load package proj: could not load export data: no export data for "github.com/pebbe/go-proj-4/proj"
```
