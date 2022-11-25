# Reproduce ExportFile Missing Error

This is an example program reproducing the a `could not load export data: no export data for...` golangci-lint error

Related issue: https://github.com/golangci/golangci-lint/issues/3376

## Running the Program

````shell
$ make run 
````

## Reproducing the Error

```shell
$ golangci-lint --version
golangci-lint has version 1.50.1 built from 8926a95f on 2022-10-22T10:50:47Z

$ golangci-lint run
WARN [runner] Can't run linter goanalysis_metalinter: buildir: failed to load package proj: could not load export data: no export data for "github.com/pebbe/go-proj-4/proj"
ERRO Running error: 1 error occurred:
	* can't run linter goanalysis_metalinter: buildir: failed to load package proj: could not load export data: no export data for "github.com/pebbe/go-proj-4/proj"
```
