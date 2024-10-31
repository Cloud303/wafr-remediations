#  AWS Security Tools CloudFormation Template

This CloudFormation template deploys a comprehensive set of AWS security tools and configurations to enhance the security posture of your AWS account.

## Features

- CloudTrail configuration with encrypted logs across all regions
- AWS Config setup in a single region 
- Account-wide GuardDuty with optional malware protection
- Amazon Inspector configuration
- IAM Access Analyzer setup

## Parameters

The template accepts the following parameters:

### GuardDuty Settings
- `pEnableGuardDuty`: Enable GuardDuty account-wide (true/false)
- `pGuardDutyPublishFrequency`: Findings delivery frequency 
- `pGuardDutyMalwareProtection`: Enable GuardDuty Malware Protection (true/false)

### Config Settings  
- `pEnableConfig`: Enable Config in deployed region (true/false/AutoDetect)
- `pCreateConfigAll`: Create all Config resources (true/false)
- `pConfigDeliveryFrequency`: Configuration snapshot delivery frequency

### CloudTrail Settings
- `pEnableCloudtrail`: Enable CloudTrail in all regions (true/false) 
- `pLogGroupRetention`: CloudWatch Log Group retention period in days
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

The template creates the following key resources:

- S3 buckets for CloudTrail and Config logs
- CloudWatch Log Groups  
- IAM roles and policies
- KMS keys for encryption
- SNS topics for notifications
- GuardDuty detector
- Config recorder and delivery channel
- CloudTrail trail
- Inspector and Access Analyzer configurations

## Outputs

The template provides outputs for:

- Status of enabled services (GuardDuty, Inspector, Access Analyzer, Config, CloudTrail)
- S3 bucket names for CloudTrail and Config logs
- CloudTrail Log Group name
- Template version

## Usage

1. Upload the template to CloudFormation
2. Provide values for the parameters  
3. Review and create the stack
4. Monitor the creation progress and check outputs once complete

## Notes

- Some resources are conditionally created based on parameter values
- HIPAA compliance settings can be enabled with the `pHipaaClient` parameter
- Review IAM permissions and S3 bucket policies created by this template
