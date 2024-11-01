#  OpenVPN Server CloudFormation Template

This CloudFormation template deploys an OpenVPN server running on Ubuntu 22.04 using Graviton Arm64 processors.

## Features

- Deploys OpenVPN server on EC2 instance
- Uses Ubuntu 22.04 ARM64 AMI  
- Configurable instance type (t4g.micro or t4g.small)
- Creates necessary security group
- Attaches Elastic IP
- Optional EC2 auto-recovery
- DataDog monitoring integration

## Parameters

The template accepts the following parameters:

- `pVpcId` - VPC ID to deploy into
- `pVpcCidr` - VPC CIDR for security group rules  
- `pEc2InstanceType` - EC2 instance type (t4g.micro or t4g.small)
- `pEc2KeyPairName` - EC2 key pair name
- `pEc2InstanceSubnet` - Subnet ID to launch instance in
- `pOpenVpnAdminPassword` - Password for OpenVPN admin user
- `pEnableEc2Autorecovery` - Enable EC2 auto-recovery (true/false)
- `pDdMonitor` - Enable DataDog monitoring (true/false)
- `pEnvironmentTag` - Environment tag value

## Resources Created

- EC2 Instance 
- Security Group
- IAM Role & Instance Profile
- Elastic IP
- CloudWatch Alarms (if auto-recovery enabled)

## Usage

1. Upload template to CloudFormation
2. Provide required parameter values
3. Create stack
4. Access OpenVPN server at the Elastic IP address

## Outputs

- `OpenVpnInstanceId` - EC2 Instance ID
- `OpenVPNServerURL` - URL to access OpenVPN server
- `TemplateVersion` - Version of this template

## Notes

- Uses Ubuntu 22.04 ARM64 AMI
- Mounts additional EBS volume for OpenVPN data
- Configures OpenVPN with provided settings
- Enables CloudWatch alarms for auto-recovery if specified