---
layout: page
title:  Deploying an Application Load Balancer with WAF using CloudFormation
permalink: /remediation-guides/alb-waf/
resource: true
categories: [Remediation Guides]
---

#  Deploying an Application Load Balancer with WAF using CloudFormation

This guide will walk you through deploying an Application Load Balancer (ALB) with optional Web Application Firewall (WAF) integration using a CloudFormation template. Deploying these resources offers several benefits:

- Improved security with WAF integration for protection against common web exploits
- Scalable and highly available load balancing for your applications
- Easy configuration of HTTPS and HTTP to HTTPS redirection
- Centralized logging of ALB access logs to S3
- Flexible health checks and sticky session options for target groups
- Optional DataDog monitoring integration

## Prerequisites

- An AWS account with necessary permissions
- Basic understanding of AWS services (ALB, WAF, CloudFormation)
- (Optional) An ACM certificate for HTTPS configuration

## Deployment Steps

1. **Access the CloudFormation Template**

   The template can be found at: [ALB with WAF Template](https://github.com/Cloud303/wafr-remediations/blob/main/cloudformation/ec2/alb-waf.yml)

2. **Launch CloudFormation Stack**

   - Go to the AWS CloudFormation console
   - Click "Create stack" and choose "With new resources (standard)"
   - Select "Upload a template file" and upload the downloaded template

3. **Configure Stack Parameters**

   Fill in the required parameters:

   - ALB Settings (name, type, deletion protection, HTTPS configuration)
   - Logging Settings (S3 log retention period)
   - Target Group Settings (EC2 instance, health check path, sticky sessions)
   - WAF Settings (enable/disable, Odoo-specific rules)
   - Network configuration (VPC, subnets)
   - Environment tagging
   - DataDog monitoring option

4. **Review and Create Stack**

   - Review your configuration
   - Acknowledge any capabilities if prompted
   - Click "Create stack"

5. **Monitor Stack Creation**

   - Wait for the stack creation to complete (this may take several minutes)
   - Check the "Events" tab for any issues during deployment

6. **Access Your Resources**

   - Once the stack is created, go to the "Outputs" tab
   - You'll find the ALB DNS name here, which you can use to access your application

## Post-Deployment Steps

1. **Configure DNS (Optional)**
   
   If you're using a custom domain, update your DNS settings to point to the ALB DNS name.

2. **Test Your Application**
   
   Access your application through the ALB to ensure it's working as expected.

3. **Monitor and Optimize**
   
   - Review ALB access logs in the S3 bucket
   - If enabled, check WAF rules and adjust as necessary
   - Monitor ALB metrics in CloudWatch or DataDog (if configured)

## Troubleshooting

- If the stack fails to create, check the "Events" tab for error messages
- Ensure all referenced resources (VPCs, subnets, EC2 instances) exist and are accessible
- Verify that the provided ACM certificate (if using HTTPS) is valid and in the correct region

By following this guide, you'll have a fully functional Application Load Balancer with optional WAF protection, providing a secure and scalable entry point for your web applications.
