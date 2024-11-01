---
layout: page
title:  EC2 Key Pair Deployment Guide
permalink: /remediation-guides/ec2-keypair/
resource: true
categories: [Remediation Guides]
---

#  EC2 Key Pair Deployment Guide

## Benefits
Deploying this CloudFormation template provides several key advantages:

- **Automated Key Management**: Automatically creates and stores EC2 key pairs without manual intervention
- **Secure Storage**: Private keys are safely stored in AWS Systems Manager Parameter Store
- **Access Control**: Leverages AWS IAM for granular control over who can access the private keys
- **Standardization**: Ensures consistent key pair naming and storage conventions across your organization
- **Auditability**: Changes to key pairs can be tracked through CloudFormation stack events

## Prerequisites
- AWS account with permissions to:
  - Create CloudFormation stacks
  - Create EC2 key pairs
  - Write to Parameter Store
- AWS CLI or access to AWS Management Console

## Template
The CloudFormation template can be found here:
[ec2-keypair.yml](https://github.com/Cloud303/wafr-remediations/blob/main/cloudformation/ec2/ec2-keypair.yml)

## Deployment Steps

1. **Access CloudFormation**
   - Open the AWS Management Console
   - Navigate to CloudFormation service

2. **Create New Stack**
   - Click "Create stack"
   - Choose "With new resources (standard)"

3. **Specify Template**
   - Choose "Upload a template file"
   - Upload the ec2-keypair.yml template
   - Click "Next"

4. **Configure Stack Details**
   - Stack name: Enter a descriptive name
   - Parameters:
     - pKeyPairName: Enter key pair name (format: `<CLIENT>-<ENV>-<YYYY-MM-DD>`)
     - pEnvironmentTag: Select environment (`production`, `staging`, etc.)
   - Click "Next"

5. **Configure Stack Options**
   - Add any tags if needed
   - Click "Next"

6. **Review and Create**
   - Review all settings
   - Check acknowledgment box
   - Click "Create stack"

## Post-Deployment

1. **Access Private Key**
   - Navigate to AWS Systems Manager Parameter Store
   - Locate parameter at `/ec2/keypair/key-*`
   - Copy private key value when needed for EC2 instance access

2. **Security Best Practices**
   - Restrict Parameter Store access to authorized users only
   - Use the key pair only for intended EC2 instances
   - Consider implementing key rotation schedule
   - Monitor CloudTrail for key pair usage

## Cleanup

When the key pair is no longer needed:
1. Delete the CloudFormation stack
2. Verify Parameter Store entry is removed
3. Ensure no EC2 instances are still using the key pair

## Support
For issues or questions, refer to your AWS account team or internal support channels.
