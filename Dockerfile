FROM golang:latest 

# set the current working directory inside container
WORKDIR /docker-exam
# cop go mod & sum file
COPY go.mod go.sum ./
# downdload all the dependecies. dependencies will be cached if the go.mod and go.sum file are not changed 
RUN go nom download 
# copy the source directory to the working directory inside the container
COPY . . 
# EXPOSE the app 
EXPOSE 8080
# build the GO app 
RUN go build -c main.go .
# command to executeable
CMD ./main.go