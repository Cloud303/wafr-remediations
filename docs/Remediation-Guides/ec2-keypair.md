---
layout: page
title:  Deploying EC2 Key Pair Generator
permalink: /remediation-guides/ec2-keypair/
resource: true
categories: [Remediation Guides]
---

#  Deploying EC2 Key Pair Generator

This guide will walk you through the process of deploying the EC2 Key Pair Generator CloudFormation template.

## Prerequisites

- AWS account with necessary permissions
- Access to AWS CloudFormation console or AWS CLI

## Template

The CloudFormation template can be found here:
[EC2 Key Pair Generator Template](https://github.com/Cloud303/wafr-remediations/blob/main/cloudformation/ec2/ec2-keypair.yml)

## Deployment Steps

1. **Access CloudFormation**
   - Log in to your AWS account
   - Navigate to the CloudFormation service

2. **Create New Stack**
   - Click on "Create stack"
   - Choose "With new resources (standard)"

3. **Specify Template**
   - Select "Upload a template file"
   - Click "Choose file" and select the downloaded template
   - Click "Next"

4. **Specify Stack Details**
   - Enter a Stack name
   - Set parameters:
     - `pKeyPairName`: Enter desired name (format: `<CLIENT NAME>-<ENVIRONMENT>-<YYYY-MM-DD>`)
     - `pEnvironmentTag`: Choose from allowed values (production, staging, sandbox, test, development, qa, dr)
   - Click "Next"

5. **Configure Stack Options**
   - Add any tags if required
   - Set permissions if necessary
   - Click "Next"

6. **Review**
   - Review all the details
   - Check the acknowledgment for IAM resources if prompted
   - Click "Create stack"

7. **Monitor Creation**
   - Wait for the stack creation to complete
   - Check the "Events" tab for progress and any errors

8. **Access Key Pair**
   - Once complete, the private key will be stored in Systems Manager Parameter Store
   - Path: `/ec2/keypair/key-*`

## Post-Deployment

- Ensure proper IAM permissions are set to restrict access to the parameter in Systems Manager
- The template version (ec2-keypair-v1.0) can be found in the Outputs section of the stack

## Updating the Key Pair

To update the key pair:
1. Delete the existing CloudFormation stack
2. Follow the deployment steps again with a new key pair name

## Security Considerations

- Limit access to the private key stored in Parameter Store
- Regularly rotate key pairs for enhanced security
- Monitor and audit access to the key pair and related resources

## Troubleshooting

If you encounter issues:
- Check CloudFormation events for error messages
- Verify IAM permissions
- Ensure parameter values are within allowed ranges

For further assistance, consult AWS documentation or contact support.
