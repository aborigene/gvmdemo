# Use the official GraalVM image
#FROM ghcr.io/graalvm/graalvm-ce:latest
FROM arm64v8/oraclelinux:9
#FROM arm64v8/maven:
# FROM arm64v8/maven:3.9.9-eclipse-temurin-21 AS build

# Install native-image
#RUN gu install native-image

# Set the working directory
# WORKDIR /app

# # Copy the application source code
# COPY . .

# # # decompress maven
# # RUN tar -xvzf apache-maven-3.9.9-bin.tar.gz

# # ENV PATH="$PATH:/app/apache-maven-3.9.9/bin"




# #RUN dnf install java-21-openjdk.aarch64

# # # Build the application
# RUN mvn clean package 

# FROM arm64v8/oraclelinux:9
# COPY --from=build /app/target/gvmdemo-0.0.1-SNAPSHOT.jar /app/app.jar

# WORKDIR /app

# # #install GraalVM JDK
# COPY graalvm-jdk-21_linux-aarch64_bin.tar.gz .

# RUN tar -xvzf graalvm-jdk-21_linux-aarch64_bin.tar.gz 

# # RUN ls -l target/

# ENV DT_LOGCON_PROC=stdout

# ENV DT_LOGLEVEL_PROC=config=debug,pgid=deb

# EXPOSE 8080

# Run the native executable
WORKDIR /
COPY loadGen.sh .
RUN chmod 755 loadGen.sh
CMD ["./loadGen.sh"]
