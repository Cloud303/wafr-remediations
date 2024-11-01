#  EC2 Key Pair CloudFormation Template

This CloudFormation template creates an EC2 Key Pair and stores the private key in AWS Systems Manager Parameter Store.

## Description

The template performs the following actions:
- Creates a new EC2 Key Pair
- Injects the private key value into Parameter Store at `/ec2/keypair/key-*`

## Parameters

| Parameter | Description | Type | Default | Allowed Values |
|-----------|-------------|------|---------|----------------|
| pKeyPairName | The EC2 Key Pair name | String | `<CLIENT NAME>-<ENVIRONMENT>-<YYYY-MM-DD>` | - |
| pEnvironmentTag | Environment type for default resource tagging | String | `sandbox` | `production`, `staging`, `sandbox`, `test`, `development`, `qa`, `dr` |

## Resources

The template creates the following AWS resources:

- **AWS::EC2::KeyPair**: Creates an EC2 Key Pair with the specified name

## Outputs

| Output | Description | Value |
|--------|-------------|-------|
| TemplateVersion | Template Version | `ec2-keypair-v1.0` |

## Usage

1. Upload the template to CloudFormation
2. Create a new stack using the template
3. Provide values for the parameters:
   - `pKeyPairName`: Specify a name for your EC2 Key Pair
   - `pEnvironmentTag`: Choose the appropriate environment tag
4. Create the stack
5. Once the stack creation is complete, the EC2 Key Pair will be created and the private key will be stored in Parameter Store

## Notes

- Ensure you have the necessary permissions to create EC2 Key Pairs and write to Parameter Store
- The private key will be stored securely in Parameter Store, but make sure to manage access to it appropriately
- The template version is `ec2-keypair-v1.0`
