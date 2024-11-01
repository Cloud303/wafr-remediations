---
layout: page
title:  AWS Budget Deployment Guide
permalink: /remediation-guides/budgets/
resource: true
categories: [Remediation Guides]
---

#  AWS Budget Deployment Guide

## Benefits of AWS Budget Deployment

Setting up AWS Budgets provides several key advantages:

- **Cost Control**: Get early warnings when spending approaches defined thresholds
- **Financial Planning**: Track costs against monthly, quarterly or annual budgets
- **Automated Monitoring**: Receive email notifications without manual tracking
- **Comprehensive Coverage**: Monitor all cost types including credits, taxes, and support fees
- **Proactive Management**: Take action before costs exceed planned amounts

## Deployment Steps

### Prerequisites
- AWS Account access with permissions to create CloudFormation stacks
- Email address for notifications

### Template
The CloudFormation template can be found here:
[AWS Budget Template](https://github.com/Cloud303/wafr-remediations/blob/main/cloudformation/monitoring/budgets.yml)

### Deployment Instructions

1. Navigate to AWS CloudFormation in your AWS Console

2. Click "Create Stack" and choose "With new resources"

3. Upload the template or specify the template URL

4. Configure the required parameters:
   - `pAmount`: Set your desired budget amount
   - `pTimeUnit`: Choose MONTHLY, QUARTERLY, or ANNUALLY
   - `pNotificationThreshold`: Set percentage for alerts (default 80)
   - `pNotificationEmail`: Enter notification email address

5. Click through the stack creation wizard, reviewing the settings

6. Acknowledge that CloudFormation will create IAM resources

7. Click "Create stack"

### Verification

1. Once the stack creation is complete, verify in the AWS Budgets console that your budget appears

2. Confirm the notification email address receives a subscription confirmation

3. Check the CloudFormation outputs to verify the version (budgets-0.1)

## Customization Options

The budget can be customized by modifying the template:

- Change the budget name
- Adjust which cost types are included/excluded
- Add additional notification thresholds
- Modify notification types

## Troubleshooting

Common issues and solutions:

- If stack creation fails, check IAM permissions
- If notifications aren't received, verify email subscription was confirmed
- For threshold issues, ensure percentage is entered as a number (e.g. 80)

## Support

For template issues or questions, refer to:
- AWS Budgets documentation
- CloudFormation documentation
- The template README
