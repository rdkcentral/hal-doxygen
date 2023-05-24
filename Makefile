# *
# * If not stated otherwise in this file or this component's LICENSE file the
# * following copyright and licenses apply:
# *
# * Copyright 2023 RDK Management
# *
# * Licensed under the Apache License, Version 2.0 (the "License");
# * you may not use this file except in compliance with the License.
# * You may obtain a copy of the License at
# *
# * http://www.apache.org/licenses/LICENSE-2.0
# *
# * Unless required by applicable law or agreed to in writing, software
# * distributed under the License is distributed on an "AS IS" BASIS,
# * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# * See the License for the specific language governing permissions and
# * limitations under the License.
# *

MAKE_PATH:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
PROJECT_PATH = $(shell dirname ${PWD})/../

export PROJECT_NAME = $(shell basename $(PROJECT_PATH))
export PROJECT_VERSION = "NOT SET"

DOXYGEN_CMD = doxygen

ifeq (, $(shell which $(DOXYGEN_CMD)))
$(error "Doxygen is not found in the PATH:$(PATH), install it with ./doxygen_install.sh")
endif

DOXYGEN_VERSION = $(shell $(DOXYGEN_CMD) -v | tr [:space:] '\n' | head -n1)

ifeq ("", DOXYGEN_VERSION)
$(error "Doxygen is not found in the PATH:$(PATH), install it with ./doxygen_install.sh")
endif

$(info $(echo -e doxygen version: \033[92m$(DOXYGEN_VERSION)\033[0m))

FILES = $(shell find ../../ -name "*.h") 
FILES += $(shell find ./pages -name "*.md")
FILES += $(shell find ../pages -name "*.md")
DEPS = Doxyfile.cfg DoxygenLayout.xml $(FILES)

all: $(DEPS)
	$(DOXYGEN_CMD) Doxyfile.cfg

vars:
	@echo PROJECT_NAME: $(PROJECT_NAME)
	@echo PROJECT_VERSION: $(PROJECT_VERSION)
	@echo PROJECT_PATH:$(PROJECT_PATH)
	@echo MAKE_PATH:$(MAKE_PATH)
	@echo DEPS:$(DEPS)

clean:
	@echo Cleaning output
	@rm -fr $(MAKE_PATH)/../output
	@mkdir -p $(MAKE_PATH)/../output
