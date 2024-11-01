#  AWS Budget CloudFormation Template

This CloudFormation template creates an AWS Budget with email notifications for cost management.

## Description

This template allows you to set up a budget in AWS Billing and Cost Management, with customizable parameters for budget amount, time unit, notification threshold, and email notifications.

## Parameters

| Parameter | Description | Default | Allowed Values |
|-----------|-------------|---------|----------------|
| pAmount | The cost associated with the budget | - | Number |
| pTimeUnit | Budget reset period | MONTHLY | MONTHLY, QUARTERLY, ANNUALLY |
| pNotificationThreshold | Budget threshold percentage for notification | 80 | String |
| pNotificationEmail | Email address for notifications | - | String |

## Resources Created

- AWS::Budgets::Budget: Creates a budget with specified parameters

## Outputs

- Version: Displays the template version (budgets-0.1)

## Usage

1. Upload the template to CloudFormation
2. Provide values for the required parameters:
   - pAmount: Set your budget amount in USD
   - pTimeUnit: Choose MONTHLY, QUARTERLY, or ANNUALLY
   - pNotificationThreshold: Set percentage threshold for notifications
   - pNotificationEmail: Provide email address for notifications
3. Create the stack

The template will create a budget named `<AccountID>-cloud303-billing-alarm` with the specified settings and email notifications.

## Notes

- The budget includes various cost types like credits, discounts, subscriptions, support, taxes, etc.
- Notifications are set for ACTUAL spend exceeding the specified threshold percentage.
- Make sure to have necessary permissions to create AWS Budgets in your account.
