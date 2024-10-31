---
layout: page
title:  How to deploy AWS Security Tools CloudFormation Template
permalink: /cloud303-aws-security-tools/
resource: true
categories: [Remediation Guides]
---


This guide will walk you through deploying a comprehensive set of AWS security tools and configurations including CloudTrail, AWS Config, GuardDuty, Amazon Inspector, and IAM Access Analyzer.

## Prerequisites

- An AWS account with permissions to create the required resources
- Basic understanding of AWS CloudFormation

## Deployment Steps

1. Access the CloudFormation template:
   [AWS Security Tools Template](https://github.com/Cloud303/wafr-remediations/blob/main/cloudformation/security-tools/cloud303-aws-security-tools.yml)

2. Navigate to the AWS CloudFormation console in your desired region.

3. Click "Create stack" and choose "With new resources (standard)".

4. Select "Upload a template file" and upload the downloaded template.

5. Click "Next" to proceed to the stack details page.

6. Enter a stack name (e.g., "AWS-Security-Tools").

7. Configure the parameters:

   ### GuardDuty Settings
   - `pEnableGuardDuty`: Choose whether to enable GuardDuty (true/false)
   - `pGuardDutyPublishFrequency`: Set the findings delivery frequency
   - `pGuardDutyMalwareProtection`: Enable/disable GuardDuty Malware Protection

   ### Config Settings
   - `pEnableConfig`: Choose to enable Config (true/false/AutoDetect)
   - `pCreateConfigAll`: Decide whether to create all Config resources
   - `pConfigDeliveryFrequency`: Set the configuration snapshot delivery frequency

   ### CloudTrail Settings
   - `pEnableCloudtrail`: Choose to enable CloudTrail in all regions
   - `pLogGroupRetention`: Set the CloudWatch Log Group retention period

   ### Inspector Settings
   - `pEnableInspector`: Enable/disable Inspector notifications
   - `pEnableInspectorExport`: Choose to export Inspector findings to S3

   ### IAM Access Analyzer Settings
   - `pEnableAccessAnalyzer`: Enable/disable IAM Access Analyzer

   ### Other Settings
   - `pHipaaClient`: Enable HIPAA compliance configurations if required
   - `pSecurityEmailEndpoint`: Provide an email for security notifications
   - `pEnvironmentTag`: Set the environment tag (production/development)

8. Click "Next" to proceed to the stack options page.

9. Configure any additional stack options if needed, then click "Next".

10. Review the stack details and acknowledge that the template might create IAM resources.

11. Click "Create stack" to begin the deployment process.

12. Monitor the stack creation progress in the CloudFormation console.

13. Once the stack status shows "CREATE_COMPLETE", navigate to the "Outputs" tab to view important information about the deployed resources.

## Post-Deployment Steps

1. Verify that all resources have been created successfully by checking the Resources tab in CloudFormation.

2. Configure any additional settings for the deployed services as needed through their respective AWS console pages.

3. Set up monitoring and alerting for the security findings from GuardDuty, Inspector, and other tools.

4. Regularly review and act on the security recommendations and findings provided by the deployed tools.

5. Ensure that the email provided for security notifications is monitored and that alerts are acted upon promptly.

## Troubleshooting

- If the stack creation fails, check the "Events" tab in CloudFormation for error messages.
- Ensure that your IAM user or role has sufficient permissions to create all the resources defined in the template.
- If specific services fail to deploy, verify that they are available in your chosen region.

## Security Best Practices

- Regularly update and patch all systems and applications.
- Use the principle of least privilege when granting IAM permissions.
- Enable multi-factor authentication (MFA) for all IAM users.
- Regularly rotate access keys and review IAM policies.
- Monitor and analyze logs from CloudTrail and other services.

By following this guide, you will have deployed a robust set of security tools to enhance the security posture of your AWS environment. Remember to continuously monitor and adjust your security settings as your infrastructure evolves.
