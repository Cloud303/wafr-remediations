---
layout: page
title: 'AWS VPC Infrastructure Deployment Guide'
permalink: '/remediation-guides/vpc/'
resource: true
categories: [Remediation Guides]
---

#  AWS VPC Infrastructure Deployment Guide

This guide walks through deploying a production-ready VPC infrastructure using CloudFormation. The template creates a highly available and secure VPC architecture with the following benefits:

- **High Availability** - Deploy across up to 4 Availability Zones for maximum redundancy
- **Network Segmentation** - Separate public, private and data subnet tiers for security
- **Internet Access** - NAT Gateways and Internet Gateway for controlled outbound access
- **VPC Endpoints** - Optional S3 and ECR endpoints for secure AWS service access
- **Network Controls** - NACLs and Flow Logs for network security and monitoring
- **Flexible Configuration** - Customizable CIDR ranges and subnet options
- **DNS Integration** - Custom domain name and domain controller support

## Prerequisites

Before deploying, ensure you have:

- AWS account with permissions to create VPC resources
- Sufficient Elastic IP quota for NAT Gateways (1 per AZ)
- CloudFormation template access

## Deployment Steps

1. Access the CloudFormation console in your AWS account

2. Create a new stack and upload the template:
   - Template URL: [vpc.yml](https://github.com/Cloud303/wafr-remediations/blob/main/cloudformation/vpc/vpc.yml)

3. Configure stack parameters:

   **VPC Structure**
   - Select number of Availability Zones (1-4)
   - Choose specific AZs or let AWS select automatically
   - Enter VPC CIDR prefix
   - Enable/disable private and data subnet tiers
   - Select CIDR allocation method

   **DNS Configuration** 
   - Enter custom internal domain name (optional)
   - Specify up to 3 domain controller IPs (optional)
   - Configure DHCP options

   **VPC Endpoints**
   - Enable/disable S3 endpoint
   - Enable/disable ECR endpoint

   **Additional Settings**
   - Set Flow Log retention period
   - Add Environment tag

4. Review the configuration and create stack

5. Monitor stack creation progress in the CloudFormation console

6. Once complete, note the exported resources in the Outputs tab:
   - VPC ID and CIDR
   - Subnet IDs for each tier
   - Route table IDs
   - NACL IDs

## Post-Deployment

After successful deployment:

1. Verify subnet configurations and routing
2. Test connectivity between subnet tiers
3. Validate VPC endpoint access if enabled
4. Check Flow Logs are being generated
5. Configure additional resources like security groups as needed

## Support

For issues or questions, refer to:
- Template documentation
- AWS VPC documentation
- CloudFormation troubleshooting guides
