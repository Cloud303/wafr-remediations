#  VPC CloudFormation Template

This CloudFormation template creates a customizable VPC infrastructure with public, private, and data subnets across multiple Availability Zones.

## Features

- Configurable number of Availability Zones (1-4)
- Public subnets with Internet Gateway
- Optional private subnets with NAT Gateways 
- Optional data subnets
- Customizable CIDR blocks
- VPC Flow Logs
- S3 and ECR VPC Endpoints
- Custom DNS settings

## Parameters

The template accepts the following parameters:

- Number of Availability Zones (1-4)
- Availability Zone names
- VPC CIDR prefix
- Option to specify custom subnet CIDRs
- Options to create private and data subnets
- Custom DNS settings
- VPC Flow Log retention period
- Options for S3 and ECR VPC Endpoints
- Environment tag

## Resources Created

- VPC
- Internet Gateway
- Public subnets (1-4)
- Private subnets (0-4) 
- Data subnets (0-4)
- NAT Gateways (1 per AZ)
- Route tables
- Network ACLs
- VPC Flow Logs
- S3 VPC Endpoint
- ECR VPC Endpoints

## Outputs

The template exports the following outputs:

- VPC ID and CIDR
- Subnet IDs 
- Route table IDs
- NACL IDs

## Usage

1. Upload the template to CloudFormation
2. Specify the desired parameters 
3. Create the stack
4. Reference the exported outputs in other stacks

## Customization

The template can be customized by modifying the parameters, conditions, and resources as needed for your specific requirements.