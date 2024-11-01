---
layout: page
title: 'Deploy an OpenVPN Server with CloudFormation'
permalink: '/remediation-guides/ec2-openvpn/'
resource: true
categories: [Remediation Guides]
---

#  Deploy an OpenVPN Server with CloudFormation

This guide walks through deploying a secure OpenVPN server on AWS using CloudFormation. The template provides an easy way to set up a VPN server with minimal configuration required.

## Benefits

- **Quick Setup**: Deploy a fully configured OpenVPN server in minutes
- **Cost Effective**: Uses ARM-based Graviton processors for better price/performance
- **Secure**: Creates isolated security groups and follows AWS best practices
- **Reliable**: Optional auto-recovery and monitoring capabilities
- **Flexible**: Configurable instance sizes and networking options
- **Managed**: Infrastructure as code makes updates and maintenance simple

## Prerequisites

- An AWS account with permissions to create the required resources
- A VPC and subnet where the VPN server will be deployed
- An EC2 key pair for SSH access
- The subnet must have internet connectivity via an Internet Gateway

## Deployment Steps

1. Download the CloudFormation template:
   [ec2-openvpn.yml](https://github.com/Cloud303/wafr-remediations/blob/main/cloudformation/ec2/ec2-openvpn.yml)

2. Navigate to the AWS CloudFormation console

3. Click "Create Stack" and choose "With new resources"

4. Upload the template file

5. Fill in the required parameters:
   - VPC ID and CIDR
   - Subnet ID
   - Instance type (t4g.micro recommended for testing)
   - EC2 key pair name
   - OpenVPN admin password
   - Environment tag
   - Auto-recovery preference
   - DataDog monitoring preference

6. Review and create the stack

7. Wait for stack creation to complete (~5-10 minutes)

8. Access the OpenVPN admin interface using the URL provided in the stack outputs

## Post-Deployment

1. Log into the OpenVPN admin interface using:
   - Username: `openvpn`
   - Password: (the one you specified in parameters)

2. Configure your VPN client settings and download connection profiles

3. Connect to the VPN using your preferred OpenVPN client

## Monitoring

- If enabled, CloudWatch alarms will monitor instance health
- DataDog integration provides additional monitoring capabilities
- Instance logs are available in CloudWatch Logs

## Security Notes

- The security group only allows VPN and SSH traffic
- All data is encrypted in transit
- Regular Ubuntu security updates are automatically applied
- Additional EBS volume provides secure storage for VPN data
