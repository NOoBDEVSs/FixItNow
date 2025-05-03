
# 📘 FixItNow – AWS Highly Available Web Application Architecture

## 🗂 Overview
This architecture demonstrates a fault-tolerant, scalable, and secure web application deployed on AWS, incorporating the following key services:

- **Route 53**
- **AWS WAF**
- **Application Load Balancer**
- **EC2 with Auto Scaling**
- **RDS with standby and read replica**
- **S3**
- **SQS/SNS**
- **Public and Private Subnets with NAT Gateways**

---

## 🧭 Step-by-Step Flow

### 1. **User Access via Route 53**
- Users make a DNS request.
- **Route 53** routes traffic to the domain and applies routing policies (like latency-based or geolocation routing).

### 2. **Web Application Firewall (AWS WAF)**
- Traffic is filtered using **AWS WAF** to block malicious traffic (SQLi, XSS, etc.).

### 3. **Internet Gateway (IGW)**
- WAF-validated traffic enters the VPC through the **Internet Gateway**.

### 4. **Load Balancing**
- Traffic hits the **Application Load Balancer (ALB)**, which distributes it across multiple EC2 instances in the Auto Scaling Group.

### 5. **Private Subnets – EC2**
- The **EC2 instances**, hosted in private subnets for security, serve the application backend.
- These instances scale automatically based on load using an **Auto Scaling Group**.

### 6. **RDS Database Layer**
- Application stores data in **RDS** (Relational Database Service).
- Includes:
  - **Primary DB instance** in one availability zone
  - **Standby instance** in another AZ (Multi-AZ failover)
  - **Read replica** for read-heavy workloads

### 7. **Object Storage with S3**
- Static assets (e.g., images, videos) are stored and accessed via **Amazon S3**.

### 8. **Asynchronous Messaging**
- **SQS (Simple Queue Service)** decouples the processing components.
- Messages from EC2 instances are sent to SQS, then notifications can be forwarded via **SNS (Simple Notification Service)**.

### 9. **Outbound Traffic**
- EC2 instances in private subnets use **NAT Gateways** in public subnets to access the internet (e.g., for software updates).

---

## 🔐 Security Features

- **Private subnets** for EC2 and RDS ensure no direct internet access.
- **Security groups and NACLs** restrict inbound and outbound traffic.
- **AWS WAF** filters and protects from common attacks.
- **S3 bucket policies** and encryption protect object data.

---

## ✅ Prerequisites

- A registered domain in **Route 53**
- IAM roles configured for all services
- VPC with subnets configured across at least two Availability Zones
- EC2 AMI built with your application
- S3 buckets configured for static content
- RDS instance initialized and migrated with schema/data
- Setup of SQS and SNS topics with proper permissions

---

### 🧪 Setting Up the Project


## 🚀 Deploying Infrastructure to AWS with Terraform

### Prerequisites
- Install [Terraform](https://www.terraform.io/downloads)
- Install [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)
- Configure AWS credentials:
  ```bash
  aws configure
  ```

### Steps to Deploy

1. **Initialize Terraform**
   ```bash
   terraform init
   ```

2. **Validate the Configuration**
   ```bash
   terraform validate
   ```

3. **Review the Execution Plan**
   ```bash
   terraform plan
   ```

4. **Apply the Infrastructure Changes**
   ```bash
   terraform apply
   ```

5. **Destroy (Optional)**
   To tear down all resources:
   ```bash
   terraform destroy
   ```

> ⚠️ Make sure you have the correct AWS region and credentials before applying.


# FixItNow Frontend

A React-based frontend application for managing Jobs.

---

## 🚀 Running the React Project

### 📦 Prerequisites

Make sure you have the following installed:

- [Node.js](https://nodejs.org/) (LTS recommended)
- [npm](https://www.npmjs.com/) or [yarn](https://yarnpkg.com/) package manager


### ⚙️ Installation

1. **Clone the Repository**

```
git clone https://github.com/your-username/your-repo-name.git
cd your-repo-name
```

2. **Install Dependencies**
Using npm:

```
npm install
```

Or with yarn:

```
yarn
```


### 🧪 Running the App Locally

```
npm start
```

Or:

```
yarn start
```

This will start the development server and open the app in your default browser at `http://localhost:3000`.

### 🏗️ Building for Production

To create an optimized production build:

```
npm run build
```

Or:

```
yarn build
```

The build artifacts will be stored in the `build/` directory.

### 🧹 Optional: Clean Install

To remove `node_modules` and reinstall:

```
rm -rf node_modules
npm install
```


# FixItNow Backend - Spring Boot

This is a Java-based Spring Boot backend for the Employee Management application.

---

## 🚀 Running the Spring Boot Project

### 📦 Prerequisites

Make sure you have the following installed:

- Java Development Kit (JDK) 17 or newer is recommended
- [Maven](https://maven.apache.org/) build tool

### ⚙️ Installation &amp; Setup

1. **Clone the Repository**
```

git clone https://github.com/your-username/repository.git
cd repository

```

2. **Build the Project**
```

mvn clean install

```

### 🧪 Running the Application

You can run the Spring Boot application in two main ways:

#### Using Maven

```

mvn spring-boot:run

```
This will start the application, typically available at `http://localhost:8080` by default.

#### Using the Packaged JAR

1. Build the JAR file:
```

mvn clean package

```
The JAR will be generated in the `target/` directory.

2. Run the JAR:
```

java -jar target/your-app-name.jar

```

### 🛑 Stopping the Application

- Press `Ctrl+C` in the terminal to gracefully stop the server.

---

## 📁 Project Structure

- `src/` - Source code
- `pom.xml` - Maven configuration
- `.mvn/` - Maven wrapper files
- `target/` - Compiled output (generated after build)
- `mvnw`, `mvnw.cmd` - Maven wrapper scripts

---

## 📝 Notes

- You can import this Maven project directly into most Java IDEs (e.g., IntelliJ IDEA, Eclipse).
- By default, the backend runs on port 8080. You can change this in `application.properties` if needed.

---

This README provides clear, step-by-step instructions for launching and working with your Java Spring Boot backend project.