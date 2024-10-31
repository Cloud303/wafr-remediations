---
layout: page
title:  How to deploy AWS Security Tools CloudFormation Template
permalink: /cloud303-aws-security-tools/
resource: true
categories: [Remediation Guides]
---

#  How to deploy AWS Security Tools CloudFormation Template

This guide will walk you through deploying a comprehensive set of AWS security tools and configurations including CloudTrail, AWS Config, GuardDuty, Amazon Inspector, and IAM Access Analyzer.

## Prerequisites

- An AWS account with permissions to create the required resources
- Basic understanding of AWS CloudFormation

## Deployment Steps

1. **Access the CloudFormation Template**

   Download or access the CloudFormation template from the following link:
   
   [AWS Security Tools Template](https://github.com/Cloud303/wafr-remediations/blob/main/cloudformation/security-tools/cloud303-aws-security-tools.yml)

2. **Navigate to CloudFormation in AWS Console**

   Log in to your AWS account and navigate to the CloudFormation service.

3. **Create a New Stack**

   Click on "Create stack" and choose "With new resources (standard)".

4. **Specify Template**

   Choose "Upload a template file" and select the downloaded template, or use "Amazon S3 URL" and provide the template URL.

5. **Specify Stack Details**

   Enter a stack name and provide values for the parameters:

   - GuardDuty Settings
   - Config Settings
   - CloudTrail Settings
   - Inspector Settings
   - IAM Access Analyzer Settings
   - Other Settings (including security email and environment tag)

6. **Configure Stack Options**

   Add any tags, permissions, or advanced options as needed.

7. **Review**

   Review your stack details and acknowledge that the stack might create IAM resources.

8. **Create Stack**

   Click "Create stack" to begin the deployment process.

9. **Monitor Deployment**

   Watch the stack creation progress in the CloudFormation console. This may take several minutes.

10. **Review Outputs**

    Once the stack creation is complete, go to the "Outputs" tab to view important configuration details and resource information.

## Post-Deployment

- Verify that all selected services are properly configured and running.
- Test the notification systems to ensure they're working as expected.
- Review and customize any additional settings as needed for your specific requirements.

## Troubleshooting

If you encounter any issues during deployment:

- Check the "Events" tab in CloudFormation for error messages.
- Ensure your AWS account has the necessary permissions to create all resources.
- Verify that the parameters you provided are correct and compatible.

## Cleanup

To remove all deployed resources:

1. Go to the CloudFormation console.
2. Select the stack you created.
3. Click "Delete" and confirm the action.

Note: Deleting the stack will remove all resources created by this template. Ensure you have backups of any important data before proceeding.
