#  OpenVPN Server on AWS CloudFormation

This CloudFormation template deploys an OpenVPN server running on Ubuntu 22.04 using AWS Graviton (ARM64) processors.

## Features

- Runs on cost-effective ARM64-based instances (t4g family)
- Uses latest Ubuntu 22.04 AMI
- Automatic volume mounting and configuration
- CloudWatch-based auto-recovery
- DataDog monitoring integration (optional)
- Secure defaults with TLS 1.2
- Automatic log rotation

## Prerequisites

Before deploying this template, you'll need:

- An existing VPC with a public subnet
- An EC2 key pair
- Appropriate IAM permissions to create the required resources

## Parameters

### OpenVPN Instance Settings
- `pEc2InstanceType`: Instance size (t4g.micro or t4g.small)
- `pEc2KeyPairName`: EC2 key pair for SSH access
- `pOpenVpnAdminPassword`: Admin password for OpenVPN dashboard (8-32 chars)

### Networking Settings
- `pVpcId`: Target VPC ID
- `pVpcCidr`: VPC CIDR range
- `pEc2InstanceSubnet`: Public subnet ID

### Optional Features
- `pEnableEc2Autorecovery`: Enable automatic instance recovery (true/false)
- `pDdMonitor`: Enable DataDog monitoring (true/false)
- `pEnvironmentTag`: Environment tag (production/staging/etc)

## Security Features

- Security group limited to required ports (UDP 1194, TCP 943, TCP 443)
- TLS 1.2 minimum version
- SSM Session Manager access
- API termination protection enabled
- Password requirements enforced

## Resources Created

- EC2 Instance running OpenVPN
- Security Group
- IAM Role & Instance Profile
- Elastic IP
- CloudWatch Alarms (if auto-recovery enabled)

## Outputs

- `OpenVpnInstanceId`: EC2 instance ID
- `OpenVPNServerURL`: HTTPS URL to access OpenVPN
- `TemplateVersion`: Template version number

## Usage

1. Launch the stack through AWS CloudFormation
2. Provide the required parameters
3. Wait for stack creation to complete (~5-10 minutes)
4. Access the OpenVPN admin interface at the URL provided in outputs
5. Login with "openvpn" username and the admin password specified during deployment

## Maintenance

- The instance will automatically rotate logs to prevent disk space issues
- System updates are applied during initial deployment
- Auto-recovery will handle hardware failures if enabled
- Separate EBS volume for OpenVPN data persistence

## Version
Current version: ec2-openvpn-ubuntu-arm64-v2.1