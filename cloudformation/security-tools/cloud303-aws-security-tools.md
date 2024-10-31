#  AWS Security Tools CloudFormation Template

This CloudFormation template deploys a comprehensive set of AWS security tools and configurations across your AWS account.

## Features

- CloudTrail enabled across all regions with encrypted logs
- AWS Config enabled in a single region 
- Account-wide GuardDuty with optional malware protection
- Amazon Inspector with findings notifications
- IAM Access Analyzer

## Parameters

The template accepts the following parameters:

### GuardDuty Settings
- `pEnableGuardDuty`: Enable GuardDuty account-wide (true/false)
- `pGuardDutyPublishFrequency`: Findings delivery frequency 
- `pGuardDutyMalwareProtection`: Enable malware protection (true/false)

### Config Settings  
- `pEnableConfig`: Enable Config in deployed region (true/false/AutoDetect)
- `pCreateConfigAll`: Create all Config resources (true/false)
- `pConfigDeliveryFrequency`: Configuration snapshot delivery frequency

### CloudTrail Settings
- `pEnableCloudtrail`: Enable CloudTrail in all regions (true/false) 
- `pLogGroupRetention`: CloudWatch log retention period in days

### Inspector Settings
- `pEnableInspector`: Enable Inspector notifications (true/false)
- `pEnableInspectorExport`: Enable exporting Inspector findings to S3 (true/false)

### IAM Access Analyzer Settings  
- `pEnableAccessAnalyzer`: Enable IAM Access Analyzer (true/false)

### Other Settings
- `pHipaaClient`: Enable HIPAA compliance settings (true/false)
- `pSecurityEmailEndpoint`: Email for security notifications
- `pEnvironmentTag`: Environment tag (production/development)

## Resources Created

The template creates the following key resources:

- S3 buckets for CloudTrail and Config logs
- CloudTrail trail and associated resources
- Config recorder and delivery channel 
- GuardDuty detector
- SNS topics and CloudWatch event rules for notifications
- IAM roles and policies
- KMS keys for encryption
- Inspector and Access Analyzer configurations

## Outputs

The template provides outputs for the status and key resources created for each security tool.

## Usage

1. Upload the template to CloudFormation
2. Provide values for the parameters  
3. Review and create the stack
4. Monitor the creation progress and check outputs when complete

## Notes

- Some resources are conditionally created based on parameter values
- HIPAA compliance settings add additional configurations
- Review IAM permissions and KMS key policies as needed for your environment
