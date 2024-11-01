---
layout: page
title: 'EC2 Key Pair Deployment Guide'
permalink: '/remediation-guides/ec2-keypair/'
resource: true
categories: [Remediation Guides]
---

#  EC2 Key Pair Deployment Guide

This guide walks through deploying an EC2 Key Pair using CloudFormation, with secure storage of the private key in AWS Systems Manager Parameter Store.

## Benefits

- **Automated Key Management**: Eliminates manual key pair creation and storage
- **Secure Storage**: Private key is automatically stored in Parameter Store with encryption
- **Access Control**: Leverage AWS IAM for granular access control to the private key
- **Auditability**: Track key pair creation and access through CloudTrail
- **Infrastructure as Code**: Maintain key pairs as part of your IaC workflow

## Prerequisites

- AWS CLI configured with appropriate permissions
- Access to AWS CloudFormation and Systems Manager

## Deployment Steps

1. Download the CloudFormation template:
   [EC2 Key Pair Template](https://github.com/Cloud303/wafr-remediations/blob/main/cloudformation/ec2/ec2-keypair.yml)

2. Navigate to AWS CloudFormation in the console

3. Click "Create Stack" and choose "With new resources"

4. Upload the template file

5. Configure stack parameters:
   - **pKeyPairName**: Enter a name following the format `<CLIENT>-<ENV>-<YYYY-MM-DD>`
   - **pEnvironmentTag**: Select the appropriate environment (e.g. production, staging)

6. Review and create the stack

7. Once complete, the private key will be stored in Parameter Store at:
   `/ec2/keypair/key-<name>`

## Accessing the Private Key

To retrieve the private key:

1. Open AWS Systems Manager
2. Navigate to Parameter Store
3. Locate the parameter with path `/ec2/keypair/key-<name>`
4. Use AWS CLI or SDK to securely access the key value

## Security Best Practices

- Restrict Parameter Store access using IAM policies
- Rotate keys regularly (recommended every 90 days)
- Monitor access to the private key through CloudTrail
- Consider using AWS KMS customer managed keys for additional encryption

## Cleanup

To remove the key pair:

1. Delete any EC2 instances using the key pair
2. Delete the CloudFormation stack
3. Verify the parameter is removed from Parameter Store

## Support

For issues or questions, please open a GitHub issue in the template repository.
