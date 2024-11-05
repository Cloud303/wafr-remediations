#  AWS VPC CloudFormation Template

This CloudFormation template creates a VPC with configurable public, private and data subnets across multiple Availability Zones. It includes NAT Gateways, Internet Gateway, VPC Endpoints and Network ACLs.

## Features

- Creates VPC spanning 1-4 Availability Zones
- Optional public, private and data subnets in each AZ
- NAT Gateway in each AZ for private subnet internet access
- Internet Gateway for public subnet internet access
- Optional S3 and ECR VPC Endpoints
- Network ACLs for each subnet tier
- VPC Flow Logs
- Custom DHCP Options with optional domain controllers
- Configurable CIDR ranges
- Resource tagging

## Parameters

### VPC Structure
- Number of AZs (1-4)
- Availability Zone selection
- VPC CIDR prefix
- Enable/disable private subnets
- Enable/disable data subnets
- Manual or automatic CIDR allocation

### DNS Settings
- Custom internal domain name
- Up to 3 domain controller IPs
- DHCP options

### VPC Endpoints
- S3 endpoint (optional)
- ECR endpoint (optional) 

### Other Settings
- Flow log retention period
- Environment tag

## Outputs

The template exports the following resources:

- VPC ID and CIDR
- Public subnet IDs
- Private subnet IDs 
- Data subnet IDs
- Route table IDs
- NACL IDs

## Usage

1. Upload template to CloudFormation
2. Specify required parameters
3. Create stack

The template will create the VPC infrastructure based on the parameters provided.

## Requirements

- AWS account with permissions to create VPC resources
- Sufficient Elastic IP address quota for NAT Gateways

## Version
vpc-0.4