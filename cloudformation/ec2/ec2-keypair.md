#  EC2 Key Pair CloudFormation Template

This CloudFormation template creates an EC2 key pair and stores the private key value in AWS Systems Manager Parameter Store.

## Overview

The template provisions:
- An EC2 key pair resource
- Parameter Store entry containing the private key value at `/ec2/keypair/key-*`

## Parameters

| Parameter | Description | Default | Allowed Values |
|-----------|-------------|---------|----------------|
| pKeyPairName | Name of the EC2 key pair to create | `<CLIENT>-<ENV>-<YYYY-MM-DD>` | Any string |
| pEnvironmentTag | Environment tag for resource tagging | `sandbox` | production, staging, sandbox, test, development, qa, dr |

## Usage

1. Create a stack using this template
2. Provide values for:
   - Key pair name
   - Environment tag
3. The key pair will be created and the private key stored in Parameter Store

## Outputs

| Output | Description |
|--------|-------------|
| TemplateVersion | Version of the template (ec2-keypair-v1.0) |

## Prerequisites

- AWS account with permissions to:
  - Create EC2 key pairs
  - Create Parameter Store entries

## Security

The private key is stored securely in Parameter Store. Access to the key should be restricted using IAM policies.

## License

This template is provided as-is with no warranties.