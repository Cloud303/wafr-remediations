#  EC2 Key Pair CloudFormation Template

This CloudFormation template creates an EC2 Key Pair and stores the private key in AWS Systems Manager Parameter Store.

## Description

The template performs the following actions:

1. Creates a new EC2 Key Pair
2. Stores the private key in Parameter Store at `/ec2/keypair/key-*`

## Parameters

| Parameter | Description | Type | Default | Allowed Values |
|-----------|-------------|------|---------|----------------|
| pKeyPairName | The EC2 Key Pair name | String | `<CLIENT NAME>-<ENVIRONMENT>-<YYYY-MM-DD>` | - |
| pEnvironmentTag | Environment type for default resource tagging | String | sandbox | production, staging, sandbox, test, development, qa, dr |

## Resources

- **EC2 Key Pair**: Creates a new EC2 Key Pair with the specified name

## Outputs

- **TemplateVersion**: Displays the version of the template (ec2-keypair-v1.0)

## Usage

1. Upload the template to CloudFormation
2. Specify the required parameters:
   - Key Pair Name
   - Environment Tag (optional)
3. Create the stack
4. Once the stack is created, the private key will be available in Parameter Store

## Security Considerations

- Ensure that access to the Parameter Store is restricted to authorized personnel only
- Rotate the key pair regularly for enhanced security
- Use AWS KMS for additional encryption of the private key in Parameter Store

## Maintenance

- Periodically review and update the template as needed
- Keep track of the key pairs created and delete unused ones

## License

This template is provided as-is under the MIT license.