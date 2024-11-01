---
layout: page
title:  OpenVPN Server Deployment Guide
permalink: /remediation-guides/ec2-openvpn/
resource: true
categories: [Remediation Guides]
---

#  OpenVPN Server Deployment Guide

This guide walks through deploying an OpenVPN server on AWS using CloudFormation. The template provides a secure and automated way to set up a VPN server with minimal configuration required.

## Benefits

- **Cost Effective**: Uses ARM-based Graviton processors which offer better price/performance
- **Secure**: Automatically configures security groups and IAM roles with least privilege
- **Reliable**: Optional auto-recovery ensures high availability
- **Scalable**: Separate EBS volume for VPN data allows for easy backup and recovery
- **Monitored**: Optional DataDog integration for monitoring
- **Automated**: One-click deployment with CloudFormation

## Prerequisites

- AWS account with permissions to create EC2, IAM, and CloudFormation resources
- VPC and subnet where the VPN server will be deployed
- EC2 key pair for SSH access
- VPC CIDR range information

## Deployment Steps

1. Download the CloudFormation template from [here](https://github.com/Cloud303/wafr-remediations/blob/main/cloudformation/ec2/ec2-openvpn.yml)

2. Log into the AWS Console and navigate to CloudFormation

3. Click "Create Stack" and upload the template file

4. Fill in the required parameters:
   - VPC ID and CIDR
   - Instance type (t4g.micro recommended for testing, t4g.small for production)
   - EC2 key pair name
   - Subnet ID
   - OpenVPN admin password
   - Auto-recovery setting
   - DataDog monitoring preference
   - Environment tag

5. Review and create the stack

6. Once deployment is complete (10-15 minutes), get the OpenVPN Server URL from the stack outputs

7. Access the OpenVPN admin interface using:
   - URL: https://<OpenVPN Server URL>:943/admin
   - Username: openvpn
   - Password: (specified during deployment)

## Post-Deployment Configuration

1. Log into the admin interface
2. Configure additional users and access policies as needed
3. Download the OpenVPN client for your platform
4. Connect using client credentials

## Monitoring

- If DataDog monitoring was enabled, the instance will appear in your DataDog dashboard
- CloudWatch alarms will monitor instance health if auto-recovery was enabled
- Check CloudFormation stack events for deployment issues

## Security Considerations

- The template creates a security group allowing:
  - TCP 443 (HTTPS) for web admin
  - TCP 943 (OpenVPN Admin)
  - UDP 1194 (OpenVPN)
  - TCP 22 (SSH) from VPC CIDR only
- Consider adding additional security group rules as needed
- Regularly update the admin password
- Monitor VPN access logs

## Support

For issues with the template, please check:
1. CloudFormation stack events
2. EC2 instance system logs
3. OpenVPN server logs at /var/log/openvpn
