
.PHONY: test_build
test_build:
	cd cmd/router && go build main.go && rm main

.PHONY: local_build
local_build:
	cd cmd/router && go get -v -t -d ./...
	cd cmd/router && GOOS=linux GOARCH=amd64 go build -o svc main.go && chmod +x svc
	cd cmd/router && podman build -t txsvc-hq/txsvc-hq/router .
	cd cmd/router && rm svc