FROM maven as build
WORKDIR /app
COPY . .
RUN mvn install

FROM openjdk:8-jdk-alpine
WORKDIR /app
COPY --from=build /app/target/helloworld.jar /app/
EXPOSE 9090
CMD [ "java","-jar","helloworld.jar" ]
