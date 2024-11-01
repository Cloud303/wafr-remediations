#  AWS KMS Keys CloudFormation Template

This CloudFormation template creates KMS (Key Management Service) keys for encrypting resources across various AWS services.

## Description

This template allows you to create customer-managed KMS keys for different AWS services. Unlike default AWS-managed keys, these customer-managed keys can be shared via KMS key policies.

## Parameters

The template includes the following parameters to control key creation:

- `pCreateKmsEbsKey`: Create KMS key for EBS volumes
- `pCreateKmsRdsKey`: Create KMS key for RDS  
- `pCreateKmsEfsKey`: Create KMS key for EFS
- `pAddBackupAccess`: Add AWS Backup role access to EFS KMS key
- `pCreateKmsFsxKey`: Create KMS key for FSx
- `pCreateKmsS3Key`: Create KMS key for S3
- `pCreateKmsSsmKey`: Create KMS key for Systems Manager
- `pCreateKmsEcKey`: Create KMS key for ElastiCache
- `pCreateKmsEsKey`: Create KMS key for Elasticsearch
- `pCreateKmsCwKey`: Create KMS key for CloudWatch Logs
- `pCreateKmsTimeStreamKey`: Create KMS key for Timestream

All parameters are of type String and accept `true` or `false` values.

## Resources

The template creates the following resources based on the parameter values:

- KMS keys for enabled services
- KMS key aliases 
- IAM managed policies for S3 and SSM keys

## Outputs

The template outputs the following:

- Template version
- ARNs of created KMS keys
- ARNs of created IAM policies

## Usage

1. Upload the template to CloudFormation
2. Specify the desired parameter values to enable/disable key creation for different services
3. Create the stack
4. Use the exported key and policy ARNs in other templates or applications

## Notes

- EBS encryption is enforced manually and not via this template
- Some keys have additional policy statements to allow service-linked roles access
