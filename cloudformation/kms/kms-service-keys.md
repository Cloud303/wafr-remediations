#  AWS KMS Keys CloudFormation Template

This CloudFormation template creates KMS (Key Management Service) keys for encrypting various AWS service resources. The template allows you to selectively create KMS keys for different services and exports the key ARNs for use in other stacks.

## Features

- Creates customer managed KMS keys that can be shared via KMS key policies
- Supports creating encryption keys for:
  - EBS volumes
  - RDS databases  
  - EFS file systems
  - FSx file systems
  - S3 buckets
  - Systems Manager (SSM)
  - ElastiCache clusters
  - Elasticsearch clusters
  - CloudWatch Logs
  - Timestream databases
- Automatically creates key aliases for easy reference
- Creates IAM policies for S3 and SSM key access
- Exports key ARNs for cross-stack references

## Parameters

| Parameter | Description | Default |
|-----------|-------------|---------|
| pCreateKmsEbsKey | Create KMS key for EBS | true |
| pCreateKmsRdsKey | Create KMS key for RDS | true |
| pCreateKmsEfsKey | Create KMS key for EFS | false |
| pAddBackupAccess | Add AWS Backup role access to EFS key | false |
| pCreateKmsFsxKey | Create KMS key for FSx | false |
| pCreateKmsS3Key | Create KMS key for S3 | false |
| pCreateKmsSsmKey | Create KMS key for SSM | false |
| pCreateKmsEcKey | Create KMS key for ElastiCache | false |
| pCreateKmsEsKey | Create KMS key for Elasticsearch | false |
| pCreateKmsCwKey | Create KMS key for CloudWatch Logs | false |
| pCreateKmsTimeStreamKey | Create KMS key for Timestream | false |

## Outputs

The template exports the following values:

- `ebsKeyArn` - EBS KMS key ARN
- `rdsKeyArn` - RDS KMS key ARN  
- `efsKeyArn` - EFS KMS key ARN
- `fsxKeyArn` - FSx KMS key ARN
- `s3KeyArn` - S3 KMS key ARN
- `ssmKeyArn` - SSM KMS key ARN
- `elasticacheKeyArn` - ElastiCache KMS key ARN
- `elasticsearchKeyArn` - Elasticsearch KMS key ARN
- `cloudwatchKeyArn` - CloudWatch Logs KMS key ARN
- `timeStreamKeyArn` - Timestream KMS key ARN
- `s3KmsPolicyArn` - S3 KMS key access policy ARN
- `ssmKmsPolicyArn` - SSM KMS key access policy ARN

## Usage

1. Deploy the template through CloudFormation
2. Enable parameters for the KMS keys you want to create
3. Use the exported key ARNs in other templates/stacks that need encryption
4. Attach the exported IAM policies to roles that need KMS access

## Notes

- All keys have key rotation enabled by default
- Keys are tagged with the CloudFormation stack name
- Default AWS managed keys cannot be shared between accounts
- Account root has full access to all created keys