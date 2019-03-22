FROM golang:1.9.2

# Setup environment variables
ENV GCS_BUCKET <your_bucket_name>
ENV ES_URL <your_elasticsearch_url>

# Define working directory
WORKDIR /go/src/github.com/bruce_laioffer/around


# Add files from your laptop to inside the docker image
ADD . /go/src/github.com/bruce_laioffer/around

# Install dependencies
RUN go get -v \
cloud.google.com/go/bigtable \
cloud.google.com/go/storage \
github.com/auth0/go-jwt-middleware \
github.com/dgrijalva/jwt-go \
github.com/go-redis/redis \
github.com/gorilla/mux \
github.com/olivere/elastic \
github.com/pborman/uuid \
github.com/pkg/errors \
golang.org/x/oauth2/google

# Expose port
EXPOSE 8080

# Entrypoint
CMD ["/usr/local/go/bin/go", "run", "main.go" ]

