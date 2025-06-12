# Создаем структуру папок
mkdir -p my-java-website/src/main/java/com/example
mkdir -p my-java-website/src/main/webapp/WEB-INF

# Создаем файлы
# 1. App.java
cat > my-java-website/src/main/java/com/example/App.java << 'EOF'
package com.example;

public class App {
    // Класс оставляем, но не используем в этой версии
}
EOF

# 2. index.html
cat > my-java-website/src/main/webapp/index.html << 'EOF'
<!DOCTYPE html>
<html>
<head>
    <title>Fullscreen Clock</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #000;
            color: #0f0;
            font-family: monospace;
            font-size: 10vw;
        }
    </style>
</head>
<body>
    <div id="clock"></div>

    <script>
        function updateClock() {
            const now = new Date();
            const timeString = now.toLocaleTimeString();
            document.getElementById('clock').textContent = timeString;
        }

        // Обновляем часы каждую секунду
        setInterval(updateClock, 1000);
        
        // Инициализация сразу
        updateClock();
    </script>
</body>
</html>
EOF

# 3. web.xml
cat > my-java-website/src/main/webapp/WEB-INF/web.xml << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<web-app version="3.1" xmlns="http://xmlns.jcp.org/xml/ns/javaee"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_3_1.xsd">
</web-app>
EOF

# 4. pom.xml
cat > my-java-website/pom.xml << 'EOF'
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>

    <groupId>com.example</groupId>
    <artifactId>my-java-website</artifactId>
    <version>1.0-SNAPSHOT</version>
    <packaging>war</packaging>

    <properties>
        <maven.compiler.source>11</maven.compiler.source>
        <maven.compiler.target>11</maven.compiler.target>
        <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
    </properties>

    <dependencies>
        <dependency>
            <groupId>javax.servlet</groupId>
            <artifactId>javax.servlet-api</artifactId>
            <version>4.0.1</version>
            <scope>provided</scope>
        </dependency>
    </dependencies>

    <build>
        <finalName>myapp</finalName>
    </build>
</project>
EOF

# 5. Dockerfile
cat > my-java-website/Dockerfile << 'EOF'
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
EOF

# Проверяем структуру
tree my-java-website
