---
layout: page
title: 'RDS Secrets Manager Rotation Deployment Guide'
permalink: '/remediation-guides/secrets-manager-template/'
resource: true
categories: [Remediation Guides]
parent: 'Remediation Guides'
---

#  RDS Secrets Manager Rotation Deployment Guide

This guide will help you deploy an automated secrets rotation solution for RDS databases using AWS Secrets Manager. By implementing this solution, you'll gain:

- Automated credential rotation every 60 days
- Enhanced security through encrypted secrets
- Simplified secrets management
- Reduced operational overhead
- Compliance with security best practices

## Prerequisites

Before beginning deployment, ensure you have:

- An existing VPC with private subnets
- A running RDS instance or cluster
- A KMS key for encryption
- A security group for VPC endpoints
- IAM permissions to create required resources

## Deployment Steps

1. Download the CloudFormation template:
   - [secrets-manager-template.yml](https://github.com/Cloud303/wafr-remediations/blob/main/cloudformation/secrets-manager/secrets-manager-template.yml)

2. Navigate to the AWS CloudFormation console

3. Create a new stack and upload the template file

4. Provide the following required parameters:
   - `pRdsDbPort`: Your database port (3306, 1433, or 5432)
   - `pEnvironmentTag`: Environment name (e.g. production, staging)
   - `pVpcId`: Your VPC ID
   - `pSecurityGroupID`: Security group ID for VPC endpoints
   - `pVpcCidr`: VPC CIDR range
   - `pKmsARN`: ARN of your KMS key
   - `pPrivsubnetA`: First private subnet ID
   - `pPrivsubnetB`: Second private subnet ID  
   - `pRdsInstanceIdentifier`: Your RDS instance identifier
   - `pRDSDBARN`: Your RDS cluster ARN

5. Review and create the stack

6. Wait for stack creation to complete (~10-15 minutes)

## Verification Steps

1. Navigate to AWS Secrets Manager console
2. Locate the newly created secret
3. Verify the secret is attached to your RDS instance
4. Check that rotation is configured for 60 days

## Post-Deployment

- The solution will automatically begin rotating credentials every 60 days
- Monitor the first rotation to ensure it completes successfully
- Update application connection strings to use Secrets Manager

## Troubleshooting

If rotation fails:
- Check VPC endpoint connectivity
- Verify security group rules
- Review Lambda rotation function logs
- Ensure RDS instance is accessible

## Security Considerations

- Secrets are encrypted at rest using your KMS key
- Network access is restricted through VPC endpoints
- IAM roles follow least privilege principle
- Passwords are 16 characters and exclude problematic special characters
