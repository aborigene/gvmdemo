# Use the official GraalVM image
#FROM ghcr.io/graalvm/graalvm-ce:latest
FROM arm64v8/oraclelinux:9

# Install native-image
#RUN gu install native-image

# Set the working directory
WORKDIR /app

# Copy the application source code
COPY . .

# Build the application
RUN ./mvnw clean package 

#install GraalVM JDK
COPY graalvm-jdk-21_linux-aarch64_bin.tar.gz .

RUN tar -xvzf graalvm-jdk-21_linux-aarch64_bin.tar.gz 

RUN ls -l target/

ENV DT_LOGCON_PROC=stdout

ENV DT_LOGLEVEL_PROC=config=debug,pgid=deb

# Run the native executable
CMD ["graalvm-jdk-21.0.5+9.1/bin/java", "-jar", "./target/gvmdemo-0.0.1-SNAPSHOT.jar"]
