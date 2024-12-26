#!/bin/bash
echo "Starting load gen..."
while [ true ]
do
    echo "Making a resquest..."
    curl $REST_SERVICE_SERVICE_HOST:$REST_SERVICE_SERVICE_PORT/hello
    sleep 1
done

