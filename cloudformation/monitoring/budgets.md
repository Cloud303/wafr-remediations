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

## Resources

The template creates the following AWS resource:

- **AWS::Budgets::Budget**: Sets up a budget with specified limits and notification rules.

## Usage

1. Upload the template to CloudFormation or use it directly from an S3 bucket.
2. Create a new stack and provide values for the parameters.
3. Review and create the stack.

## Outputs

- **Version**: Displays the template version (budgets-0.1)

## Notes

- The budget is set up for the AWS account where the CloudFormation stack is created.
- Notifications are sent via email when actual spend exceeds the specified threshold percentage.
- The budget includes various cost types like credits, discounts, subscriptions, support, taxes, and upfront costs.

## License

This template is provided as-is under the MIT license.
