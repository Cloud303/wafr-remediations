#  OpenVPN Server on AWS CloudFormation

This CloudFormation template deploys an OpenVPN server running on Ubuntu 22.04 using ARM64 (Graviton) processors in AWS.

## Features

- Deploys OpenVPN Access Server on an EC2 instance
- Uses Ubuntu 22.04 ARM64 AMI  
- Supports t4g.micro and t4g.small instance types
- Creates necessary security group, IAM role and instance profile
- Mounts an EBS volume for OpenVPN data persistence
- Configures OpenVPN with basic settings
- Optional EC2 auto-recovery via CloudWatch alarms
- Tagging support including optional DataDog monitoring tag

## Parameters

The template requires the following parameters:

- VPC ID and CIDR
- EC2 instance type, key pair, and subnet 
- OpenVPN admin password
- Environment tag
- Enable/disable EC2 auto-recovery
- Enable/disable DataDog monitoring tag

## Usage

1. Upload the template to CloudFormation
2. Provide required parameter values
3. Create the stack
4. Access the OpenVPN server using the URL in the stack outputs

## Outputs

- OpenVPN Instance ID
- OpenVPN Server URL 
- Template Version

## Security

- Restricts access to OpenVPN ports (UDP 1194, TCP 943, TCP 443)
- Uses IAM role for EC2 instance
- Disables API termination protection on EC2 instance

## Customization

The template can be customized by modifying the CloudFormation resources and parameters as needed.

## Version

Current template version: ec2-openvpn-ubuntu-arm64-v2.1