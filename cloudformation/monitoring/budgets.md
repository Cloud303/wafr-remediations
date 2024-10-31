#  AWS Budget CloudFormation Template

This CloudFormation template creates an AWS Budget with email notifications for cost management.

## Description

This template allows you to set up an AWS Budget with customizable parameters for cost thresholds and notification settings. It helps monitor and manage AWS spending by creating budget alerts.

## Parameters

| Parameter | Description | Default |
|-----------|-------------|---------|
| pAmount | The cost associated with the budget forecast, actual spend, or threshold | - |
| pTimeUnit | The budget reset period | MONTHLY |
| pNotificationThreshold | Budget threshold percentage for notification | 80 |
| pNotificationEmail | Email address for notifications | - |

## Resources Created

- AWS::Budgets::Budget: Creates an AWS Budget resource

## Usage

1. Upload the template to CloudFormation
2. Provide values for the required parameters:
   - Cost/Amount
   - Time Unit of Budget (MONTHLY, QUARTERLY, or ANNUALLY)
   - Budget Threshold for Notification (percentage)
   - Email ID for Notifications
3. Create the stack

## Outputs

- Version: Displays the template version (budgets-0.1)

## Notes

- The budget is set up to include various cost types like credits, discounts, subscriptions, etc.
- Notifications are sent when actual costs exceed the specified threshold percentage
- Only email notifications are configured in this template

## Contributing

Feel free to submit pull requests or create issues for any improvements or bug fixes.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.