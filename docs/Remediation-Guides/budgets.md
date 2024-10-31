---
layout: page
title:  Deploying AWS Budget CloudFormation Template
permalink: /budgets/
resource: true
categories: [Remediation Guides]
---

#  Deploying AWS Budget CloudFormation Template

This guide will walk you through the process of deploying an AWS Budget using the CloudFormation template provided. This template creates a budget with email notifications for cost management in your AWS account.

## Template Link

You can find the CloudFormation template here: [AWS Budget Template](https://github.com/Cloud303/wafr-remediations/blob/main/cloudformation/monitoring/budgets.yml)

## Deployment Steps

### 1. Access AWS CloudFormation

- Log in to your AWS Management Console
- Navigate to the CloudFormation service

### 2. Create a New Stack

- Click on "Create stack"
- Choose "With new resources (standard)"

### 3. Specify Template

- Select "Upload a template file"
- Click "Choose file" and upload the downloaded template
- Click "Next"

### 4. Specify Stack Details

- Enter a Stack name (e.g., "AWS-Budget-Monitoring")
- Fill in the parameters:
  - **pAmount**: Enter the budget amount
  - **pTimeUnit**: Choose MONTHLY, QUARTERLY, or ANNUALLY (default is MONTHLY)
  - **pNotificationThreshold**: Enter the threshold percentage for notifications (default is 80)
  - **pNotificationEmail**: Enter the email address for notifications
- Click "Next"

### 5. Configure Stack Options

- Add any tags if needed (optional)
- Set permissions if required (optional)
- Click "Next"

### 6. Review

- Review all the details
- Check the acknowledgment box at the bottom if it appears
- Click "Create stack"

### 7. Monitor Stack Creation

- Wait for the stack creation to complete
- You can monitor the progress in the "Events" tab

### 8. Verify Budget Creation

- Once the stack creation is complete, go to the AWS Budgets console
- Verify that the new budget appears with the specified parameters

### 9. Test Notifications

- To test the notification system, you can temporarily lower the threshold or the budget amount
- Ensure that you receive an email notification when the threshold is crossed

## Post-Deployment

- Monitor your AWS Budgets dashboard regularly
- Adjust the budget amount or notification threshold as needed by updating the stack

## Troubleshooting

- If stack creation fails, check the "Events" tab for error messages
- Ensure you have the necessary permissions to create budgets and CloudFormation stacks
- Verify that the email address for notifications is correct and can receive AWS notifications

## Customization

To customize the budget further:
- Modify the template to include additional notification types
- Adjust the cost types included in the budget calculation
- Change the budget type if needed

Remember to version control any changes you make to the template for future reference and deployments.
