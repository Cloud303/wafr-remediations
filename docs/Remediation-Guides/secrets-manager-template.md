---
layout: page
title: 'Guide: Deploying RDS Secrets Manager Rotation'
permalink: '/remediation-guides/secrets-manager-template/'
resource: true
categories: [Remediation Guides]
---

#  Guide: Deploying RDS Secrets Manager Rotation

This guide will help you deploy an automated secrets rotation solution for RDS database credentials using AWS Secrets Manager and CloudFormation.

## Benefits

- **Enhanced Security**: Automatically rotate database credentials on a regular schedule
- **Reduced Risk**: Eliminate long-lived static credentials
- **Simplified Management**: Centralized secrets management with AWS Secrets Manager
- **Automated Operations**: No manual intervention needed for credential rotation
- **Compliance**: Helps meet security compliance requirements for credential management
- **Audit Trail**: Track all secret rotations through CloudTrail

## Prerequisites

Before deploying, you'll need:

- An existing RDS instance
- VPC with private subnets
- Security groups configured
- KMS key for encryption
- AWS CLI or Console access

## Deployment Steps

1. Download the CloudFormation template:
   ```bash
   curl -O https://raw.githubusercontent.com/Cloud303/wafr-remediations/main/cloudformation/secrets-manager/secrets-manager-template.yml
   ```

2. Gather the required parameter values:
   - RDS database port
   - Environment tag
   - VPC ID
   - Security Group ID
   - VPC CIDR block
   - KMS key ARN
   - Private subnet IDs (2)
   - RDS instance identifier
   - RDS cluster ARN

3. Deploy via AWS Console:
   - Open CloudFormation console
   - Choose "Create Stack"
   - Upload template file
   - Fill in parameters
   - Review and create stack

4. Deploy via AWS CLI:
   ```bash
   aws cloudformation create-stack \
     --stack-name rds-secrets-rotation \
     --template-body file://secrets-manager-template.yml \
     --parameters \
       ParameterKey=pRdsDbPort,ParameterValue=3306 \
       ParameterKey=pEnvironmentTag,ParameterValue=prod \
       # Add remaining parameters
   ```

## Verification

1. Check CloudFormation stack status shows CREATE_COMPLETE
2. Verify secret created in Secrets Manager console
3. Confirm Lambda rotation function is created
4. Test initial secret rotation

## Template Link

The CloudFormation template can be found here:
[secrets-manager-template.yml](https://github.com/Cloud303/wafr-remediations/blob/main/cloudformation/secrets-manager/secrets-manager-template.yml)

## Post-Deployment

- Secret will automatically rotate every 60 days
- Monitor rotation events in CloudWatch Logs
- Ensure applications are using Secrets Manager API to retrieve credentials
- Review IAM roles and security group configurations

## Troubleshooting

If rotation fails:
- Check Lambda function logs
- Verify network connectivity
- Confirm IAM permissions
- Validate security group rules

## Security Best Practices

- Restrict access to the secret using IAM policies
- Enable CloudTrail logging
- Monitor failed rotation attempts
- Regularly audit security group rules
- Use VPC endpoints for secure communication
