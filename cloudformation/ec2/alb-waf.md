#  Application Load Balancer with WAF CloudFormation Template

This CloudFormation template creates an Application Load Balancer (ALB) with optional Web Application Firewall (WAF) integration.

## Features

- Creates an internet-facing or internal ALB
- Configures HTTP to HTTPS redirection 
- Integrates with AWS WAF (optional)
- Supports sticky sessions on target groups
- Configures ALB access logging to S3
- Applies custom tags including DataDog monitoring tag

## Parameters

### ALB Settings

- `pAlbName` - Name of the ALB
- `pAlbType` - Internal or Internet-Facing ALB
- `pAlbDeletionProtection` - Enable deletion protection
- `pCreateHttpsListener` - Create HTTPS listener
- `pAcmCertArn` - ACM certificate ARN for HTTPS
- `pHostname01` - Hostname for routing

### Logging Settings  

- `pAlbS3LogBucketLifeCycleDays` - S3 log retention period

### Target Group Settings

- `pEc2TgInstance01` - Target EC2 instance ID
- `pHealthCheckPath` - Health check path
- `pEnableTgStickySession` - Enable sticky sessions
- `pTgStickyDuration` - Sticky session duration

### WAF Settings

- `pEnableWaf` - Enable WAF integration
- `pOdooAlb` - Odoo-specific WAF rules

### Other Settings

- Network configuration (VPC, subnets)
- Environment tag

## Resources Created

- Application Load Balancer
- Target Group
- Listeners and Rules
- Security Group
- S3 Bucket for ALB logs
- WAF Web ACL (if enabled)

## Outputs

- ALB DNS Name
- Template Version

## Usage

1. Upload template to CloudFormation
2. Specify parameter values
3. Create stack

The ALB will be created with the specified configuration and optional WAF integration.