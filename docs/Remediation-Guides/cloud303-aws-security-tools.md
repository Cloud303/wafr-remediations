---
layout: page
title:  Deploying AWS Security Tools CloudFormation Template
permalink: /cloud303-aws-security-tools/
resource: true
categories: [Remediation Guides]
---

#  Deploying AWS Security Tools CloudFormation Template

This guide will walk you through the process of deploying a comprehensive set of AWS security tools using a CloudFormation template.

## Template Link

The CloudFormation template can be found here: [AWS Security Tools Template](https://github.com/Cloud303/wafr-remediations/blob/main/cloudformation/security-tools/cloud303-aws-security-tools.yml)

## Deployment Steps

1. **Access AWS CloudFormation**
   - Log in to your AWS Management Console
   - Navigate to the CloudFormation service

2. **Create a New Stack**
   - Click on "Create stack"
   - Choose "With new resources (standard)"

3. **Specify Template**
   - Select "Upload a template file"
   - Click "Choose file" and upload the template from your local machine
   - Alternatively, you can use the template URL provided above

4. **Specify Stack Details**
   - Enter a stack name (e.g., "AWS-Security-Tools")
   - Fill in the parameters as described below:

### Parameters

#### GuardDuty Settings
- `pEnableGuardDuty`: Choose whether to enable GuardDuty account-wide (true/false)
- `pGuardDutyPublishFrequency`: Set the findings delivery frequency
- `pGuardDutyMalwareProtection`: Decide if you want to enable GuardDuty Malware Protection (true/false)

#### Config Settings
- `pEnableConfig`: Choose to enable Config in the deployed region (true/false/AutoDetect)
- `pCreateConfigAll`: Decide if you want to create all Config resources (true/false)
- `pConfigDeliveryFrequency`: Set the configuration snapshot delivery frequency

#### CloudTrail Settings
- `pEnableCloudtrail`: Choose to enable CloudTrail in all regions (true/false)
- `pLogGroupRetention`: Set the CloudWatch Log Group retention period in days
- `pHipaaClient`: Enable HIPAA compliance settings if required (true/false)

#### Inspector Settings
- `pEnableInspector`: Choose to enable Inspector notifications (true/false)
- `pEnableInspectorExport`: Decide if you want to enable Inspector findings export to S3 (true/false)

#### IAM Access Analyzer Settings
- `pEnableAccessAnalyzer`: Choose to enable IAM Access Analyzer (true/false)

#### Other Settings
- `pSecurityEmailEndpoint`: Enter an email for security notifications
- `pEnvironmentTag`: Set the environment tag (production/development)

5. **Configure Stack Options**
   - Add any tags if needed
   - Configure advanced options if required

6. **Review**
   - Review all the details you've entered
   - Acknowledge that the template might create IAM resources

7. **Create Stack**
   - Click "Create stack" to start the deployment process

8. **Monitor Progress**
   - Watch the stack creation progress in the "Events" tab
   - This process may take several minutes to complete

9. **Check Outputs**
   - Once the stack creation is complete, go to the "Outputs" tab
   - Here you'll find important information such as:
     - Status of enabled services (GuardDuty, Inspector, Access Analyzer, Config, CloudTrail)
     - S3 bucket names for CloudTrail and Config logs
     - CloudTrail Log Group name
     - Template version

## Post-Deployment

- Review the IAM permissions and S3 bucket policies created by this template
- Ensure all services are running as expected
- Set up any additional monitoring or alerting based on the newly deployed security tools

## Notes

- Some resources are conditionally created based on the parameter values you provided
- If you enabled HIPAA compliance settings, ensure your AWS account is approved for HIPAA workloads
- Regularly review and update your security settings as needed
