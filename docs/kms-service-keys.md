---
layout: page
title:  How to deploy KMS Service Keys for AWS Resources
permalink: /kms-service-keys/
resource: true
categories: [Remediation Guides]
---

#  How to deploy KMS Service Keys for AWS Resources

This guide will walk you through deploying a CloudFormation template that creates customer-managed KMS keys for various AWS services including EBS, RDS, EFS, FSx, S3, Systems Manager, ElastiCache, Elasticsearch, CloudWatch Logs, and Timestream.

## Prerequisites

- An AWS account with permissions to create CloudFormation stacks and KMS keys
- Basic understanding of AWS CloudFormation and KMS

## Deployment Steps

1. **Access the CloudFormation Template**

   The template is available at: [KMS Service Keys Template](https://github.com/Cloud303/wafr-remediations/blob/main/cloudformation/kms/kms-service-keys.yml)

2. **Launch CloudFormation Stack**

   - Open the AWS CloudFormation console
   - Click "Create stack" and choose "With new resources (standard)"
   - Select "Upload a template file" and upload the downloaded template

3. **Specify Stack Details**

   - Enter a stack name
   - Configure the parameters:
     - Set `true` or `false` for each `pCreateKms*Key` parameter to specify which service keys to create
     - Set `pAddBackupAccess` to `true` if you want to add AWS Backup role access to the EFS KMS key

4. **Configure Stack Options**

   - Add any tags if needed
   - Configure stack policies or permissions if required

5. **Review and Create**

   - Review your settings
   - Acknowledge that the stack might create IAM resources
   - Click "Create stack"

6. **Monitor Stack Creation**

   - Wait for the stack creation to complete
   - Check the "Events" tab for any issues during deployment

7. **Access Outputs**

   Once the stack is created successfully:
   - Go to the "Outputs" tab
   - Note down the ARNs for the created KMS keys and IAM policies

## Post-Deployment

- Use the exported key ARNs when configuring encryption for your AWS resources
- Assign the created IAM policies to roles that need access to S3 or SSM encrypted resources

## Important Notes

- EBS encryption is not automatically enforced by this template. You need to enable it manually if required.
- Some keys have additional policy statements allowing access to service-linked roles. Review these if you have specific security requirements.
- Deleting this stack will remove all created KMS keys. Ensure no resources are using these keys before deletion.

## Troubleshooting

If you encounter issues:
- Check CloudFormation events for error messages
- Ensure your IAM user/role has sufficient permissions
- Verify that you haven't reached KMS key limits in your account

For further assistance, consult AWS documentation or contact AWS support.
