#  Application Load Balancer with WAF CloudFormation Template

This CloudFormation template creates an Application Load Balancer (ALB) with optional Web Application Firewall (WAF) integration.

## Features

- Creates an internet-facing or internal ALB
- Configures HTTP to HTTPS redirection 
- Sets up ALB logging to S3
- Creates target groups and listener rules
- Optionally integrates with AWS WAF
- Supports sticky sessions
- Configurable health checks
- Tagging support

## Parameters

### ALB Settings

- `pAlbName` - Name of the ALB
- `pAlbType` - Internal or internet-facing
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

### Network Settings

- VPC ID and CIDR
- Public and private subnet IDs

## Usage

1. Upload the template to CloudFormation
2. Provide values for the required parameters
3. Create the stack

The template will create the ALB and associated resources based on the provided configuration.

## Outputs

- `ALBdnsName` - DNS name of the created ALB

## Version

Current template version: alb-waf-0.4