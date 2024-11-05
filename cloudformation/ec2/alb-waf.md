#  Application Load Balancer with WAF CloudFormation Template

This CloudFormation template creates an Application Load Balancer (ALB) with optional WAF integration and HTTP to HTTPS redirection.

## Features

- Creates either an internet-facing or internal ALB
- Optional HTTPS listener with HTTP->HTTPS redirection
- Optional WAF integration with XSS and SQL injection protection rules
- ALB access logging to S3 with configurable retention
- Target group with configurable sticky sessions
- Optional DataDog monitoring integration
- Deletion protection option

## Parameters

### ALB Settings
- `pAlbName` - Name of the ALB
- `pAlbType` - ALB scheme (internal or internet-facing)
- `pAlbDeletionProtection` - Enable/disable deletion protection
- `pCreateHttpsListener` - Create HTTPS listener
- `pAcmCertArn` - ACM certificate ARN for HTTPS
- `pHostname01` - Host header for routing

### ALB Logging
- `pAlbS3LogBucketLifeCycleDays` - Days to retain ALB logs (1-365)

### Target Group Settings  
- `pEc2TgInstance01` - Target EC2 instance ID
- `pHealthCheckPath` - Health check path
- `pEnableTgStickySession` - Enable sticky sessions
- `pTgStickyDuration` - Sticky session duration (seconds)

### WAF Settings
- `pEnableWaf` - Enable WAF integration
- `pOdooAlb` - Enable Odoo-specific WAF rules

### Network Settings
- `pVpcId` - VPC ID
- `pVpcCidr` - VPC CIDR
- `pPublicSubnet01/02` - Public subnets for internet-facing ALB
- `pPrivateSubnet01/02` - Private subnets for internal ALB

## Resources Created

- Application Load Balancer
- Security Group
- S3 Bucket for ALB logs
- Target Group
- HTTP/HTTPS Listeners
- WAF Web ACL (if enabled)
  - SQL Injection protection
  - XSS protection
  - Odoo-specific rules (if enabled)

## Usage

1. Create a new stack using this template
2. Provide required parameter values
3. Review and create stack
4. Access ALB using the DNS name from stack outputs

## Outputs

- `ALBdnsName` - DNS name of the created ALB
- `Version` - Template version

## Requirements

- VPC with public/private subnets
- ACM certificate (for HTTPS)
- Target EC2 instance

## Version
Current version: alb-waf-0.4