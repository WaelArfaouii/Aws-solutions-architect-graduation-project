# AWS Solutions Architect – Associate Graduation Projects

**Author:** Wael Arfaoui
**Email:** [wael.arfaaoui@gmail.com](mailto:wael.arfaaoui@gmail.com)
**Profile:** [LinkedIn – Wael Arfaoui](https://www.linkedin.com/in/wael-arfaoui)

---

## 📘 Project Overview

This repository contains three AWS-based graduation projects designed to demonstrate proficiency in cloud architecture, scalability, and DevOps automation practices.

Each project includes:

* **Solution Architecture Diagram** (Lucidchart / Draw.io)
* **Documentation & Implementation Guide** (in README)
* **Infrastructure-as-Code (IaC)** templates (CloudFormation / Terraform)
* **Optional Demo:** Deployed or recorded demonstration on AWS

---

## 📁 Repository Structure

```bash
aws-graduation-projects/
│
├── project-1-scalable-webapp-alb-asg/
│   ├── architecture-diagram.png
│   ├── cloudformation-template.yaml
│   ├── README.md
│
├── project-2-serverless-image-processing/
│   ├── architecture-diagram.png
│   ├── lambda-function/
│   │   ├── index.js
│   │   └── package.json
│   ├── README.md
│
├── project-3-serverless-rest-api/
│   ├── architecture-diagram.png
│   ├── lambda-functions/
│   │   ├── createItem.js
│   │   ├── getItem.js
│   │   ├── updateItem.js
│   │   └── deleteItem.js
│   ├── README.md
│
└── README.md  # main overview file
```

---

## 🚀 Project 1: Scalable Web Application with ALB & Auto Scaling

**Architecture:** EC2-based

### 🧩 Description

Deploy a simple web application on AWS using EC2 instances behind an Application Load Balancer (ALB) with Auto Scaling Groups (ASG) for high availability and performance.

### 🏗️ AWS Services

* **EC2:** Launch instances for the web app.
* **Application Load Balancer (ALB):** Distributes traffic.
* **Auto Scaling Group (ASG):** Automatically scales based on load.
* **RDS (optional):** MySQL/PostgreSQL database with Multi-AZ.
* **IAM:** Role-based access control.
* **CloudWatch & SNS:** Monitoring and alerts.


---

## 🧠 Project 2: Serverless Image Processing with S3 & Lambda

**Architecture:** Serverless

### 🧩 Description

Create a serverless image processing app where users upload images to an S3 bucket, triggering a Lambda function that processes and resizes them before storing in another bucket.

### 🏗️ AWS Services

* **S3:** Store original and processed images.
* **Lambda:** Perform image processing (resize, watermarking, etc.).
* **API Gateway (optional):** Upload endpoint.
* **DynamoDB (optional):** Store metadata.
* **Step Functions (optional):** Manage multi-step workflows.


---

## 🌐 Project 3: Serverless REST API with DynamoDB & API Gateway

**Architecture:** Serverless

### 🧩 Description

Develop a serverless REST API to manage a to-do list or customer records using API Gateway, Lambda, and DynamoDB.

### 🏗️ AWS Services

* **API Gateway:** Create REST endpoints.
* **Lambda:** Implement CRUD logic.
* **DynamoDB:** Store data in a NoSQL database.
* **S3:** Host a simple web front-end.
* **CloudWatch:** Monitor API activity.
* **IAM:** Secure API operations.



## 👨‍💻 Author

**Wael Arfaoui**
Cloud & DevOps Engineer from Tunisia
📧 Email: [wael.arfaaoui@gmail.com](mailto:wael.arfaaoui@gmail.com)
🔗 [LinkedIn – Wael Arfaoui](https://www.linkedin.com/in/wael-arfaoui-2b5503213/)


