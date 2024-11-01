#  VPC CloudFormation Template

This CloudFormation template creates a customizable VPC with public, private, and data subnets across multiple Availability Zones. It also sets up NAT Gateways, an Internet Gateway, and VPC endpoints.

## Features

- Configurable number of Availability Zones (1-4)
- Public subnets in each AZ
- Optional private and data subnets in each AZ  
- NAT Gateways in public subnets for private subnet internet access
- Internet Gateway for public subnet internet access
- Customizable CIDR blocks
- Network ACLs for each subnet
- Optional S3 and ECR VPC endpoints
- VPC Flow Logs
- Custom DHCP options

## Parameters

The template accepts many parameters to customize the VPC configuration:

- Number of AZs to use (1-4)
- AZ names
- VPC CIDR block
- Options to create private and data subnets
- CIDR blocks for each subnet
- Custom DNS settings
- VPC Flow Log retention period
- VPC endpoint options
- Environment tag

## Resources Created

- VPC
- Internet Gateway  
- Public subnets (1-4)
- Private subnets (0-4)
- Data subnets (0-4)
- NAT Gateways
- Route tables
- Network ACLs
- VPC Flow Logs
- VPC Endpoints (optional)
- DHCP Options Set

## Outputs

The template outputs IDs and other details for the created resources, including:

- VPC ID and CIDR
- Subnet IDs 
- Route table IDs
- NACL IDs

Many outputs are exported for use in other stacks.

## Usage

1. Upload the template to CloudFormation
2. Specify parameter values
3. Create the stack
4. Reference outputs in other templates as needed

## Customization

The template uses conditions extensively to allow customizing the VPC architecture. Key areas that can be customized:

- Number of AZs (1-4)
- Whether to create private and data subnets
- CIDR blocks for VPC and subnets
- DNS settings
- VPC endpoints

Modify the template as needed for your specific requirements.