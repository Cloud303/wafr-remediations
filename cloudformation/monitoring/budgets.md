#  AWS Budget CloudFormation Template

This CloudFormation template creates an AWS Budget with email notifications for cost management.

## Description

This template allows you to set up an AWS Budget with customizable parameters for cost thresholds and notifications. It's designed to help monitor and manage AWS spending across your account.

## Parameters

| Parameter | Description | Default |
|-----------|-------------|---------|
| pAmount | The cost associated with the budget forecast, actual spend, or threshold | - |
| pTimeUnit | The budget reset period | MONTHLY |
| pNotificationThreshold | Budget threshold percentage for notification | 80 |
| pNotificationEmail | Email address for notifications | - |

## Resources Created

- **AWS::Budgets::Budget**: Creates an AWS Budget resource with specified limits and notifications.

## Usage

1. Upload the template to CloudFormation or use it with AWS CLI.
2. Provide values for the required parameters:
   - Cost/Amount
   - Time Unit of Budget (MONTHLY, QUARTERLY, or ANNUALLY)
   - Budget Threshold for Notification (percentage)
   - Email ID for Notifications

## Notifications

The template sets up email notifications when actual spending exceeds the specified threshold percentage of the budgeted amount.

## Outputs

- **Version**: Displays the template version (budgets-0.1)

## Notes

- The budget includes various cost types like credits, discounts, subscriptions, support, taxes, and upfront costs.
- The notification is set for ACTUAL spending compared to the budget.
- Only email notifications are configured in this template.

## Customization

You can modify the template to add more notification types, change the budget types, or adjust the cost types included in the budget calculation.
