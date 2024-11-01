---
layout: page
title: 'Deploying an Application Load Balancer with WAF Protection'
permalink: '/remediation-guides/alb-waf/'
resource: true
categories: [Remediation Guides]
---

#  Deploying an Application Load Balancer with WAF Protection

This guide will help you deploy an Application Load Balancer (ALB) with Web Application Firewall (WAF) protection using CloudFormation.

## Benefits

- **Enhanced Security**: WAF integration protects your applications from common web exploits and attacks
- **Simplified SSL/TLS**: Easy HTTPS configuration with ACM certificate integration
- **Improved Availability**: Health checks and sticky sessions ensure reliable application delivery
- **Centralized Logging**: Automatic logging to S3 for audit and troubleshooting
- **Cost Optimization**: Internal ALB option for private workloads
- **Monitoring Ready**: Built-in DataDog monitoring tag support

## Prerequisites

- An AWS account with sufficient permissions
- A VPC with public and private subnets
- An ACM certificate (if using HTTPS)
- Target EC2 instances
- An S3 bucket for ALB access logs

## Deployment Steps

1. Download the CloudFormation template:
   - [ALB with WAF Template](https://github.com/Cloud303/wafr-remediations/blob/main/cloudformation/ec2/alb-waf.yml)

2. Navigate to the AWS CloudFormation console

3. Create a new stack:
   - Click "Create Stack"
   - Choose "With new resources (standard)"
   - Upload the template file

4. Configure the stack parameters:

   ### Basic Settings
   - Enter ALB name
   - Choose internal or internet-facing
   - Enable/disable deletion protection
   
   ### Listener Configuration
   - Enable HTTPS if needed
   - Provide ACM certificate ARN
   - Configure hostname for routing

   ### Target Group Settings
   - Specify target EC2 instance(s)
   - Configure health check path
   - Enable sticky sessions if needed
   - Set sticky session duration

   ### WAF Configuration
   - Enable WAF protection
   - Configure Odoo-specific rules if applicable

   ### Network Settings
   - Select VPC
   - Choose subnets
   - Configure CIDR blocks

5. Review and create the stack

6. Monitor stack creation progress

7. Once complete, note the ALB DNS name from the Outputs tab

## Verification

1. Test the ALB DNS name in a browser
2. Verify HTTPS redirection if configured
3. Check target health in EC2 console
4. Confirm WAF rules are active
5. Validate access logs in S3

## Troubleshooting

- Check CloudWatch logs for ALB issues
- Verify security group settings
- Ensure target instances are running
- Validate health check configuration
- Review WAF logs for blocked requests

## Next Steps

- Configure DNS records to point to the ALB
- Set up monitoring and alerts
- Review and tune WAF rules
- Implement backup and DR procedures
