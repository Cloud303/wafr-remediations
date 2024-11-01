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

| Output | Description |
|--------|-------------|
| TemplateVersion | The version of the template (ec2-keypair-v1.0) |

## Usage

1. Upload the template to CloudFormation
2. Create a new stack using the template
3. Provide values for the parameters:
   - Key Pair Name
   - Environment Tag
4. Launch the stack

After the stack creation is complete, you can find the private key in Parameter Store at `/ec2/keypair/key-*`.

## Security Considerations

- The private key is stored in Parameter Store. Ensure that access to this parameter is restricted to authorized personnel only.
- It's recommended to rotate keys regularly for enhanced security.

## Maintenance

Remember to delete the key pair and the corresponding Parameter Store entry when they are no longer needed to maintain good security practices.