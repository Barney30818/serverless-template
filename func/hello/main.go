package main

import (
	"github.com/Barney30818/serverless-template/pkg/hello"
	"github.com/aws/aws-lambda-go/lambda"
)

func main() {
	handler := hello.NewHandler()
	lambda.Start(handler.HandleRequest)
}
