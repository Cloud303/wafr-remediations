---
layout: page
title:  VPC Deployment Guide
permalink: /remediation-guides/vpc/
resource: true
categories: [Remediation Guides]
---

#  VPC Deployment Guide

This guide walks through deploying a highly configurable VPC using CloudFormation. The template creates a production-ready VPC architecture with public, private and data subnets across multiple Availability Zones.

## Benefits

- **High Availability** - Deploy across up to 4 AZs for maximum redundancy
- **Security** - Isolated subnet tiers with Network ACLs and private networking
- **Cost Optimization** - Only deploy the resources you need with configurable options
- **Scalability** - Flexible CIDR ranges to accommodate future growth
- **Operational Excellence** - Consistent networking through Infrastructure as Code
- **Compliance** - VPC Flow Logs for network monitoring and auditing

## Prerequisites

- AWS account with permissions to create VPC resources
- Basic understanding of VPC networking concepts
- [CloudFormation template](https://github.com/Cloud303/wafr-remediations/blob/main/cloudformation/vpc/vpc.yml)

## Deployment Steps

1. Navigate to the AWS CloudFormation console

2. Click "Create stack" and choose "With new resources"

3. Upload the template file or specify the template URL

4. Configure the stack parameters:
   - Number of Availability Zones (1-4)
   - VPC CIDR block
   - Subnet CIDR blocks
   - Enable/disable private and data subnets
   - DNS settings
   - VPC Flow Log retention
   - VPC endpoint options
   - Environment tag

5. Review the configuration and create the stack

6. Monitor the stack creation progress

7. Once complete, note the outputs for use in other templates

## Post-Deployment

- Validate subnet connectivity
- Test NAT Gateway internet access from private subnets
- Verify VPC endpoint access if configured
- Review Network ACL rules
- Configure additional security groups as needed
- Set up monitoring for VPC Flow Logs

## Customization

The template can be customized by:

- Modifying CIDR ranges
- Adjusting the number of AZs
- Adding/removing subnet tiers
- Customizing Network ACL rules
- Enabling additional VPC endpoints
- Changing DNS settings

Refer to the template parameters for all available configuration options.

## Troubleshooting

Common issues:
- CIDR range conflicts
- Insufficient IP space
- Missing permissions
- NAT Gateway connectivity problems

Check CloudWatch Logs and the stack events for error details.
