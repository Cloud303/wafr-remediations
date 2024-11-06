---
layout: page
title: 'Enable Lambda Function Logging'
permalink: '/remediation-guides/enable-lambda-function-logging/'
resource: true
categories: [Remediation Guides]
parent: 'Remediation Guides'
---

#  Enable Lambda Function Logging

## Benefits
- Provides visibility into Lambda function execution and performance
- Helps with debugging and troubleshooting issues
- Enables monitoring of function behavior and errors
- Supports compliance and audit requirements through execution history
- Facilitates performance optimization by analyzing execution patterns

## Overview
AWS Lambda functions should have logging enabled to CloudWatch Logs to track execution details, errors, and performance metrics. This guide walks through enabling logging for Lambda functions.

## Prerequisites
- AWS account with appropriate IAM permissions
- Existing Lambda function(s) that need logging enabled
- Basic familiarity with AWS Lambda and CloudWatch services

## Implementation Steps

### 1. Configure IAM Role Permissions

Ensure the Lambda execution role has the required CloudWatch Logs permissions:

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogGroup",
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ],
            "Resource": "arn:aws:logs:*:*:*"
        }
    ]
}
```

### 2. Enable Logging via AWS Console

1. Open the AWS Lambda console
2. Select the Lambda function to configure
3. Navigate to the "Configuration" tab
4. Select "Monitoring and operations tools"
5. Enable "CloudWatch Logs"
6. Click "Save"

### 3. Enable Logging via AWS CLI

```bash
aws lambda update-function-configuration \
    --function-name YOUR_FUNCTION_NAME \
    --region YOUR_REGION \
    --tracing-config Mode=Active
```

### 4. Add Logging Statements to Function Code

#### Python Example:
```python
import logging
logger = logging.getLogger()
logger.setLevel(logging.INFO)

def lambda_handler(event, context):
    logger.info('Function started')
    # Your function code here
    logger.info('Function completed')
```

#### Node.js Example:
```javascript
exports.handler = async function(event, context) {
    console.log('Function started');
    // Your function code here
    console.log('Function completed');
};
```

### 5. Verify Logging Configuration

1. Navigate to CloudWatch Logs in AWS Console
2. Look for log group: `/aws/lambda/YOUR_FUNCTION_NAME`
3. Test the Lambda function
4. Verify logs appear in the log group

## Best Practices

1. Use structured logging formats (JSON) for better parsing
2. Include relevant context in log messages
3. Set appropriate log levels (ERROR, INFO, DEBUG)
4. Implement log retention policies
5. Use sampling for high-volume functions
6. Add request IDs to trace transactions

## Monitoring and Maintenance

1. Regularly review logs for errors and patterns
2. Set up CloudWatch Alarms for error thresholds
3. Monitor log volume and adjust retention settings
4. Review and update logging patterns as needed

## Troubleshooting

If logs are not appearing:
1. Verify IAM role permissions
2. Check function configuration
3. Ensure log statements are properly formatted
4. Review CloudWatch Logs service quotas

## Additional Resources

- [AWS Lambda Logging Documentation](https://docs.aws.amazon.com/lambda/latest/dg/monitoring-cloudwatchlogs.html)
- [CloudWatch Logs Documentation](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/WhatIsCloudWatchLogs.html)
