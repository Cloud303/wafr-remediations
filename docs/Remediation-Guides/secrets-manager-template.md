---
layout: page
title:  Deploying RDS Secrets Manager Rotation with CloudFormation
permalink: /remediation-guides/secrets-manager-template/
resource: true
categories: [Remediation Guides]
---

#  Deploying RDS Secrets Manager Rotation with CloudFormation

This guide will walk you through the process of deploying an AWS CloudFormation template that sets up AWS Secrets Manager for RDS database credentials with automated rotation.

## Prerequisites

- AWS CLI configured with appropriate permissions
- Access to the AWS Management Console
- VPC, subnets, and security groups already set up
- An existing RDS instance

## Template

The CloudFormation template can be found here:
[RDS Secrets Manager Rotation Template](https://github.com/Cloud303/wafr-remediations/blob/main/cloudformation/secrets-manager/secrets-manager-template.yml)

## Deployment Steps

1. **Prepare Parameters**

   Gather the following information:
   - RDS database port
   - Environment tag
   - VPC ID
   - Security Group ID
   - VPC CIDR block
   - KMS key ARN for Secrets Manager
   - Two private subnet IDs
   - RDS instance identifier
   - RDS cluster ARN

2. **Launch CloudFormation Stack**

   a. Open the AWS Management Console and navigate to CloudFormation.
   b. Click "Create stack" and choose "With new resources (standard)".
   c. Select "Upload a template file" and upload the template linked above.
   d. Click "Next".

3. **Specify Stack Details**

   Enter a stack name and fill in the parameters with the values you gathered in step 1.

4. **Configure Stack Options**

   Add any tags, permissions, or advanced options as needed. Click "Next".

5. **Review**

   Review your configuration. Check the acknowledgment for IAM resource creation if prompted.

6. **Create Stack**

   Click "Create stack" to begin the deployment process.

7. **Monitor Progress**

   Watch the "Events" tab in the CloudFormation console for progress and any potential errors.

8. **Verify Resources**

   Once the stack creation is complete, verify that all resources have been created successfully:
   - Check Secrets Manager for the new secret
   - Verify the Lambda function for rotation exists
   - Confirm the IAM roles and policies are in place
   - Ensure the VPC endpoints are created

## Post-Deployment

- The secret will be automatically rotated every 60 days.
- You can manually rotate the secret through the Secrets Manager console if needed.
- Monitor CloudWatch Logs for the Lambda function to ensure rotations are successful.

## Troubleshooting

- If the stack creation fails, check the "Events" tab for error messages.
- Ensure all prerequisite resources (VPC, subnets, etc.) exist and are correctly specified.
- Verify that the IAM user or role executing the template has sufficient permissions.

## Security Best Practices

- Regularly audit who has access to the secrets and rotation lambda function.
- Use AWS CloudTrail to monitor access to Secrets Manager.
- Consider implementing additional monitoring and alerting for failed rotations.

## Customization

To modify the template:
1. Download the template file.
2. Make necessary changes (e.g., adjusting rotation schedule, permissions).
3. Validate the modified template using CloudFormation Designer or `aws cloudformation validate-template`.
4. Deploy the updated template following the steps above.

Always test changes in a non-production environment before applying to production systems.
