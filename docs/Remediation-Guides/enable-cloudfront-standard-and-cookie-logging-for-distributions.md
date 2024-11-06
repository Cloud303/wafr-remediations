---
layout: page
title: 'Enable CloudFront standard and cookie logging for distributions'
permalink: '/remediation-guides/enable-cloudfront-standard-and-cookie-logging-for-distributions/'
resource: true
categories: [Remediation Guides]
parent: 'Remediation Guides'
---

#  Enable CloudFront standard and cookie logging for distributions

## Benefits
- Provides detailed visibility into requests made to your CloudFront distributions
- Helps with security monitoring and troubleshooting
- Enables analysis of viewer behavior and access patterns
- Assists in detecting and investigating potential security incidents
- Supports compliance requirements for logging and monitoring

## Impact
Enabling logging will incur additional costs for:
- S3 storage used to store the log files
- Data transfer of logs from CloudFront to S3

## Prerequisites
- An S3 bucket to store CloudFront logs
- Appropriate IAM permissions to modify CloudFront distributions and S3 bucket policies

## Remediation Steps

### 1. Create/Configure S3 Bucket for Logs
1. Create a new S3 bucket or use an existing one for CloudFront logs
2. Add the following bucket policy to allow CloudFront to write logs:
```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AllowCloudFrontLogging",
            "Effect": "Allow",
            "Principal": {
                "Service": "cloudfront.amazonaws.com"
            },
            "Action": "s3:PutObject",
            "Resource": "arn:aws:s3:::your-bucket-name/*"
        }
    ]
}
```

### 2. Enable Standard Logging via AWS Console
1. Sign in to the AWS Management Console
2. Navigate to CloudFront console
3. Select the distribution you want to enable logging for
4. Click on "Edit" in the "General" tab
5. Under "Standard logging", select "On"
6. Specify the S3 bucket to store logs
7. Optional: Specify a prefix for log file names
8. Save changes

### 3. Enable Cookie Logging
1. In the same distribution settings
2. Navigate to "Behaviors" tab
3. Select the cache behavior you want to modify
4. Click "Edit"
5. Under "Cache key and origin requests"
6. Set "Cookie logging" to "On"
7. Save changes

### 4. Verify Logging Configuration
1. Wait 24 hours for logs to appear
2. Check the specified S3 bucket for log files
3. Verify log files contain expected information
4. Test by making requests to your CloudFront distribution

## Best Practices
- Regularly review and analyze logs
- Set up appropriate S3 lifecycle policies for log retention
- Consider using AWS Athena for log analysis
- Monitor S3 storage costs
- Implement log file encryption if required

## Additional Considerations
- Log files are delivered several times an hour
- There may be a delay of up to 24 hours before logs appear
- Consider enabling access logging on the S3 bucket for additional security
- Review and comply with relevant compliance requirements for log retention
