---
layout: page
title: 'EC2 Key Pair Deployment Guide'
permalink: '/remediation-guides/ec2-keypair/'
resource: true
categories: [Remediation Guides]
---

#  EC2 Key Pair Deployment Guide

## Benefits
Deploying this template provides several key advantages:
- Automated and consistent creation of EC2 key pairs across environments
- Secure storage of private keys in AWS Systems Manager Parameter Store
- Simplified key management through CloudFormation
- Proper tagging and organization of key pair resources
- Controlled access through IAM policies

## Prerequisites
Before deploying, ensure you have:
- AWS account access with permissions to:
  - Create and manage EC2 key pairs
  - Create and manage Parameter Store entries
  - Deploy CloudFormation stacks
- AWS CLI configured with appropriate credentials
- Basic understanding of CloudFormation concepts

## Deployment Steps

1. Download the CloudFormation template:
   - Template URL: [ec2-keypair.yml](https://github.com/Cloud303/wafr-remediations/blob/main/cloudformation/ec2/ec2-keypair.yml)

2. Deploy via AWS Console:
   - Navigate to CloudFormation in AWS Console
   - Click "Create Stack" and choose "With new resources"
   - Upload the template file
   - Click "Next"

3. Configure Stack Parameters:
   - **pKeyPairName**: Enter a name following the format `<CLIENT>-<ENV>-<YYYY-MM-DD>`
   - **pEnvironmentTag**: Select environment (production, staging, sandbox, etc.)

4. Configure Stack Options:
   - Add any additional tags if needed
   - Set stack failure options
   - Click "Next"

5. Review and Create:
   - Review all configurations
   - Acknowledge any capabilities if prompted
   - Click "Create stack"

## Post-Deployment

1. Verify Resources:
   - Check EC2 console for the new key pair
   - Verify Parameter Store entry at `/ec2/keypair/key-*`

2. Access Management:
   - Review and configure IAM policies to restrict access to the private key
   - Document who has access to the key pair

## Security Best Practices

- Limit access to the Parameter Store entry containing the private key
- Regularly audit access to the key pair
- Rotate keys according to your security policies
- Monitor CloudTrail for any unauthorized access attempts

## Troubleshooting

If deployment fails:
1. Check CloudFormation events for error messages
2. Verify IAM permissions
3. Ensure parameter values meet requirements
4. Review service quotas if applicable

## Support

For issues or questions:
- Review CloudFormation documentation
- Check AWS service status
- Contact your AWS administrator
