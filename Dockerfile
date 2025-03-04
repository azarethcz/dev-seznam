# Použití obrazu Temurin JDK (Java 17)
FROM eclipse-temurin:17-jdk AS build

# Nastavení pracovního adresáře
WORKDIR /app

# Zkopírování souborů projektu do kontejneru
COPY . .

# Sestavení aplikace pomocí Gradle
RUN ./gradlew clean build --no-daemon

# Použití menšího JRE runtime pro běh aplikace
FROM eclipse-temurin:17-jre

# Nastavení pracovního adresáře
WORKDIR /app

# Kopírování sestavených souborů z fáze `build`
COPY --from=build /app/build/libs /app/libs

# Exponování portu
EXPOSE 9400

# Spouštíme Aplkaci
CMD ["java", "-cp", "/app/libs/*", "Main"]

