# Použití základního obrazu Noble
FROM ubuntu:noble

# Nastavení proměnné prostředí pro neinteraktivní instalaci
ENV DEBIAN_FRONTEND=noninteractive

# Instalace potřebných balíčků (wget, curl, git, openjdk a gradle)
RUN apt-get update && \
    apt-get install -y \
    wget \
    jq \
    ca-certificates \
    curl \
    unzip \
    git \
    openjdk-21-jdk \
    gradle \
    && rm -rf /var/lib/apt/lists/*

# Nastavení prostředí pro JDK
ENV JAVA_HOME=/usr/lib/jvm/java-21-openjdk-amd64
ENV PATH=$JAVA_HOME/bin:$PATH

# Ověření instalace Javy a Gradle
RUN java -version
RUN gradle -v

# Nastavení pracovní složky pro aplikaci
WORKDIR /app

# Zkopírování souborů projektu (včetně gradle wrapperu a build.gradle)
COPY . .

# Ověření, že všechny soubory byly správně zkopírovány
RUN ls -alh /app

# Sestavení aplikace s podrobným výstupem
RUN gradle build --stacktrace > build_output.log || (echo "Chyba během build procesu!" && tail -n 50 build_output.log)

# Volitelně: Spuštění aplikace po úspěšném buildu
# CMD ["java", "-cp", "build/libs/*", "com.example.Main"]
