#  AWS Budget Notification CloudFormation Template

This CloudFormation template creates an AWS Budget with email notifications when actual costs exceed the specified threshold.

## Overview

The template sets up:
- An AWS Budget to track costs
- Email notification when spending exceeds threshold percentage
- Configurable budget amount, time period and notification settings

## Parameters

| Parameter | Description | Default |
|-----------|-------------|---------|
| pAmount | Budget amount in USD | - |
| pTimeUnit | Budget reset period (MONTHLY/QUARTERLY/ANNUALLY) | MONTHLY |
| pNotificationThreshold | Notification threshold percentage | 80 |
| pNotificationEmail | Email address for notifications | - |

## Usage

1. Create a new stack using this template
2. Specify the required parameters:
   - Set your desired budget amount
   - Choose the time period 
   - Configure notification threshold percentage
   - Enter email address for notifications
3. Create stack

The template will create a budget named `{AccountId}-cloud303-billing-alarm`

## Cost Types Included

The budget tracks the following cost types:
- Credits
- Discounts  
- Subscriptions (including other and recurring)
- Support
- Tax
- Upfront costs
- Refunds

## Notifications

Email notifications will be sent when:
- Actual costs exceed the specified threshold percentage of the budget amount

## Output

The template outputs its version number as `budgets-0.1`

## Requirements

- AWS Account
- Permissions to create AWS Budgets
- Valid email address for notifications

## License

This template is provided as-is under MIT license.