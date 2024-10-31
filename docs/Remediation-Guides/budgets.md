---
layout: page
title:  How to deploy AWS Budget with Email Notifications
permalink: /budgets/
resource: true
categories: [Remediation Guides]
---

#  How to deploy AWS Budget with Email Notifications

This guide will walk you through deploying an AWS Budget with email notifications for cost management using CloudFormation. The template creates a budget resource with customizable cost thresholds and notification settings.

## Prerequisites

- An AWS account
- Permissions to create CloudFormation stacks and Budget resources

## Template

The CloudFormation template can be found here:
[AWS Budget Template](https://github.com/Cloud303/wafr-remediations/blob/main/cloudformation/monitoring/budgets.yml)

## Deployment Steps

1. **Access CloudFormation**
   - Log into your AWS Console
   - Navigate to the CloudFormation service

2. **Create a New Stack**
   - Click on "Create stack"
   - Choose "With new resources (standard)"

3. **Specify Template**
   - Select "Upload a template file"
   - Click "Choose file" and upload the template or use the provided URL
   - Click "Next"

4. **Specify Stack Details**
   - Enter a Stack name
   - Fill in the parameters:
     - `pAmount`: Set your budget amount
     - `pTimeUnit`: Choose MONTHLY, QUARTERLY, or ANNUALLY (default is MONTHLY)
     - `pNotificationThreshold`: Set the percentage for budget alerts (default is 80)
     - `pNotificationEmail`: Enter the email address for notifications
   - Click "Next"

5. **Configure Stack Options**
   - Add any tags if needed
   - Set advanced options if required
   - Click "Next"

6. **Review**
   - Review your stack details
   - Check the acknowledgment box if it appears
   - Click "Create stack"

7. **Monitor Deployment**
   - Wait for the stack creation to complete
   - Check the "Events" tab for any issues

## Post-Deployment

- Verify the budget in the AWS Budgets console
- Test the email notification by simulating a threshold breach

## Cleanup

To remove the deployed resources:
1. Go to the CloudFormation console
2. Select the stack you created
3. Click "Delete"
4. Confirm the deletion

## Troubleshooting

- If stack creation fails, check the "Events" tab for error messages
- Ensure you have the necessary permissions to create Budget resources
- Verify that the email address for notifications is correct

For more details on parameters and resources created, refer to the original README file.
