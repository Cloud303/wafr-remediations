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
- VPC Flow Logs
- Optional S3 and ECR VPC endpoints
- Customizable DHCP options

## Parameters

The template includes many parameters to customize the VPC configuration:

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
- S3 VPC Endpoint (optional)
- ECR VPC Endpoints (optional)

## Outputs

The template exports the following as CloudFormation outputs:

- VPC ID and CIDR
- Subnet IDs 
- Route table IDs
- NACL IDs

These can be referenced in other stacks using `Fn::ImportValue`.

## Usage

1. Upload the template to CloudFormation
2. Specify parameter values
3. Create the stack
4. Reference outputs in other templates as needed

## Customization

The template uses conditions extensively to allow customizing which resources are created. Modify parameters and conditions as needed to adjust the VPC architecture.