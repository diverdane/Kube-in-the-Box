# Copyright 2018 The Kubernetes Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

VERSION = $(shell date +v%Y%m%d)-$(shell git describe --tags --always --dirty)

IMG = "diverdane/kube-in-the-box"

all: image

image:
	docker build --no-cache -t "$(IMG):$(VERSION)" .

push: image
	gcloud docker -- push "$(IMG):$(VERSION)"

.PHONY: all image push
