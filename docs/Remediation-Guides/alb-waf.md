---
layout: page
title: 'Deploying an Application Load Balancer with WAF Protection'
permalink: '/remediation-guides/alb-waf/'
resource: true
categories: [Remediation Guides]
---

#  Deploying an Application Load Balancer with WAF Protection

This guide will help you deploy an Application Load Balancer (ALB) with Web Application Firewall (WAF) protection using CloudFormation. This solution provides several key benefits:

- Enhanced security through WAF rules protecting against XSS and SQL injection attacks
- Simplified HTTPS configuration with automatic HTTP to HTTPS redirection
- Centralized logging of ALB access logs with configurable retention
- Flexible deployment options for both internet-facing and internal load balancers
- Optional sticky sessions for stateful applications
- Integration with DataDog for monitoring

## Prerequisites

Before deploying, ensure you have:

- An AWS account with appropriate permissions
- A VPC with public and private subnets
- An ACM certificate (if using HTTPS)
- Target EC2 instance(s) for the load balancer

## Deployment Steps

1. Download the CloudFormation template from [here](https://github.com/Cloud303/wafr-remediations/blob/main/cloudformation/ec2/alb-waf.yml)

2. Open the AWS CloudFormation console

3. Click "Create stack" and choose "With new resources"

4. Upload the template file

5. Configure the required parameters:

   ### Basic Settings
   - Enter a name for your ALB
   - Choose between internal or internet-facing
   - Enable deletion protection if needed
   
   ### Security Settings
   - Enable WAF if you want protection against XSS and SQL injection
   - Provide ACM certificate ARN if using HTTPS
   
   ### Network Configuration
   - Select your VPC
   - Choose appropriate subnets based on your ALB type
   
   ### Target Group Configuration
   - Specify your EC2 instance ID
   - Configure health check settings
   - Enable sticky sessions if needed

6. Review your settings and create the stack

7. Wait for stack creation to complete (typically 5-10 minutes)

## Verification

After deployment:

1. Access the ALB DNS name from the stack outputs
2. Verify that traffic is reaching your target instances
3. Test HTTPS if configured
4. Confirm WAF protection by checking the WAF console

## Monitoring

- Monitor ALB metrics through CloudWatch
- Check ALB access logs in the created S3 bucket
- Review WAF metrics and blocked requests if enabled
- Use DataDog integration if configured

## Maintenance

- Regularly review WAF rules and adjust as needed
- Monitor access logs for unusual patterns
- Update ACM certificates before expiration
- Review and adjust target group health check settings as needed

For detailed parameter descriptions and resource information, refer to the template documentation.
