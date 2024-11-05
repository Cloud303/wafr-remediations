---
layout: page
title: 'Deploy an OpenVPN Server on AWS with CloudFormation'
permalink: '/remediation-guides/ec2-openvpn/'
resource: true
categories: [Remediation Guides]
parent: 'Remediation Guides'
---

#  Deploy an OpenVPN Server on AWS with CloudFormation

This guide will help you deploy a secure, cost-effective OpenVPN server on AWS using CloudFormation. The solution provides:

- **Cost optimization** through ARM64-based instances (up to 40% cheaper than x86)
- **High availability** with CloudWatch-based auto-recovery
- **Security** with TLS 1.2 enforcement and restricted security groups
- **Easy management** through web-based admin interface
- **Monitoring** via optional DataDog integration
- **Persistence** with separate EBS volume for VPN data

## Prerequisites

Before starting deployment, ensure you have:

- An existing VPC with a public subnet
- An EC2 key pair for SSH access
- IAM permissions to create required resources

## Deployment Steps

1. Download the [CloudFormation template](https://github.com/Cloud303/wafr-remediations/blob/main/cloudformation/ec2/ec2-openvpn.yml)

2. Log into the AWS Console and navigate to CloudFormation

3. Click "Create stack" and choose "With new resources"

4. Upload the template file and click "Next"

5. Configure the required parameters:

   **OpenVPN Settings:**
   - Instance Type (t4g.micro recommended for < 10 users)
   - EC2 Key Pair name
   - Admin password (8-32 characters)

   **Network Settings:**
   - VPC ID
   - VPC CIDR
   - Public subnet ID

   **Optional Features:**
   - Auto-recovery (recommended: true)
   - DataDog monitoring
   - Environment tag

6. Click through "Next" and acknowledge IAM resource creation

7. Wait for stack creation to complete (~5-10 minutes)

8. Once complete, find the OpenVPN URL in the Outputs tab

## Post-Deployment Configuration

1. Navigate to the OpenVPN URL from the stack outputs

2. Login with:
   - Username: `openvpn`
   - Password: *[password specified during deployment]*

3. Follow the OpenVPN admin interface to:
   - Configure user accounts
   - Download client configurations
   - Monitor connections

## Maintenance

The deployment includes automatic:
- Log rotation
- System updates (during initial setup)
- Hardware failure recovery (if enabled)
- Data persistence across instance replacements

## Security Notes

- Only required ports (UDP 1194, TCP 943, TCP 443) are exposed
- TLS 1.2 is enforced for all connections
- Instance access is available through SSM Session Manager
- API termination protection is enabled by default

## Support

For issues or questions, refer to the [template repository](https://github.com/Cloud303/wafr-remediations)
