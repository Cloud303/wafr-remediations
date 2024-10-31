---
layout: page
title:  How to deploy KMS Keys for AWS Services
permalink: /kms-service-keys/
resource: true
categories: [Remediation Guides]
---


This guide will walk you through deploying a CloudFormation template that creates customer-managed KMS keys for various AWS services including EBS, RDS, EFS, FSx, S3, Systems Manager, ElastiCache, Elasticsearch, CloudWatch Logs, and Timestream.

## Template Link

The CloudFormation template can be found here:
[KMS Service Keys Template](https://github.com/Cloud303/wafr-remediations/blob/main/cloudformation/kms/kms-service-keys.yml)

## Deployment Steps

1. **Access AWS CloudFormation**
   - Log in to your AWS Management Console
   - Navigate to the CloudFormation service

2. **Create a New Stack**
   - Click on "Create stack"
   - Choose "With new resources (standard)"

3. **Specify Template**
   - Select "Upload a template file"
   - Click "Choose file" and upload the template from your local machine
   - Alternatively, you can use the template URL provided above

4. **Specify Stack Details**
   - Enter a Stack name
   - Configure the parameters:
     - Set `pCreateKmsEbsKey` to "true" to create an EBS KMS key
     - Set `pCreateKmsRdsKey` to "true" for an RDS KMS key
     - Set `pCreateKmsEfsKey` to "true" for an EFS KMS key
     - Set `pAddBackupAccess` to "true" to allow AWS Backup access to the EFS key
     - Set `pCreateKmsFsxKey` to "true" for an FSx KMS key
     - Set `pCreateKmsS3Key` to "true" for an S3 KMS key
     - Set `pCreateKmsSsmKey` to "true" for a Systems Manager KMS key
     - Set `pCreateKmsEcKey` to "true" for an ElastiCache KMS key
     - Set `pCreateKmsEsKey` to "true" for an Elasticsearch KMS key
     - Set `pCreateKmsCwKey` to "true" for a CloudWatch Logs KMS key
     - Set `pCreateKmsTimeStreamKey` to "true" for a Timestream KMS key

5. **Configure Stack Options**
   - Add any tags if needed
   - Configure advanced options as required

6. **Review**
   - Review your stack details
   - Acknowledge that the stack might create IAM resources

7. **Create Stack**
   - Click "Create stack" to deploy

8. **Monitor Deployment**
   - Wait for the stack creation to complete
   - Check the "Events" tab for any issues during deployment

9. **Access Outputs**
   - Once the stack is created, go to the "Outputs" tab
   - Here you'll find:
     - The template version
     - ARNs of the created KMS keys
     - ARNs of the created IAM policies

10. **Use the KMS Keys**
    - Use the KMS key ARNs in other templates or applications that require encryption
    - For S3 and SSM, use the provided IAM policy ARNs to grant access to the keys

## Notes

- Ensure you have the necessary permissions to create KMS keys and IAM resources
- EBS encryption is not automatically enforced by this template and must be done manually
- Some keys include additional policy statements for service-linked role access
- Review the key policies after creation to ensure they meet your security requirements
