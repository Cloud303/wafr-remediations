---
layout: page
title: 'Deploying AWS KMS Service Keys'
permalink: '/remediation-guides/kms-service-keys/'
resource: true
categories: [Remediation Guides]
---

#  Deploying AWS KMS Service Keys

This guide walks through deploying a CloudFormation template that creates KMS encryption keys for various AWS services. Using customer-managed KMS keys provides several benefits:

- Enhanced security through encryption of sensitive data
- Granular access control via key policies
- Ability to share keys across accounts
- Audit logging of key usage
- Automated key rotation

## Prerequisites

- AWS account with permissions to create CloudFormation stacks and KMS keys
- Basic understanding of AWS KMS and CloudFormation

## Template Overview

The template creates customer-managed KMS keys for encrypting resources in services like:

- EBS volumes
- RDS databases
- EFS/FSx file systems  
- S3 buckets
- Systems Manager
- ElastiCache
- Elasticsearch
- CloudWatch Logs
- Timestream

[View Template](https://github.com/Cloud303/wafr-remediations/blob/main/cloudformation/kms/kms-service-keys.yml)

## Deployment Steps

1. Navigate to CloudFormation in the AWS Console

2. Click "Create Stack" and choose "With new resources"

3. Upload the template file or specify the template URL

4. Configure stack parameters:
   - Enable/disable creation of specific service keys using the parameters
   - Set `pAddBackupAccess` if using AWS Backup with EFS

5. Configure stack options:
   - Add any tags
   - Set IAM role if needed
   - Configure stack failure options

6. Review and create the stack

7. Wait for stack creation to complete (~5 minutes)

## Using the Keys

After deployment, you can:

1. Reference key ARNs in other CloudFormation templates using cross-stack references:
   ```yaml
   KmsKeyId: !ImportValue ebsKeyArn
   ```

2. Attach the exported IAM policies to roles that need KMS access:
   - `s3KmsPolicyArn` for S3 encryption
   - `ssmKmsPolicyArn` for Systems Manager encryption

3. Use the key aliases to reference keys in the console:
   - Format: `alias/<service>-<stack-name>`

## Best Practices

- Only create keys for services you plan to use
- Review key policies to ensure least privilege access
- Monitor key usage through CloudTrail
- Consider costs - each active key is $1/month
- Back up any data encrypted with these keys

## Cleanup

To remove the keys:

1. Ensure no resources are using the keys
2. Delete the CloudFormation stack
3. Keys will be scheduled for deletion with 7-30 day waiting period
