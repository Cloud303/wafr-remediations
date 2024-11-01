---
layout: page
title:  Deploying EC2 Key Pair Using CloudFormation
permalink: /remediation-guides/ec2-keypair/
resource: true
categories: [Remediation Guides]
---

#  Deploying EC2 Key Pair Using CloudFormation

This guide will walk you through deploying an EC2 Key Pair using a CloudFormation template. By using this template, you can easily create and manage EC2 Key Pairs across your AWS environments.

## Benefits of Deploying This Template

1. **Automation**: Streamlines the process of creating EC2 Key Pairs, reducing manual effort and potential errors.
2. **Consistency**: Ensures a standardized approach to key pair creation across different environments.
3. **Security**: Automatically stores the private key in AWS Systems Manager Parameter Store, enhancing security.
4. **Traceability**: Provides clear documentation of key pair creation through CloudFormation stack resources.
5. **Easy Management**: Simplifies the process of updating or deleting key pairs through stack updates or deletion.

## Deployment Steps

1. Access the CloudFormation template [here](https://github.com/Cloud303/wafr-remediations/blob/main/cloudformation/ec2/ec2-keypair.yml).

2. Log in to your AWS Console and navigate to the CloudFormation service.

3. Click on "Create stack" and choose "With new resources (standard)".

4. Select "Upload a template file" and upload the downloaded template.

5. Click "Next" to proceed to the stack details page.

6. Enter a stack name of your choice.

7. Provide values for the parameters:
   - `pKeyPairName`: Specify a name for your EC2 Key Pair (default format: `<CLIENT NAME>-<ENVIRONMENT>-<YYYY-MM-DD>`)
   - `pEnvironmentTag`: Choose the appropriate environment tag from the allowed values

8. Click "Next" to proceed through the stack options.

9. Review the stack details and acknowledge any capabilities if prompted.

10. Click "Create stack" to initiate the deployment.

11. Wait for the stack creation to complete. You can monitor the progress in the "Events" tab.

12. Once complete, the EC2 Key Pair will be created and the private key stored in Parameter Store.

## Post-Deployment

- The private key can be accessed from the Parameter Store at `/ec2/keypair/key-*`.
- Ensure proper IAM permissions are set for accessing the private key in Parameter Store.
- The template version `ec2-keypair-v1.0` can be found in the stack outputs for reference.

By following this guide, you can efficiently deploy and manage EC2 Key Pairs using CloudFormation, enhancing your AWS infrastructure management capabilities.
