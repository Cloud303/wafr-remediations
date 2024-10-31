---
layout: page
title:  Deploying KMS Service Keys with CloudFormation
permalink: /kms-service-keys/
resource: true
categories: [Remediation Guides]
---

#  Deploying KMS Service Keys with CloudFormation

This guide will walk you through the process of deploying KMS (Key Management Service) keys for various AWS services using a CloudFormation template.

## Template Link

The CloudFormation template can be found here: [KMS Service Keys Template](https://github.com/Cloud303/wafr-remediations/blob/main/cloudformation/kms/kms-service-keys.yml)

## Deployment Steps

1. **Access AWS CloudFormation**
   - Log in to your AWS Management Console
   - Navigate to the CloudFormation service

2. **Create a New Stack**
   - Click on "Create stack"
   - Choose "With new resources (standard)"

3. **Specify Template**
   - Select "Upload a template file"
   - Click "Choose file" and upload the KMS Service Keys template
   - Click "Next"

4. **Specify Stack Details**
   - Enter a Stack name (e.g., "KMS-Service-Keys")
   - Set parameters for key creation:
     - `pCreateKmsEbsKey`: Set to "true" to create an EBS KMS key
     - `pCreateKmsRdsKey`: Set to "true" for an RDS KMS key
     - `pCreateKmsEfsKey`: Set to "true" for an EFS KMS key
     - `pAddBackupAccess`: Set to "true" to add AWS Backup role access to the EFS key
     - `pCreateKmsFsxKey`: Set to "true" for an FSx KMS key
     - `pCreateKmsS3Key`: Set to "true" for an S3 KMS key
     - `pCreateKmsSsmKey`: Set to "true" for a Systems Manager KMS key
     - `pCreateKmsEcKey`: Set to "true" for an ElastiCache KMS key
     - `pCreateKmsEsKey`: Set to "true" for an Elasticsearch KMS key
     - `pCreateKmsCwKey`: Set to "true" for a CloudWatch Logs KMS key
     - `pCreateKmsTimeStreamKey`: Set to "true" for a Timestream KMS key
   - Click "Next"

5. **Configure Stack Options**
   - Add any tags if needed
   - Set permissions if required
   - Configure advanced options if necessary
   - Click "Next"

6. **Review**
   - Review all the settings and parameters
   - Check the acknowledgment for IAM resource creation if prompted
   - Click "Create stack"

7. **Monitor Stack Creation**
   - Wait for the stack creation to complete
   - Check the "Events" tab for any issues during creation

8. **Access Outputs**
   - Once the stack is created, go to the "Outputs" tab
   - Here you'll find:
     - Template version
     - ARNs of created KMS keys
     - ARNs of created IAM policies

9. **Use the KMS Keys**
   - Use the exported key and policy ARNs in other templates or applications as needed

## Notes

- Ensure you have the necessary permissions to create KMS keys and IAM policies
- EBS encryption is not automatically enforced by this template and must be done manually
- Some keys have additional policy statements allowing access to service-linked roles
- Review the key policies and adjust as necessary for your security requirements

