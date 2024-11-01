---
layout: page
title:  Deploying RDS Secrets Manager Rotation with CloudFormation
permalink: /remediation-guides/secrets-manager-template/
resource: true
categories: [Remediation Guides]
---

#  Deploying RDS Secrets Manager Rotation with CloudFormation

## Benefits of Deployment

Deploying the resources described in this README offers several key advantages:

1. **Enhanced Security**: Automatically rotates database credentials, reducing the risk of compromised long-term secrets.
2. **Compliance**: Helps meet regulatory requirements for periodic credential rotation.
3. **Simplified Management**: Centralizes secret storage and rotation in AWS Secrets Manager.
4. **Automation**: Eliminates manual rotation processes, saving time and reducing human error.
5. **Integration**: Seamlessly works with RDS databases and other AWS services.
6. **Scalability**: Easy to apply across multiple environments and databases.

## Deployment Guide

### Prerequisites

- AWS CLI configured with appropriate permissions
- Basic understanding of AWS CloudFormation
- Access to the AWS account where resources will be deployed

### Steps

1. **Review the Template**
   
   Examine the CloudFormation template to understand the resources being created:
   [Secrets Manager Template](https://github.com/Cloud303/wafr-remediations/blob/main/cloudformation/secrets-manager/secrets-manager-template.yml)

2. **Gather Required Parameters**

   Collect the following information:
   - RDS database port
   - Environment tag
   - VPC ID
   - Security Group ID
   - VPC CIDR block
   - KMS key ARN for Secrets Manager
   - Private subnet IDs (2)
   - RDS instance identifier
   - RDS cluster ARN

3. **Deploy the CloudFormation Stack**

   Use the AWS CLI or CloudFormation console to deploy the stack:

   ```bash
   aws cloudformation create-stack \
     --stack-name rds-secrets-rotation \
     --template-url https://github.com/Cloud303/wafr-remediations/blob/main/cloudformation/secrets-manager/secrets-manager-template.yml \
     --parameters ParameterKey=pRdsDbPort,ParameterValue=3306 \
                  ParameterKey=pEnvironmentTag,ParameterValue=production \
                  ParameterKey=pVpcId,ParameterValue=vpc-xxxxxxxx \
                  ParameterKey=pSecurityGroupID,ParameterValue=sg-xxxxxxxx \
                  ParameterKey=pVpcCidr,ParameterValue=10.0.0.0/16 \
                  ParameterKey=pKmsARN,ParameterValue=arn:aws:kms:region:account:key/xxxxxxxx \
                  ParameterKey=pPrivsubnetA,ParameterValue=subnet-xxxxxxxx \
                  ParameterKey=pPrivsubnetB,ParameterValue=subnet-yyyyyyyy \
                  ParameterKey=pRdsInstanceIdentifier,ParameterValue=mydb-instance \
                  ParameterKey=pRDSDBARN,ParameterValue=arn:aws:rds:region:account:cluster:mydb-cluster \
     --capabilities CAPABILITY_IAM
   ```

   Replace the parameter values with your specific details.

4. **Monitor Stack Creation**

   Track the stack creation process in the CloudFormation console or using the AWS CLI:

   ```bash
   aws cloudformation describe-stacks --stack-name rds-secrets-rotation
   ```

5. **Verify Resources**

   Once the stack is created, verify the following in the AWS Console:
   - Secrets Manager secret for the database
   - Lambda function for rotation
   - IAM roles and policies
   - VPC endpoint for Secrets Manager

6. **Test Secret Rotation**

   Manually trigger a rotation in Secrets Manager to ensure everything is working correctly.

7. **Update Application Configuration**

   If necessary, update your application to use Secrets Manager for retrieving database credentials.

### Post-Deployment

- Monitor the first automatic rotation to ensure it completes successfully.
- Review CloudWatch Logs for the Lambda function to troubleshoot any issues.
- Consider setting up CloudWatch Alarms for failed rotations.

By following this guide, you'll successfully deploy a robust secret rotation mechanism for your RDS database, enhancing your overall security posture and simplifying credential management.
