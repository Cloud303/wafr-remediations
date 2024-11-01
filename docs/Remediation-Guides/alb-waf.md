---
layout: page
title:  Deploying an Application Load Balancer with WAF using CloudFormation
permalink: /remediation-guides/alb-waf/
resource: true
categories: [Remediation Guides]
---

#  Deploying an Application Load Balancer with WAF using CloudFormation

This guide will walk you through the process of deploying an Application Load Balancer (ALB) with optional Web Application Firewall (WAF) integration using a CloudFormation template.

## Prerequisites

- An AWS account with appropriate permissions
- Basic understanding of AWS services (ALB, WAF, EC2, S3)
- AWS CLI installed and configured (optional, for command-line deployment)

## Template Overview

The CloudFormation template used in this guide creates an ALB with various configurable options, including WAF integration, logging, and target group settings. You can find the template here:

[ALB with WAF CloudFormation Template](https://github.com/Cloud303/wafr-remediations/blob/main/cloudformation/ec2/alb-waf.yml)

## Deployment Steps

1. **Prepare Parameters**

   Before deploying, gather the following information:
   - ALB name and type (internal or internet-facing)
   - VPC and subnet IDs
   - ACM certificate ARN (for HTTPS)
   - Target EC2 instance ID
   - S3 bucket details for logging
   - WAF configuration preferences

2. **Access CloudFormation**

   - Log in to the AWS Management Console
   - Navigate to the CloudFormation service

3. **Create a New Stack**

   - Click "Create stack" and choose "With new resources (standard)"
   - Select "Upload a template file"
   - Upload the ALB with WAF template

4. **Specify Stack Details**

   Fill in the parameters as prompted, including:
   - Stack name
   - ALB settings (name, type, deletion protection, etc.)
   - Network settings (VPC, subnets)
   - Listener and target group configurations
   - Logging settings
   - WAF integration options

5. **Configure Stack Options**

   - Add any tags if needed
   - Set up any advanced options like stack policy or rollback configuration

6. **Review**

   - Review all the settings and parameters
   - Acknowledge any capabilities required by AWS

7. **Create Stack**

   - Click "Create stack" to start the deployment process
   - Monitor the stack creation progress in the CloudFormation console

8. **Access Outputs**

   Once the stack creation is complete:
   - Go to the "Outputs" tab of your stack
   - Note the ALB DNS Name for accessing your application

## Post-Deployment Steps

1. **Verify ALB Configuration**
   - Check the ALB in the EC2 console
   - Ensure listeners and target groups are correctly configured

2. **Test WAF Integration** (if enabled)
   - Verify WAF rules in the WAF console
   - Test WAF protection by simulating attacks

3. **Configure DNS** (optional)
   - Set up a custom domain name pointing to the ALB DNS Name

4. **Monitor Logs**
   - Check the S3 bucket for ALB access logs
   - Set up log analysis if needed

## Troubleshooting

- If stack creation fails, check the "Events" tab for error messages
- Ensure all referenced resources (VPC, subnets, EC2 instances) exist and are accessible
- Verify that the provided ACM certificate is valid and in the correct region

## Cleanup

To delete the resources:
1. Go to the CloudFormation console
2. Select the stack
3. Click "Delete" and confirm

Note: If deletion protection is enabled on the ALB, you'll need to disable it first in the EC2 console.

## Additional Resources

- [AWS CloudFormation Documentation](https://docs.aws.amazon.com/cloudformation/)
- [Application Load Balancer Documentation](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/)
- [AWS WAF Documentation](https://docs.aws.amazon.com/waf/)

