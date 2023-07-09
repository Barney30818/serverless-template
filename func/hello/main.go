package main

import (
	"adc.github.trendmicro.com/container-security/vcs-inventory/pkg/inventory"
	"github.com/aws/aws-lambda-go/lambda"
)

func main() {
	handler := inventory.NewHandler()
	lambda.Start(handler.HandleRequest)
}
