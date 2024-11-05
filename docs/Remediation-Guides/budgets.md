---
layout: page
title: 'AWS Budget Notification Deployment Guide'
permalink: '/remediation-guides/budgets/'
resource: true
categories: [Remediation Guides]
parent: 'Remediation Guides'
---

#  AWS Budget Notification Deployment Guide

## Benefits
Deploying AWS Budget notifications provides several key advantages:
- Early warning system for cost overruns
- Proactive cost management and control
- Automated email alerts when spending thresholds are reached
- Comprehensive cost tracking including credits, discounts, and support fees
- Customizable budget periods and notification thresholds
- Simple setup through CloudFormation

## Prerequisites
Before deploying, ensure you have:
- An AWS account with permissions to create budgets
- A valid email address for notifications
- Access to AWS CloudFormation

## Deployment Steps

1. Download the CloudFormation template:
   - Template URL: [budgets.yml](https://github.com/Cloud303/wafr-remediations/blob/main/cloudformation/monitoring/budgets.yml)

2. Navigate to AWS CloudFormation console:
   - Sign in to AWS Console
   - Go to CloudFormation service
   - Click "Create stack" > "With new resources"

3. Upload template:
   - Choose "Upload a template file"
   - Select the downloaded budgets.yml file
   - Click "Next"

4. Configure stack parameters:
   - **pAmount**: Enter your desired budget amount in USD
   - **pTimeUnit**: Select budget reset period (MONTHLY/QUARTERLY/ANNUALLY)
   - **pNotificationThreshold**: Set notification threshold percentage (default: 80)
   - **pNotificationEmail**: Enter email address for notifications
   
5. Review and create:
   - Review the configuration
   - Click "Create stack"

6. Verify deployment:
   - Wait for stack creation to complete
   - Check AWS Budgets console to confirm budget creation
   - Verify receipt of confirmation email

## Post-Deployment

After successful deployment:
1. The budget will be created with name format: `{AccountId}-cloud303-billing-alarm`
2. You'll receive a subscription confirmation email
3. Notifications will trigger when spending exceeds the configured threshold

## Monitoring
- Monitor email notifications for cost alerts
- Review budget vs actual spending in AWS Budgets console
- Adjust thresholds and amounts as needed through stack updates

## Support
For issues or questions:
- Review the template documentation
- Check AWS Budgets documentation
- Contact your AWS support team

## Notes
- Budget notifications are free of charge
- Consider setting conservative thresholds initially
- Review and adjust settings based on spending patterns
