package inventory

import (
	"log"

	"context"
	"net/http"

	"github.com/aws/aws-lambda-go/events"
)

type getHandler struct {
	// add client you need
}

func NewHandler() *getHandler {
	return &getHandler{}
}

func (h *getHandler) HandleRequest(ctx context.Context, request events.APIGatewayProxyRequest) (events.APIGatewayProxyResponse, error) {
	log.Printf("Processing Lambda request %s\n", request.RequestContext.RequestID)

	return events.APIGatewayProxyResponse{
		Body:       "Hello World",
		StatusCode: http.StatusOK,
	}, nil
}
