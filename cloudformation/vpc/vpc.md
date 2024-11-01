#  VPC CloudFormation Template

This CloudFormation template creates a customizable VPC infrastructure with public, private, and data subnets across multiple Availability Zones.

## Features

- Creates a VPC spanning 1-4 Availability Zones
- Public subnets with Internet Gateway
- Private subnets with NAT Gateways (optional)
- Private data subnets (optional)  
- Network ACLs and route tables for each subnet
- VPC Flow Logs
- S3 and ECR VPC Endpoints (optional)
- Custom DHCP options (optional)

## Parameters

The template accepts the following parameters:

- Number of Availability Zones (1-4)
- Availability Zone names
- VPC CIDR block prefix
- Option to specify custom subnet CIDR blocks
- Options to create private and data subnets
- Custom DNS settings
- VPC Flow Log retention period
- Options to create S3 and ECR VPC endpoints
- Environment tag

## Usage

1. Upload the template to CloudFormation
2. Specify the desired parameters 
3. Create the stack

The template will create the VPC infrastructure based on the provided parameters.

## Outputs

The template outputs the following:

- VPC ID and CIDR
- Subnet IDs 
- Route table IDs
- NACL IDs

These outputs are exported for use in other stacks.

## Customization

The template uses conditions to selectively create resources based on the input parameters. This allows for a high degree of customization while using a single template.

## Version

Current template version: vpc-0.4