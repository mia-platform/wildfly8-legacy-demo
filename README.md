Demo for immporting Java Application that run on WildFly 8 in Mia-Platform
====================

This repository has been cloned and modified from the original https://github.com/wildfly/quickstart/tree/8.x
We choose an older version of Java and Wildfly to demonstrate the import.

For more information about all application see original repo.

Here we adapted the repo to run on Ubuntu, Wildfly 8 using GitHub and Jenkins.

# Quick Setup on Ubutu

Login to your ubuntu machine and run the following commands

```
sudo apt-get update
sudo apt-get install openjdk-8-jdk
sudo apt-get install openjdk-11-jdk
sudo apt-get install openjdk-21-jdk
```

Use `sudo update-java-alternatives  -l` to select the correct JDK

- JDK 8 for the Hello World
- JDK 11 for Wildfly
- JDK 21 for Jenkins

Clone this repo

```
git clone git@github.com:mia-platform/wildfly8-legacy-demo.git
```

Build the application with JDK8

```
mvn clean package
```

Install wildfly 

```
wget https://download.jboss.org/wildfly/8.0.0.Final/wildfly-8.0.0.Final.tar.gz
tar xvzf wildfly-8.0.0.Final.tar.gz
sudo mv wildfly-8.0.0.Final /opt/
sudo mv /opt/wildfly-8.0.0.Final /opt/wildfly
cd /opt/wildfly/bin/
sudo ./add-user.sh
sudo ./standalone.sh
```

Go to java-application-dir/helloworld and deploy it to wildfly

```
mvn clean package wildfly:deploy
```

Install Jenkins using the following instructins (https://www.jenkins.io/doc/book/installing/linux/#debian-stable)[]

Go to your PC and launch 3 terminals for ssh tunneling

```
ssh -i ~/.ssh/your-pem.pem -L 9990:127.0.0.1:9990 user@linux-host
ssh -i ~/.ssh/your-pem.pem -L 8080:127.0.0.1:8080 user@linux-host
ssh -i ~/.ssh/your-pem.pem -L 9090:127.0.0.1:9090 user@linux-host
```

Now you can open on your PC the following

- Wildfly admin: (http://127.0.0.1:9990/console/)[]
- Hello World endpoint: (http://localhost:8080/wildfly-helloworld/HelloWorld)[]
- Jenkins: (http://localhost:9090/)[]

# Import in Mia-Platform

TBD
