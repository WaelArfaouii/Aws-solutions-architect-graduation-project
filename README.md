# AWS Solutions Architect – Associate Graduation Projects

## **Author:** Wael Arfaoui

## **Email:** [wael.arfaaoui@gmail.com](mailto:wael.arfaaoui@gmail.com)

## **Profile:** [LinkedIn – Wael Arfaoui](https://www.linkedin.com/in/wael-arfaoui-2b5503213/)

---

## 📘 Project Overview

This repository contains three AWS-based graduation projects designed to demonstrate proficiency in **cloud architecture**, **scalability**, and **DevOps automation practices **.

Each project includes:

* **Solution Architecture Diagram** (to be displayed at the end of each project section)
* **Documentation & Implementation Guide** (in README)
* **Infrastructure-as-Code (IaC)** templates using **Terraform modules**
* **Optional Demo:** Deployed or recorded demonstration on AWS

---

## 📁 Repository Structure

```bash
Aws-solutions-architect-graduation-project/
│
├── project-1-scalable-webapp-alb-asg/
│   ├── modules/  # Terraform modules (EC2, ALB, ASG, RDS)
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── README.md
│   ├── architecture-diagram.png
│
├── project-2-serverless-image-processing/
│   ├── modules/  # Terraform modules (S3, Lambda, IAM, DynamoDB)
│   ├── lambda-function/
│   │   ├── index.js
│   │   └── package.json
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── README.md
│   ├── architecture-diagram.png
│
├── project-3-serverless-rest-api/
│   ├── modules/  # Terraform modules (API Gateway, Lambda, DynamoDB, S3)
│   ├── lambda-functions/
│   │   ├── createItem.js
│   │   ├── getItem.js
│   │   ├── updateItem.js
│   │   └── deleteItem.js
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── README.md
│   ├── architecture-diagram.png
│
└── README.md  # main overview file
```

---

## 🚀 Project 1: Scalable Web Application with ALB & Auto Scaling

**Architecture:** EC2-based

### 🧩 Description

Deploy a web application on AWS using **EC2 instances** behind an **Application Load Balancer (ALB)** with **Auto Scaling Groups (ASG)** for high availability. Infrastructure is managed via **Terraform modules**.

### 🏗️ AWS Services

* **EC2:** Launch instances for the web app.
* **Application Load Balancer (ALB):** Distributes traffic.
* **Auto Scaling Group (ASG):** Automatically scales based on load.
* **RDS :** PostgreSQL database with Multi-AZ.
* **IAM:** Role-based access control.
* **CloudWatch & SNS:** Monitoring and alerts.

### 📊 Architecture Diagram

![Project 1 Architecture](./project-1-scalable-webapp-alb-asg/architecture-diagram.png)

---

## 🧠 Project 2: Serverless Image Processing with S3 & Lambda

**Architecture:** Serverless

### 🧩 Description

A serverless image processing application where uploads to an **S3 bucket** trigger a **Lambda function** that processes and resizes images, all orchestrated using **Terraform modules**.

### 🏗️ AWS Services

* **S3:** Store original and processed images.
* **Lambda:** Perform image processing (resize, watermarking, etc.).
* **API Gateway :** Upload endpoint.
* **DynamoDB :** Store metadata.
* **Step Functions :** Manage multi-step workflows.

### 📊 Architecture Diagram

![Project 2 Architecture](./project-2-serverless-image-processing/architecture-diagram.png)

---

## 🌐 Project 3: Serverless REST API with DynamoDB & API Gateway

**Architecture:** Serverless

### 🧩 Description

Develop a **serverless REST API** for a to-do list or customer records using **API Gateway**, **Lambda**, and **DynamoDB**, with all infrastructure provisioned via **Terraform modules**.

### 🏗️ AWS Services

* **API Gateway:** Create REST endpoints.
* **Lambda:** Implement CRUD logic.
* **DynamoDB:** Store data in a NoSQL database.
* **S3:** Host a simple web front-end.
* **CloudWatch:** Monitor API activity.
* **IAM:** Secure API operations.

### 📊 Architecture Diagram

![Project 3 Architecture](./project-3-serverless-rest-api/architecture-diagram.png)

---

## 👨‍💻 Author

**Wael Arfaoui**
**Cloud & DevOps Engineer** from Tunisia
📧 Email: [wael.arfaaoui@gmail.com](mailto:wael.arfaaoui@gmail.com)
🔗 [LinkedIn – Wael Arfaoui](https://www.linkedin.com/in/wael-arfaoui-2b5503213/)
