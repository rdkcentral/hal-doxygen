# Module Documentation

# History

|Version|Date (YY-MM-DD) |Comments|Author|
|-------|----------------|------|-----|
|0.1 (Draft)| 22/07/21 | Draft| G. Weatherup|


# Overview

As part of the requirement in creating a code module, it must be documented.

This class creates a common framework for including documentation in a common way.

- Template Location - https://github.com/comcast-sky/rdk-components-hal-doxygen

# Structure

The structure of repo of the surrounding module is expected to be :-

```
.
├── CONTRIBUTING.md             -> To include in the docs, if present
├── docs
│   ├── build                   -> This git repo
│   ├── generate_docs.sh        -> module script to call ./build/Makefile
│   ├── output                  -> Output Directory
│   ├── pages
├── include                     -> Location of include files
├── LICENSE                     -> To include in the docs, if present
└── NOTICE                      -> To include in the docs, if present

```