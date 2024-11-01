#  EC2 Key Pair Generator

This CloudFormation template creates an EC2 key pair and stores the private key in AWS Systems Manager Parameter Store.

## Overview

The template performs the following actions:
- Creates a new EC2 key pair with a specified name
- Stores the private key in Parameter Store at `/ec2/keypair/key-*`

## Parameters

| Parameter | Description | Default | Allowed Values |
|-----------|-------------|---------|----------------|
| pKeyPairName | Name of the EC2 key pair to create | `<CLIENT NAME>-<ENVIRONMENT>-<YYYY-MM-DD>` | Any string |
| pEnvironmentTag | Environment tag for resources | `sandbox` | production, staging, sandbox, test, development, qa, dr |

## Usage

1. Upload the template to CloudFormation
2. Specify values for the parameters:
   - `pKeyPairName`: Desired name for the key pair
   - `pEnvironmentTag`: Environment for tagging  
3. Create the stack
4. The private key will be stored in Parameter Store

## Outputs

- `TemplateVersion`: Version of the template (ec2-keypair-v1.0)

## Security

The private key is stored securely in Parameter Store. Ensure proper IAM permissions are in place to restrict access to the parameter.

## Maintenance

To update the key pair:
1. Delete the existing CloudFormation stack
2. Re-create the stack with a new key pair name

## License

[Include license information here]