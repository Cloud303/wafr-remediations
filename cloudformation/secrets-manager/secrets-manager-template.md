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

- `pRdsDbPort`: RDS database port (Default: 3306)
- `pEnvironmentTag`: Environment tag for resources (e.g., production, staging)
- `pVpcId`: VPC ID
- `pSecurityGroupID`: Security Group ID
- `pVpcCidr`: VPC CIDR range
- `pKmsARN`: KMS key ARN for Secrets Manager encryption
- `pPrivsubnetA`: Private subnet ID
- `pPrivsubnetB`: Private subnet ID
- `pRdsInstanceIdentifier`: RDS instance identifier
- `pRDSDBARN`: RDS cluster ARN

## Resources Created

1. `ClusterSecurityGroup`: Security group for RDS access
2. `iamLambdaRole`: IAM role for Lambda function
3. `iamLambdaPolicy`: IAM policy for Lambda function
4. `DBSecretsManagerSecret`: Secrets Manager secret for database credentials
5. `DBSecretsManagerSecretAttachment`: Attaches the secret to the RDS instance
6. `DBSecretsManagerSecretRotation`: Sets up the rotation schedule
7. `SecretsManagerVPCEndpointIngress`: Security group ingress rule for Secrets Manager VPC endpoint
8. `DBSecretsManagerSecretRotationFunction`: Lambda function for secret rotation (using AWS SAM)
9. `DBSecretsManagerLambdaInvokePermission`: Lambda invoke permission for Secrets Manager

## Usage

1. Deploy the CloudFormation template with the required parameters.
2. The template will create the necessary resources for secret management and rotation.
3. The RDS database credentials will be stored in Secrets Manager and rotated automatically every 60 days.

## Security Considerations

- Ensure that the KMS key used for encryption has the appropriate permissions.
- Review and adjust the IAM policies as needed for your specific security requirements.
- The template uses VPC endpoints for enhanced security. Make sure your VPC is configured correctly.

## Customization

You can modify the following aspects of the template:

- Rotation schedule (currently set to 60 days)
- Lambda function configuration
- Security group rules

## Dependencies

This template uses the AWS Serverless Application Model (SAM) to deploy the rotation Lambda function. Ensure you have the necessary permissions to deploy SAM applications.
