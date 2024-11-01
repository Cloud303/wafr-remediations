---
layout: page
title:  RDS Secrets Manager Rotation Deployment Guide
permalink: /remediation-guides/secrets-manager-template/
resource: true
categories: [Remediation Guides]
---

#  RDS Secrets Manager Rotation Deployment Guide

## Benefits of Deployment

Deploying this CloudFormation template provides several key advantages for managing RDS database credentials:

- **Automated Secret Rotation**: Credentials are automatically rotated every 60 days, enhancing security
- **Centralized Management**: Database credentials are securely stored and managed in AWS Secrets Manager
- **Reduced Risk**: Eliminates the need to manually handle sensitive credentials
- **Compliance**: Helps meet security compliance requirements through automated credential management
- **Integration**: Seamlessly integrates with existing AWS services and infrastructure
- **Audit Trail**: Built-in logging and tracking of credential access and rotation

## Prerequisites

Before deploying, ensure you have:

- AWS CLI configured with appropriate permissions
- VPC with private subnets configured
- Existing RDS instance
- KMS key for encryption
- Security group for RDS access

## Deployment Steps

1. Download the CloudFormation template:
   ```bash
   curl -O https://github.com/Cloud303/wafr-remediations/blob/main/cloudformation/secrets-manager/secrets-manager-template.yml
   ```

2. Gather the required parameter values:
   - RDS database port
   - Environment tag
   - VPC ID
   - Security Group ID
   - VPC CIDR range
   - KMS key ARN
   - Private subnet IDs (2)
   - RDS instance identifier
   - RDS cluster ARN

3. Deploy using AWS CLI:
   ```bash
   aws cloudformation create-stack \
     --stack-name rds-secrets-rotation \
     --template-body file://secrets-manager-template.yml \
     --parameters \
       ParameterKey=pRdsDbPort,ParameterValue=3306 \
       ParameterKey=pEnvironmentTag,ParameterValue=production \
       ParameterKey=pVpcId,ParameterValue=vpc-xxxxx \
       [Add remaining parameters...]
     --capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM
   ```

4. Monitor the stack creation in the AWS Console CloudFormation section

## Verification Steps

1. Check Secrets Manager console to verify secret creation
2. Confirm Lambda rotation function deployment
3. Test secret access using AWS CLI:
   ```bash
   aws secretsmanager get-secret-value --secret-id <secret-name>
   ```
4. Review the first scheduled rotation date

## Template Source

The CloudFormation template can be found here:
[secrets-manager-template.yml](https://github.com/Cloud303/wafr-remediations/blob/main/cloudformation/secrets-manager/secrets-manager-template.yml)

## Troubleshooting

Common issues and solutions:

- **Stack Creation Failure**: Verify all parameters are correct and IAM permissions are sufficient
- **Rotation Failure**: Check Lambda function logs and ensure network connectivity
- **Access Issues**: Verify security group rules and VPC endpoint configuration

## Maintenance

- Monitor rotation events in CloudWatch Logs
- Review secret access patterns in CloudTrail
- Periodically audit IAM permissions
- Update rotation schedule if needed through stack updates
