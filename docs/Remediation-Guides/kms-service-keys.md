---
layout: page
title: 'Guide: Deploying AWS Service KMS Keys with CloudFormation'
permalink: '/remediation-guides/kms-service-keys/'
resource: true
categories: [Remediation Guides]
---

#  Guide: Deploying AWS Service KMS Keys with CloudFormation

## Benefits of Deploying Service-Specific KMS Keys

- **Enhanced Security**: Customer-managed keys provide greater control over encryption compared to AWS-managed keys
- **Cross-Account Access**: Keys can be shared across accounts via KMS key policies
- **Audit Capabilities**: Track key usage through CloudTrail logs
- **Cost Optimization**: Consolidate key management and reduce operational overhead
- **Compliance**: Meet regulatory requirements for data encryption and key management

## Template Overview

The CloudFormation template creates KMS keys for encrypting data across multiple AWS services including:

- EBS volumes
- RDS databases  
- EFS file systems
- FSx file systems
- S3 buckets
- Systems Manager
- ElastiCache
- Elasticsearch
- CloudWatch Logs
- Timestream

[View Template](https://github.com/Cloud303/wafr-remediations/blob/main/cloudformation/kms/kms-service-keys.yml)

## Deployment Steps

1. Download the template from the link above

2. Navigate to AWS CloudFormation console

3. Click "Create Stack" and choose "With new resources"

4. Upload the template file

5. Configure stack parameters:
   - Set `true` for services that need KMS keys
   - Set `false` to skip key creation for specific services
   - Enable `pAddBackupAccess` if using AWS Backup with EFS

6. Review and create the stack

7. Once complete, note the outputs:
   - KMS key ARNs for each service
   - IAM policy ARNs for S3 and SSM

## Using the Keys

- Reference key ARNs when creating encrypted resources
- Attach IAM policies to roles that need access
- Update key policies as needed for cross-account access
- Monitor key usage in CloudTrail

## Best Practices

- Enable only required service keys to minimize costs
- Document key usage and rotation policies
- Regularly audit key access permissions
- Consider enabling automatic key rotation
- Back up key policies and metadata

## Troubleshooting

If deployment fails:
- Verify IAM permissions
- Check parameter values are `true` or `false`
- Ensure service quotas allow additional KMS keys
- Review CloudWatch logs for detailed errors
