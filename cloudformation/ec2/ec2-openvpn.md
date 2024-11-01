#  OpenVPN Server on AWS CloudFormation

This CloudFormation template deploys an OpenVPN server running on Ubuntu 22.04 using ARM64 (Graviton) processors in AWS.

## Features

- Deploys OpenVPN Access Server on an EC2 instance
- Uses Ubuntu 22.04 ARM64 AMI  
- Configurable instance type (t4g.micro or t4g.small)
- Creates necessary security group for OpenVPN access
- Assigns Elastic IP for static public IP
- Optional EC2 auto-recovery via CloudWatch alarms
- Configurable environment tagging
- Optional DataDog monitoring tag

## Parameters

The template accepts the following parameters:

- VPC ID and CIDR
- EC2 instance type  
- EC2 key pair name
- Subnet ID for deployment
- OpenVPN admin password
- Enable/disable EC2 auto-recovery
- Enable/disable DataDog monitoring
- Environment tag

## Usage

1. Upload the template to CloudFormation
2. Provide values for the required parameters 
3. Create the stack
4. Once complete, access the OpenVPN server via the Elastic IP output

## Security

- EC2 instance has termination protection enabled
- Security group allows only necessary inbound traffic
- IAM role with SSM permissions attached to EC2 instance

## Customization

The template can be customized by modifying the following:

- EC2 instance type options
- EBS volume sizes
- OpenVPN configuration options in UserData

## Outputs

- OpenVPN Instance ID
- OpenVPN Server URL 
- Template version

## Version

Current template version: ec2-openvpn-ubuntu-arm64-v2.1