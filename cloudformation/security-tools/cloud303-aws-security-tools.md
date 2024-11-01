#  AWS Security Tools CloudFormation Template

This CloudFormation template deploys a comprehensive set of AWS security tools and configurations to enhance the security posture of your AWS account.

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

- S3 buckets for CloudTrail and Config logs
- CloudWatch log groups  
- IAM roles and policies
- KMS keys for encryption
- SNS topics for notifications
- CloudWatch event rules
- GuardDuty detector
- Config recorder and delivery channel
- IAM Access Analyzer

## Outputs

The template provides outputs for the status and configuration of the deployed security tools.

## Usage

1. Upload the template to CloudFormation
2. Provide values for the parameters 
3. Review and create the stack
4. Monitor the creation progress and check outputs once complete

## Notes

- Some resources are conditionally created based on parameter values
- HIPAA compliance settings add additional retention and security controls
- Review and customize as needed for your specific requirements
