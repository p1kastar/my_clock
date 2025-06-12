# Используем официальный образ Maven для сборки
FROM maven:3.8.4-openjdk-11 AS build
WORKDIR /app
COPY . .
RUN mvn clean package

# Используем Tomcat для запуска приложения
FROM tomcat:9.0-jdk11-openjdk
COPY --from=build /app/target/myapp.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
