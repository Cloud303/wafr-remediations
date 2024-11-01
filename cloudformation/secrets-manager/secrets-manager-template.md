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

- `ClusterSecurityGroup`: Security group for RDS access
- `iamLambdaRole`: IAM role for Lambda execution
- `iamLambdaPolicy`: IAM policy attached to Lambda role
- `DBSecretsManagerSecret`: Secrets Manager secret for DB credentials
- `DBSecretsManagerSecretAttachment`: Attaches secret to RDS instance
- `DBSecretsManagerSecretRotation`: Sets up secret rotation schedule
- `SecretsManagerVPCEndpointIngress`: Security group ingress rule for Secrets Manager VPC endpoint
- `DBSecretsManagerSecretRotationFunction`: Lambda function for secret rotation (SAM application)
- `DBSecretsManagerLambdaInvokePermission`: Lambda invoke permission for Secrets Manager

## Usage

1. Ensure you have the necessary parameter values ready.
2. Deploy the CloudFormation template in your AWS account.
3. The template will create the resources and set up automated secret rotation.

## Notes

- This template uses the AWS Serverless Application Model (SAM) to deploy the rotation Lambda function.
- The rotation schedule is set to 60 days by default.
- Make sure the VPC, subnets, and security groups specified in the parameters exist and are correctly configured.

## Security Considerations

- The template uses a KMS key for encrypting secrets. Ensure proper key management.
- IAM roles and policies are scoped to minimum required permissions.
- VPC endpoint is used for secure communication with Secrets Manager within the VPC.
