---
layout: page
title:  Deploying a Customizable VPC Using CloudFormation
permalink: /remediation-guides/vpc/
resource: true
categories: [Remediation Guides]
---

#  Deploying a Customizable VPC Using CloudFormation

This guide will walk you through the process of deploying a highly customizable VPC infrastructure using a CloudFormation template. The template creates a VPC with public, private, and data subnets across multiple Availability Zones, along with various networking components.

## Template Link

You can find the CloudFormation template here: [VPC Template](https://github.com/Cloud303/wafr-remediations/blob/main/cloudformation/vpc/vpc.yml)

## Deployment Steps

### 1. Access AWS CloudFormation

- Log in to your AWS Management Console
- Navigate to the CloudFormation service

### 2. Create a New Stack

- Click on "Create stack"
- Choose "With new resources (standard)"

### 3. Specify Template

- Select "Upload a template file"
- Click "Choose file" and upload the VPC template you downloaded
- Click "Next"

### 4. Specify Stack Details

- Enter a stack name (e.g., "CustomVPC")
- Fill in the parameters:
  - Number of Availability Zones (1-4)
  - Availability Zone names
  - VPC CIDR block prefix
  - Subnet CIDR blocks (if custom)
  - Options for private and data subnets
  - Custom DNS settings (if needed)
  - VPC Flow Log retention period
  - Options for S3 and ECR VPC endpoints
  - Environment tag
- Click "Next"

### 5. Configure Stack Options

- Add any tags, permissions, or advanced options as needed
- Click "Next"

### 6. Review

- Review all the details you've entered
- Check the acknowledgment box at the bottom if you're creating IAM resources
- Click "Create stack"

### 7. Monitor Stack Creation

- Wait for the stack creation to complete
- You can monitor the progress in the "Events" tab

### 8. Access Outputs

- Once the stack creation is complete, go to the "Outputs" tab
- Here you'll find important information like VPC ID, Subnet IDs, etc.

## Post-Deployment

After successful deployment, you can use the exported outputs in other CloudFormation stacks or for manual resource creation within the new VPC.

## Customization

Remember, this template is highly customizable. You can adjust the parameters during stack creation to fit your specific needs, such as the number of Availability Zones, inclusion of private or data subnets, and addition of VPC endpoints.

## Troubleshooting

If you encounter any issues during deployment:
- Check the "Events" tab for error messages
- Ensure you have the necessary permissions to create all resources
- Verify that your chosen CIDR blocks don't conflict with existing VPCs

For more detailed information about the template and its features, refer to the README provided with the template.
