#  RDS Secrets Manager Rotation CloudFormation Template

This CloudFormation template creates and manages secrets in AWS Secrets Manager for an RDS database, along with an automated rotation mechanism using AWS Lambda.

## Overview

The template sets up the following resources:

- A security group for RDS access
- IAM role and policy for Lambda execution
- Secrets Manager secret for database credentials
- Secret rotation schedule and Lambda function
- VPC endpoint for Secrets Manager access

## Parameters

| Parameter | Description |
|-----------|-------------|
| pRdsDbPort | RDS database port (3306, 1433, or 5432) |
| pEnvironmentTag | Environment tag (production, staging, etc.) |
| pVpcId | VPC ID |
| pSecurityGroupID | Security Group ID |
| pVpcCidr | VPC CIDR block |
| pKmsARN | KMS key ARN for Secrets Manager |
| pPrivsubnetA | Private subnet ID |
| pPrivsubnetB | Private subnet ID |
| pRdsInstanceIdentifier | RDS instance identifier |
| pRDSDBARN | RDS cluster ARN |

## Resources Created

- EC2 Security Group
- IAM Role and Policy
- Secrets Manager Secret
- Secret Target Attachment
- Secret Rotation Schedule
- Lambda Function (via SAM application)
- Lambda Invoke Permission

## Usage

1. Ensure you have the necessary parameter values ready.
2. Deploy the template using AWS CloudFormation.
3. The template will create the required resources and set up automated secret rotation.

## Notes

- The template uses the AWS Serverless Application Model (SAM) to deploy the rotation Lambda function.
- Secret rotation is scheduled to occur automatically every 60 days.
- Make sure the specified VPC, subnets, and security groups exist and are correctly configured.

## Security Considerations

- The template uses a KMS key for encrypting secrets. Ensure proper key management.
- IAM roles and policies are scoped to minimum required permissions.
- VPC endpoints are used to enhance security for Secrets Manager access.

## Customization

You can modify the template to adjust:

- Rotation schedule
- IAM permissions
- Security group rules
- Secret string generation parameters

Always review and test changes before deploying to production environments.