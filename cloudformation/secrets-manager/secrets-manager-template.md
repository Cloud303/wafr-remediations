#  RDS Secrets Manager Rotation Template

This CloudFormation template creates and configures AWS Secrets Manager secrets for RDS database credentials with automatic rotation capabilities.

## Overview

The template sets up:

- Secrets Manager secret for database credentials
- Lambda rotation function for automatic password rotation
- Required IAM roles and security groups
- VPC endpoint configurations

## Prerequisites

Before deploying this template, you need:

- An existing VPC with private subnets
- An existing RDS instance/cluster
- A KMS key for encrypting secrets
- Security group for VPC endpoints

## Parameters

| Parameter | Description |
|-----------|-------------|
| pRdsDbPort | Database port (3306, 1433, or 5432) |
| pEnvironmentTag | Environment tag (production, staging, etc) |
| pVpcId | VPC ID |
| pSecurityGroupID | Security Group ID |
| pVpcCidr | VPC CIDR range |
| pKmsARN | KMS key ARN for Secrets Manager |
| pPrivsubnetA | First private subnet ID |
| pPrivsubnetB | Second private subnet ID |
| pRdsInstanceIdentifier | RDS instance identifier |
| pRDSDBARN | RDS cluster ARN |

## Resources Created

- Security group for RDS access
- IAM role and policy for Lambda rotation function
- Secrets Manager secret with random password generation
- Secret attachment to RDS instance
- Rotation schedule (60 day rotation period)
- Security group ingress rules
- Lambda rotation function using AWS Serverless Application Repository

## Security Features

- Secrets encrypted with KMS
- Automatic password rotation every 60 days
- VPC endpoint security group controls
- Least privilege IAM permissions

## Usage

1. Deploy the template through CloudFormation
2. Provide required parameter values
3. Secret will be created and attached to RDS instance
4. Rotation will occur automatically every 60 days

## Notes

- Uses PostgreSQL rotation function from AWS Serverless Application Repository
- Requires VPC endpoints for Secrets Manager access
- Password excludes special characters: " @ / \
- Generated passwords are 16 characters long

## Tags

Resources are tagged with:
- Name
- Environment
- controlled-by: cloudformation-${stackname}