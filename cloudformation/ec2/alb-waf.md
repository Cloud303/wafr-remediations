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

The template accepts the following parameters:

### ALB Settings

- `pAlbName` - Name of the ALB
- `pAlbType` - Internal or internet-facing ALB  
- `pAlbDeletionProtection` - Enable deletion protection
- `pCreateHttpsListener` - Create HTTPS listener
- `pAcmCertArn` - ACM certificate ARN for HTTPS
- `pHostname01` - Hostname for routing

### ALB Logging 

- `pAlbS3LogBucketLifeCycleDays` - S3 log retention period

### Target Group Settings

- `pEc2TgInstance01` - EC2 instance ID for target
- `pHealthCheckPath` - Health check path
- `pEnableTgStickySession` - Enable sticky sessions
- `pTgStickyDuration` - Sticky session duration

### WAF Settings

- `pEnableWaf` - Enable WAF integration
- `pOdooAlb` - Odoo-specific WAF rules

### Network Settings

- VPC, subnet, and CIDR parameters

## Usage

1. Upload the template to CloudFormation
2. Specify the required parameters
3. Create the stack

The template will create the ALB and associated resources based on the provided configuration.

## Outputs

- `ALBdnsName` - DNS name of the created ALB

## Version

Template version: alb-waf-0.4