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
- `pGuardDutyMalwareProtection`: Enable GuardDuty Malware Protection (true/false)

### Config Settings  
- `pEnableConfig`: Enable Config in deployed region (true/false/AutoDetect)
- `pCreateConfigAll`: Create ALL Config resources (true/false)
- `pConfigDeliveryFrequency`: Configuration snapshot delivery frequency

### CloudTrail Settings
- `pEnableCloudtrail`: Enable CloudTrail in all regions (true/false) 
- `pLogGroupRetention`: CloudWatch Log Group retention in days
- `pHipaaClient`: Enable HIPAA compliance settings (true/false)

### Inspector Settings
- `pEnableInspector`: Enable Inspector notifications (true/false)
- `pEnableInspectorExport`: Enable Inspector findings export to S3 (true/false)

### IAM Access Analyzer Settings  
- `pEnableAccessAnalyzer`: Enable IAM Access Analyzer (true/false)

### Other Settings
- `pSecurityEmailEndpoint`: Email for security notifications
- `pEnvironmentTag`: Environment tag (production/development)

## Resources Created

- S3 buckets for logs and findings
- KMS keys for encryption
- IAM roles and policies
- CloudWatch log groups and alarms  
- SNS topics for notifications
- GuardDuty detector
- Config recorder and delivery channel
- CloudTrail trail
- Inspector and Access Analyzer configurations

## Outputs

The template provides outputs for the status and configuration of the deployed security tools.

## Usage

1. Upload the template to CloudFormation
2. Provide values for the parameters
3. Create the stack
4. Review the outputs for configuration details

## Notes

- Some resources are conditionally created based on parameter values
- HIPAA compliance settings are enabled if `pHipaaClient` is set to true
- Review and customize as needed for your specific requirements
