---
layout: page
title: AWS Security Tools Best Practices
permalink: /aws-security-tools/
---

# Deploying the AWS Security Tools CloudFormation Template

This guide provides instructions for deploying the AWS Security Tools CloudFormation Template to set up a suite of security configurations and services across your AWS account.

## Overview

The AWS Security Tools CloudFormation template deploys a set of AWS-native security tools, enabling services such as CloudTrail, AWS Config, GuardDuty, Inspector, and IAM Access Analyzer. This template is designed to provide comprehensive security monitoring, auditing, and compliance management capabilities for your AWS environment.

### Features

The template configures and deploys the following features:
- **CloudTrail**: Enabled across all regions with log encryption
- **AWS Config**: Configures resource configurations and snapshots in a specified region
- **GuardDuty**: Threat detection across your AWS account, with optional malware protection
- **Amazon Inspector**: Identifies security vulnerabilities and provides findings notifications
- **IAM Access Analyzer**: Monitors and analyzes IAM access policies

## Deployment Instructions

1. **Obtain the Template**
   - Download or link to the template from [cloud303-aws-security-tools.yml](https://github.com/Cloud303/wafr-remediations/blob/main/cloudformation/security-tools/cloud303-aws-security-tools.yml).

2. **Access AWS CloudFormation Console**
   - Sign in to the [AWS Management Console](https://aws.amazon.com/console/) and navigate to **CloudFormation**.

3. **Create Stack**
   - Select **Create stack** and choose **With new resources (standard)**.

4. **Specify Template**
   - Under **Specify template**, select **Upload a template file**.
   - Upload the `cloud303-aws-security-tools.yml` file you downloaded or link directly from the provided GitHub URL.

5. **Configure Stack Options**
   - Provide a **Stack name** (e.g., `AWS-Security-Tools`).
   - Configure the parameters as outlined below.

### Parameter Configuration

The template allows configuration of several parameters. Review each section to customize according to your needs.

#### GuardDuty Settings
- **pEnableGuardDuty**: Set to `true` to enable GuardDuty across your account.
- **pGuardDutyPublishFrequency**: Choose frequency for GuardDuty findings delivery (options: `FIFTEEN_MINUTES`, `ONE_HOUR`, `SIX_HOURS`).
- **pGuardDutyMalwareProtection**: Set to `true` to enable malware protection with GuardDuty.

#### Config Settings  
- **pEnableConfig**: Set to `true`, `false`, or `AutoDetect` to manage AWS Config setup.
- **pCreateConfigAll**: Set to `true` to deploy all Config resources.
- **pConfigDeliveryFrequency**: Define the frequency for AWS Config snapshot deliveries (options: `One_Hour`, `Three_Hours`, `Six_Hours`, `Twelve_Hours`, `TwentyFour_Hours`).

#### CloudTrail Settings
- **pEnableCloudtrail**: Set to `true` to enable CloudTrail across all regions.
- **pLogGroupRetention**: Define log retention period in CloudWatch (in days).

#### Inspector Settings
- **pEnableInspector**: Set to `true` to activate Amazon Inspector notifications.
- **pEnableInspectorExport**: Set to `true` to export Inspector findings to S3.

#### IAM Access Analyzer Settings
- **pEnableAccessAnalyzer**: Set to `true` to enable IAM Access Analyzer.

#### Other Settings
- **pHipaaClient**: Enable HIPAA compliance settings by setting this to `true`.
- **pSecurityEmailEndpoint**: Provide the email for security notifications.
- **pEnvironmentTag**: Define the environment tag (e.g., `production`, `development`).

6. **Review and Launch the Stack**
   - Review the parameters and ensure they align with your security and compliance needs.
   - Acknowledge AWS CloudFormation's capabilities to create IAM resources by checking the relevant box.
   - Click **Create stack** to deploy the template.

7. **Monitor Stack Creation**
   - CloudFormation will begin provisioning resources. You can monitor the progress under the **Events** tab.
   - Once the stack creation completes, verify the status under the **Outputs** tab for resource statuses and links.

### Important Considerations

- **Conditional Resources**: Some resources are created conditionally based on your parameter selections (e.g., HIPAA compliance settings).
- **IAM and KMS Policies**: Ensure that IAM roles and KMS key policies are correctly configured to prevent unauthorized access to sensitive data.
- **HIPAA Compliance**: Setting `pHipaaClient` to `true` will add configurations aligned with HIPAA requirements.

## Resources Created

This template provisions the following resources:
- S3 buckets for CloudTrail and AWS Config logs
- CloudTrail trail and associated logging configurations
- AWS Config recorder and delivery channel
- GuardDuty detector and optional malware protection
- SNS topics and CloudWatch rules for notifications
- IAM roles and policies required for security services
- KMS encryption keys for log data
- Amazon Inspector and IAM Access Analyzer

For more details on the resources created, refer to the **Resources Created** section in the template README.

## Troubleshooting

If any errors occur during stack creation:
- Check the **Events** tab for detailed error messages.
- Verify IAM permissions and KMS key policies if there are access issues.

## Additional Information

For advanced configurations and a deeper dive into each security tool, refer to AWS’s documentation on [Security Best Practices](https://aws.amazon.com/architecture/security/).

For more information, view the template on GitHub: [cloud303-aws-security-tools.yml](https://github.com/Cloud303/wafr-remediations/blob/main/cloudformation/security-tools/cloud303-aws-security-tools.yml).