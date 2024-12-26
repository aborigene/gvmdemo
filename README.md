### What is this repo

This is a simple hello world using GraalVM + SpringBoot. This is supposed to be a simple to deploy app to run tests and to point to Dynatrace for monitoring.

### Prereqs to run this lab

Before running it is important to download the following prerequisites:

1. GraalVM JDK
2. Apache MVN 3.9 for building the app inside the container
3. Opentelemtry java agent

Download all the files to the root of the repo. Be aware of the file names, it may be necessary to adjust the Dockerfile so the right filenames are used.

### How to run this lab

1. Build the application: ```docker build -t someapptag:v1 .```
2. Push the image to some repo: ```docker push someapptag:v1```
3. Create a token on Dynatrace to ingest opentelemetry metrics, traces and logs
4. Generate the authorization header: ```echo 'Authorization=Api-Token dt0c01.xxxx' | base64```
      1. Paste the value to the ```otel_auth_header``` part of the secret on the ```rest-service.yaml``` file.
5. Generate the endpoint part: ```echo 'https://fov31014.live.dynatrace.com/api/v2/otlp/v1/' | base64```
      1. Paste the value to the ```otel_endpoint``` part of the secret on the ```rest-service.yaml``` file.
6. Adjust the image on the ```rest-service.yaml``` file to tag build on the steps above
7. Create the namespace simple-rest: ```kubectl create ns simple-rest```
8. Deploy the app to that namespace: ```kubectl apply -f rest-service.yaml -n simple-rest```
9. Build the loadgen:
      1. ```cd loadgen```
      2. ```docker build -t someloadgentag:v1 .```
      3. Adjust the image on the ```loadgen.yaml``` file
10. Deploy the loadgen: ```kubectl apply -f loadgen.yaml -n simple-rest```

Dynatrace will automatically monitor this application and also collect OpenTel traces. If you want just OpenTelemetry, disable deep monitoring for this process on the UI.
