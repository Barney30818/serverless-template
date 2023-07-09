.PHONY: build tidy clean fmt fmt-check test

# Get all function binaries for this code base
# Find all directories with .go files
TARGETS=$(sort $(dir $(wildcard func/*/*.go)))
HANDLERS=$(addsuffix handler,$(TARGETS))
ARTIFACT=bin/functions.zip
# add your aws profile
# AWS_PROFILE=xxxxx

build: $(ARTIFACT)

tidy: | node_modules/go.mod
	go mod tidy

$(ARTIFACT): $(HANDLERS)
	@mkdir -p $(dir $(ARTIFACT))
	zip $@ $(HANDLERS)

%/handler: %/*.go | node_modules/go.mod
	env GOARCH=amd64 GOOS=linux go build -ldflags="-s -w" -o $@ ./$*

# node_modules/go.mod used to ignore possible go modules in node_modules.
node_modules/go.mod:
	-@touch $@

clean:
	$(RM) $(HANDLERS) $(ARTIFACT)

fmt:
	gofmt -s -w .

fmt-check:
	@gofmt -s -d . > gofmt.out
	@test -s gofmt.out && (cat gofmt.out; echo "##### please fix gofmt error #####") || echo -n ''
	@test -s gofmt.out && exit 1 || exit 0

test:
	go generate ./...
	go test -v -cover $$(go list ./... | grep -v node_modules| grep -v docs)

deploy: clean build
	sls deploy --verbose -s barney -r us-east-1 --aws-profile ${AWS_PROFILE}