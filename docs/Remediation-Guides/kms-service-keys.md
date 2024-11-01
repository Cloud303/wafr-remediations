---
layout: page
title:  Deploying AWS KMS Keys with CloudFormation
permalink: /remediation-guides/kms-service-keys/
resource: true
categories: [Remediation Guides]
---

#  Deploying AWS KMS Keys with CloudFormation

## Benefits of Deploying These Resources

Deploying the KMS keys described in this CloudFormation template offers several advantages:

1. **Enhanced Security**: Customer-managed keys provide greater control over encryption across various AWS services.
2. **Flexibility**: You can selectively create keys for specific services based on your needs.
3. **Compliance**: Custom key management aids in meeting regulatory requirements for data protection.
4. **Cost-Effective**: Centralized key management reduces operational overhead.
5. **Integration**: Easy integration with other AWS services and resources through exported ARNs.

## Deployment Guide

### Step 1: Access the Template

The CloudFormation template can be found at:
[https://github.com/Cloud303/wafr-remediations/blob/main/cloudformation/kms/kms-service-keys.yml](https://github.com/Cloud303/wafr-remediations/blob/main/cloudformation/kms/kms-service-keys.yml)

### Step 2: Launch CloudFormation Stack

1. Navigate to the AWS CloudFormation console.
2. Click "Create stack" and choose "With new resources (standard)".
3. Select "Upload a template file" and upload the downloaded YAML file.
4. Click "Next".

### Step 3: Configure Stack Parameters

Set the following parameters according to your requirements:

- `pCreateKmsEbsKey`: Create KMS key for EBS volumes (true/false)
- `pCreateKmsRdsKey`: Create KMS key for RDS (true/false)
- `pCreateKmsEfsKey`: Create KMS key for EFS (true/false)
- `pAddBackupAccess`: Add AWS Backup role access to EFS KMS key (true/false)
- `pCreateKmsFsxKey`: Create KMS key for FSx (true/false)
- `pCreateKmsS3Key`: Create KMS key for S3 (true/false)
- `pCreateKmsSsmKey`: Create KMS key for Systems Manager (true/false)
- `pCreateKmsEcKey`: Create KMS key for ElastiCache (true/false)
- `pCreateKmsEsKey`: Create KMS key for Elasticsearch (true/false)
- `pCreateKmsCwKey`: Create KMS key for CloudWatch Logs (true/false)
- `pCreateKmsTimeStreamKey`: Create KMS key for Timestream (true/false)

### Step 4: Configure Stack Options

1. Add any tags if required.
2. Set permissions if necessary.
3. Choose advanced options if needed (e.g., stack policy, rollback configuration).

### Step 5: Review and Create Stack

1. Review all the settings and parameters.
2. Check the acknowledgment for IAM resource creation if prompted.
3. Click "Create stack".

### Step 6: Monitor Stack Creation

1. Wait for the stack creation to complete. This may take a few minutes.
2. Check the "Events" tab for any issues during creation.

### Step 7: Access Outputs

Once the stack is created successfully:

1. Go to the "Outputs" tab of your stack.
2. Note down the ARNs for the created KMS keys and IAM policies.
3. Use these ARNs in other templates or applications as needed.

## Post-Deployment Steps

- Ensure that EBS encryption is manually enforced as required.
- Review the key policies, especially for keys with additional service-linked role access.
- Integrate the created keys with your AWS resources and applications.
- Regularly audit and rotate keys as part of your security best practices.

By following this guide, you'll successfully deploy customer-managed KMS keys for various AWS services, enhancing your cloud security posture and compliance readiness.
