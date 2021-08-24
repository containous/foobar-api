FROM golang:alpine3.14
RUN mkdir /app
WORKDIR /app

COPY . .
RUN CGO_ENABLED=0 go build -a --trimpath --installsuffix cgo --ldflags="-s" -o whoami

EXPOSE 8443
CMD ["/app/whoami", "-port", "8443"]