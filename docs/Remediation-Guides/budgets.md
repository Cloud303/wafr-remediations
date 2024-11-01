---
layout: page
title:  Deploying AWS Budget CloudFormation Template
permalink: /remediation-guides/budgets/
resource: true
categories: [Remediation Guides]
---

#  Deploying AWS Budget CloudFormation Template

## Benefits of Deploying This Template

Deploying the AWS Budget CloudFormation template offers several key advantages for managing your AWS costs:

1. **Automated Cost Control**: Set up budgets easily to monitor and control your AWS spending.
2. **Customizable Alerts**: Receive timely notifications when your costs approach or exceed defined thresholds.
3. **Flexible Budgeting**: Choose from monthly, quarterly, or annual budget cycles to suit your financial planning.
4. **Comprehensive Cost Tracking**: The budget includes various cost types, ensuring a holistic view of your AWS expenses.
5. **Easy Implementation**: Quickly deploy standardized budgeting across multiple accounts or projects using CloudFormation.

## Deployment Guide

### Prerequisites
- AWS account with permissions to create CloudFormation stacks and AWS Budgets
- Basic understanding of AWS CloudFormation

### Steps to Deploy

1. **Access the Template**
   - Download the CloudFormation template from [this GitHub link](https://github.com/Cloud303/wafr-remediations/blob/main/cloudformation/monitoring/budgets.yml).

2. **Navigate to AWS CloudFormation**
   - Log into your AWS Console and go to the CloudFormation service.

3. **Create a New Stack**
   - Click on "Create stack" and choose "With new resources (standard)".

4. **Specify Template**
   - Select "Upload a template file".
   - Click "Choose file" and upload the downloaded template.
   - Click "Next".

5. **Specify Stack Details**
   - Enter a Stack name (e.g., "AWS-Budget-Alarm").
   - Fill in the parameters:
     - `pAmount`: Set your desired budget amount in USD.
     - `pTimeUnit`: Choose MONTHLY, QUARTERLY, or ANNUALLY.
     - `pNotificationThreshold`: Set the percentage threshold for notifications (default is 80).
     - `pNotificationEmail`: Enter the email address for receiving notifications.
   - Click "Next".

6. **Configure Stack Options**
   - Add any tags if needed (optional).
   - Set advanced options if required (optional).
   - Click "Next".

7. **Review**
   - Review all the details you've entered.
   - Check the acknowledgment box at the bottom if it appears (regarding IAM resources).
   - Click "Create stack".

8. **Monitor Creation**
   - Wait for the stack creation to complete. This usually takes a few minutes.
   - Once the status shows "CREATE_COMPLETE", your budget is set up.

9. **Verify Budget**
   - Go to the AWS Billing Console.
   - Navigate to "Budgets" to see your newly created budget.

### Post-Deployment Steps

1. **Confirm Email Subscription**: Check the email address you provided and confirm the subscription to receive budget notifications.

2. **Test Notifications**: You can temporarily lower the budget amount to test if notifications are working correctly.

3. **Monitor and Adjust**: Regularly review your budget settings and adjust as needed based on your AWS usage patterns.

By following these steps, you'll successfully deploy an AWS Budget using the provided CloudFormation template, enabling effective cost management and monitoring for your AWS resources.
