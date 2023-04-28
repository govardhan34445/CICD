FROM maven:latest as maven_builder
WORKDIR /app
COPY . .
RUN mvn clean package && cd target && ls -al

FROM tomcat:8.5.43-jdk8
RUN rm -rf /usr/local/tomcat/webapps/manager/META-INF/context.xml && rm -rf /usr/local/tomcat/conf/tomcat-users.xml
COPY tomcat-users.xml /usr/local/tomcat/conf/
COPY context.xml /usr/local/tomcat/webapps/manager/META-INF/
COPY --from=maven_builder /app/target/*.war /usr/local/tomcat/webapps
