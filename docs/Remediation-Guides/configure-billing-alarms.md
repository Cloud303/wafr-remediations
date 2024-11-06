---
layout: page
title: 'Configure billing alarms'
permalink: '/remediation-guides/configure-billing-alarms/'
resource: true
categories: [Remediation Guides]
parent: 'Remediation Guides'
---

#  Configure billing alarms

Configuring AWS billing alarms helps you monitor and control your cloud costs by sending notifications when your AWS charges exceed defined thresholds. This proactive approach to cost management can help:

- Prevent unexpected charges and bill shock
- Identify cost anomalies early
- Stay within budget limits
- Enable timely cost optimization actions

## Prerequisites

- AWS account with administrator access
- Access to AWS CloudWatch and SNS services
- Valid email address to receive notifications

## Implementation Steps

### 1. Enable Billing Alerts

1. Sign in to the AWS Management Console
2. Navigate to your account name in the top right and select "My Account"
3. Scroll to "Billing preferences"
4. Check the box for "Receive Billing Alerts"
5. Click "Save preferences"

### 2. Create an SNS Topic

1. Open the Amazon SNS console
2. Click "Create topic"
3. Select "Standard" for type
4. Enter a name (e.g., "billing-alerts")
5. Click "Create topic"
6. Click "Create subscription"
7. Select "Email" as the protocol
8. Enter your email address
9. Click "Create subscription"
10. Confirm subscription via the email you receive

### 3. Create the Billing Alarm

1. Open the CloudWatch console
2. Switch to the "us-east-1" (N. Virginia) region as billing metrics are only available here
3. Click "Alarms" in the left navigation
4. Click "Create alarm"
5. Click "Select metric"
6. Choose "Billing" > "Total Estimated Charge"
7. Select "USD" and click "Select metric"
8. Configure the alarm:
   - Set the threshold amount (e.g., $50)
   - Choose "Greater than" as the condition
   - Set the period to 6 hours
9. Under notification:
   - Select the SNS topic created earlier
10. Add a name and description for your alarm
11. Click "Create alarm"

### 4. Verify Setup

1. Confirm you received the subscription confirmation email
2. Check that the alarm appears in CloudWatch console
3. Verify the alarm status is "OK"

## Best Practices

- Set multiple alarms at different thresholds (e.g., 50%, 75%, 90% of budget)
- Review and adjust thresholds periodically
- Consider setting up alarms for individual services if you use them heavily
- Document alarm settings and notification procedures for your team

## Troubleshooting

If you don't receive notifications:
- Verify email subscription is confirmed
- Check alarm configuration in CloudWatch
- Ensure billing alerts are enabled in account preferences
- Confirm you're in the us-east-1 region for billing metrics

## Additional Resources

- [AWS Billing and Cost Management Documentation](https://docs.aws.amazon.com/account-billing/)
- [CloudWatch Billing Metrics Documentation](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/monitor_estimated_charges_with_cloudwatch.html)
