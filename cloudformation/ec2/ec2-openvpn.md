#  OpenVPN Server CloudFormation Template

This CloudFormation template deploys an OpenVPN server running on Ubuntu 22.04 using Graviton Arm64 processors.

## Features

- Deploys OpenVPN Access Server on an EC2 instance
- Uses Ubuntu 22.04 ARM64 AMI  
- Configurable instance type (t4g.micro or t4g.small)
- Creates necessary security group and IAM roles
- Mounts additional EBS volume for OpenVPN data
- Configures OpenVPN settings
- Optional EC2 auto-recovery
- Optional DataDog monitoring tag

## Parameters

| Parameter | Description |
|-----------|-------------|
| pVpcId | VPC ID to deploy into |
| pVpcCidr | VPC CIDR for security group rules |
| pEc2InstanceType | EC2 instance type (t4g.micro or t4g.small) |
| pEc2KeyPairName | EC2 key pair name |
| pEc2InstanceSubnet | Subnet ID to deploy EC2 instance into |
| pOpenVpnAdminPassword | Password for OpenVPN admin user |
| pEnableEc2Autorecovery | Enable EC2 auto-recovery (true/false) |
| pDdMonitor | Enable DataDog monitoring tag (true/false) |
| pEnvironmentTag | Environment tag for resources |

## Resources Created

- EC2 Instance running OpenVPN Access Server
- Security Group 
- IAM Role and Instance Profile
- EIP and EIP Association
- Additional EBS Volume
- CloudWatch Alarms (if auto-recovery enabled)

## Outputs

- OpenVPN Instance ID
- OpenVPN Server URL
- Template Version

## Usage

1. Upload the template to CloudFormation
2. Provide values for the required parameters
3. Create the stack
4. Access the OpenVPN server using the URL in the outputs

## Notes

- Uses Ubuntu 22.04 ARM64 AMI
- Configures OpenVPN with basic settings
- Additional configuration may be required post-deployment
- Ensure your AWS account limits can accommodate the resources being created
