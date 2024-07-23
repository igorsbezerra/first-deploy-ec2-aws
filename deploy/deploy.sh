#!/bin/bash

# Atualiza pacotes
sudo yum update -y

# Instala o Java 11 (Amazon Corretto)
sudo yum install java-21-amazon-corretto-headless -y

# Instala o Git e o wget (se necessário)
sudo yum install git wget -y

# Instala o Maven
wget -O maven.tar.gz https://dlcdn.apache.org/maven/maven-3/3.9.8/binaries/apache-maven-3.9.8-bin.tar.gz
tar -xvzf maven.tar.gz
rm -rf maven.tar.gz
sudo mv apache-maven-3.9.8 /opt/maven/
export M2_HOME=/opt/maven
export MAVEN_HOME=/opt/maven
export PATH=${M2_HOME}/bin:${PATH}

# Clona o repositório do GitHub
git clone https://github.com/igorsbezerra/first-deploy-ec2-aws.git
cd first-deploy-ec2-aws/

# Compila o projeto com Maven
mvn clean package

# Executa o JAR do Spring Boot
java -jar target/first-deploy-ec2-aws-0.0.1.jar