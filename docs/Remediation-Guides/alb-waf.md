---
layout: page
title:  Deploying an Application Load Balancer with WAF Protection
permalink: /remediation-guides/alb-waf/
resource: true
categories: [Remediation Guides]
---

#  Deploying an Application Load Balancer with WAF Protection

This guide will help you deploy an Application Load Balancer (ALB) with Web Application Firewall (WAF) protection using CloudFormation.

## Benefits

- **Enhanced Security**: WAF integration protects your applications from common web exploits and attacks
- **Simplified SSL/TLS**: Easy HTTPS configuration with ACM certificate integration
- **Improved Monitoring**: Built-in logging to S3 for traffic analysis and troubleshooting
- **High Availability**: Load balancing across multiple Availability Zones
- **Flexible Routing**: Host-based routing rules for directing traffic
- **Session Persistence**: Optional sticky sessions for stateful applications

## Prerequisites

- An AWS account with appropriate permissions
- VPC with public and private subnets
- EC2 instances to add as targets
- ACM certificate (if using HTTPS)
- S3 bucket for ALB access logs

## Deployment Steps

1. Download the CloudFormation template from [here](https://github.com/Cloud303/wafr-remediations/blob/main/cloudformation/ec2/alb-waf.yml)

2. Navigate to the AWS CloudFormation console

3. Click "Create stack" and choose "With new resources"

4. Upload the template file

5. Configure the required parameters:

   ### ALB Configuration
   - Specify ALB name
   - Choose internal or internet-facing
   - Enable/disable deletion protection
   - Configure HTTPS listener if needed
   - Provide ACM certificate ARN for HTTPS
   - Set hostname for routing rules

   ### Logging Settings
   - Set log retention period in S3

   ### Target Group Settings
   - Specify target EC2 instance(s)
   - Configure health check path
   - Enable sticky sessions if needed
   - Set sticky session duration

   ### WAF Configuration
   - Enable/disable WAF integration
   - Configure Odoo-specific rules if applicable

   ### Network Settings
   - Select VPC
   - Choose public/private subnets

6. Review the configuration and create the stack

7. Monitor the stack creation progress

8. Once complete, find the ALB DNS name in the Outputs tab

## Verification

1. Access the ALB DNS name in a browser
2. Verify HTTPS redirect works (if configured)
3. Check target health in EC2 console
4. Confirm WAF rules are active (if enabled)
5. Verify logs are being delivered to S3

## Troubleshooting

- Check security groups allow required traffic
- Verify target instances are healthy
- Review CloudWatch logs for WAF blocks
- Ensure S3 bucket permissions allow ALB logging

## Next Steps

- Configure custom WAF rules
- Set up monitoring and alerts
- Implement backup targets
- Configure advanced routing rules
