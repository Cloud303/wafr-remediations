#  Application Load Balancer with WAF CloudFormation Template

This CloudFormation template creates an Application Load Balancer (ALB) with optional Web Application Firewall (WAF) integration.

## Features

- Creates either an internet-facing or internal ALB
- Configurable HTTP to HTTPS redirection 
- Optional WAF integration with XSS and SQL injection protection
- ALB access logging to S3
- Configurable target group with health checks and sticky sessions
- Supports DataDog monitoring integration

## Parameters

### ALB Settings

- `pAlbName` - Name of the ALB
- `pAlbType` - Internal or internet-facing ALB
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

- `pEnableWaf` - Enable WAF
- `pOdooAlb` - Odoo-specific WAF rules

### Other Settings

- Network configuration (VPC, subnets)
- Environment tagging
- DataDog monitoring option

## Resources Created

- Application Load Balancer
- Target Group
- Security Group
- S3 Bucket for ALB logs
- WAF Web ACL (if enabled)
- WAF rules for SQL injection and XSS protection

## Usage

1. Upload the template to CloudFormation
2. Provide values for the required parameters
3. Create the stack

The ALB DNS name will be provided in the stack outputs.

## Version

alb-waf-0.4