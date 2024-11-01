#  RDS Secrets Manager Rotation CloudFormation Template

This CloudFormation template creates and manages secrets in AWS Secrets Manager for RDS database credentials, along with an automated rotation mechanism using AWS Lambda.

## Overview

The template sets up the following resources:

- A Secrets Manager secret for RDS database credentials
- A Lambda function to rotate the secret
- IAM roles and policies for the Lambda function
- Security group for RDS access
- Secrets Manager rotation schedule

## Parameters

The template requires the following parameters:

- `pRdsDbPort`: RDS database port (default: 3306)
- `pEnvironmentTag`: Environment tag for resources
- `pVpcId`: VPC ID
- `pSecurityGroupID`: Security Group ID  
- `pVpcCidr`: VPC CIDR block
- `pKmsARN`: KMS key ARN for Secrets Manager
- `pPrivsubnetA`: Private subnet ID
- `pPrivsubnetB`: Private subnet ID
- `pRdsInstanceIdentifier`: RDS instance identifier
- `pRDSDBARN`: RDS cluster ARN

## Resources Created

- `ClusterSecurityGroup`: Security group for RDS access
- `iamLambdaRole`: IAM role for Lambda rotation function
- `iamLambdaPolicy`: IAM policy for Lambda role
- `DBSecretsManagerSecret`: Secrets Manager secret for DB credentials
- `DBSecretsManagerSecretAttachment`: Attaches secret to RDS instance
- `DBSecretsManagerSecretRotation`: Rotation schedule for secret
- `SecretsManagerVPCEndpointIngress`: Security group ingress rule
- `DBSecretsManagerSecretRotationFunction`: Lambda function for secret rotation
- `DBSecretsManagerLambdaInvokePermission`: Lambda invoke permission

## Usage

1. Ensure you have the necessary parameter values ready
2. Deploy the template using AWS CloudFormation
3. The template will create the secret and set up automated rotation

## Notes

- The secret is rotated automatically every 60 days
- The Lambda function uses the AWS Serverless Application Repository
- Make sure the specified VPC, subnets, and security groups exist and are correctly configured

## Security

- Uses KMS for encryption
- Leverages VPC endpoints for secure communication
- Follows least privilege principle for IAM roles
