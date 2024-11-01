---
layout: page
title:  Guide: Deploying AWS Service KMS Keys with CloudFormation
permalink: /remediation-guides/kms-service-keys/
resource: true
categories: [Remediation Guides]
---

#  Guide: Deploying AWS Service KMS Keys with CloudFormation

This guide walks through deploying a CloudFormation template that creates customer-managed KMS keys for encrypting AWS resources.

## Benefits

- **Enhanced Security**: Customer-managed keys provide more control over encryption compared to AWS-managed keys
- **Cross-Account Access**: Keys can be shared across accounts via KMS key policies
- **Centralized Management**: Single template creates and manages keys for multiple services
- **Cost Optimization**: Consolidate key management and reduce overhead
- **Compliance**: Better audit and control capabilities for regulated environments

## Template Link

The CloudFormation template can be found here:
[kms-service-keys.yml](https://github.com/Cloud303/wafr-remediations/blob/main/cloudformation/kms/kms-service-keys.yml)

## Deployment Steps

1. Navigate to AWS CloudFormation in your console

2. Click "Create Stack" and choose "With new resources"

3. Upload the template file or specify the template URL

4. Configure the stack parameters:
   - Enable/disable keys for specific services by setting parameters to `true` or `false`
   - Common services to enable:
     - `pCreateKmsEbsKey` for EBS volumes
     - `pCreateKmsS3Key` for S3 buckets
     - `pCreateKmsSsmKey` for Systems Manager
     - `pCreateKmsCwKey` for CloudWatch Logs

5. Review the stack configuration

6. Click "Create stack" to deploy

## Post-Deployment

1. Note the output values for:
   - KMS key ARNs 
   - IAM policy ARNs

2. Use the key ARNs when creating encrypted resources:
   - Specify key ARN when creating EBS volumes
   - Reference key in S3 bucket encryption settings
   - Configure CloudWatch log groups with KMS encryption

3. Attach IAM policies to roles that need access to encrypted resources

## Best Practices

- Enable only the keys needed for your environment
- Document which resources use which keys
- Review key policies periodically
- Enable AWS CloudTrail to audit key usage
- Consider enabling automatic key rotation

## Troubleshooting

If deployment fails:
- Verify IAM permissions
- Check parameter values are `true` or `false`
- Ensure service quotas allow additional KMS keys
- Review CloudWatch logs for detailed error messages
