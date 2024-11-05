#  AWS Security Tools CloudFormation Template

This CloudFormation template deploys core AWS security services including CloudTrail, Config, GuardDuty, Inspector and IAM Access Analyzer.

## Features

- **CloudTrail**
  - Multi-region trail with encrypted logs
  - CloudWatch log integration
  - HIPAA compliance monitoring (optional)

- **AWS Config** 
  - Single region configuration recorder
  - S3 bucket for configuration history
  - HIPAA conformance pack (optional)

- **GuardDuty**
  - Account-wide threat detection
  - Optional malware protection
  - Findings delivered to SNS

- **Inspector**
  - Vulnerability assessment
  - Critical findings notifications
  - Optional S3 export of findings

- **IAM Access Analyzer**
  - Account-level analyzer
  - Findings delivered to SNS

## Parameters

### GuardDuty Settings
- `pEnableGuardDuty` - Enable GuardDuty (true/false)
- `pGuardDutyPublishFrequency` - Findings delivery frequency
- `pGuardDutyMalwareProtection` - Enable malware protection (true/false)

### Config Settings  
- `pEnableConfig` - Enable Config (true/false/AutoDetect)
- `pCreateConfigAll` - Create all Config resources (true/false)
- `pConfigDeliveryFrequency` - Configuration snapshot frequency

### CloudTrail Settings
- `pEnableCloudtrail` - Enable CloudTrail (true/false) 
- `pLogGroupRetention` - Log retention period in days
- `pHipaaClient` - Enable HIPAA compliance monitoring (true/false)

### Inspector Settings
- `pEnableInspector` - Enable Inspector notifications (true/false)
- `pEnableInspectorExport` - Enable findings export to S3 (true/false)

### IAM Access Analyzer Settings
- `pEnableAccessAnalyzer` - Enable Access Analyzer (true/false)

### Other Settings
- `pSecurityEmailEndpoint` - Email for security notifications
- `pEnvironmentTag` - Environment tag (production/development)

## Usage

1. Upload template to CloudFormation
2. Configure parameters based on requirements
3. Create stack
4. Monitor security findings via configured SNS topics

## Outputs

- GuardDuty, Inspector, Config and CloudTrail status
- S3 bucket names for CloudTrail and Config logs
- CloudWatch log group for CloudTrail
- Template version

## Notes

- HIPAA compliance mode enables additional monitoring and retention
- Services can be enabled/disabled independently
- Encrypted S3 buckets used for log storage
- SNS topics created for findings notifications