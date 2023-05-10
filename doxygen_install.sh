#!/usr/bin/env bash

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

# This script will pull the latest version of doxygen and install it locally for use

# Package Assumptions 
# - build-essentials
# - cmake
# - make

# At the time of writing the latest version is 1.9.5

git clone https://github.com/doxygen/doxygen.git
cd doxygen

mkdir build
cd build
cmake -G "Unix Makefiles" ..
make
make install