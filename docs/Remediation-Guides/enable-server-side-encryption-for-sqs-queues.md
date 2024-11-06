---
layout: page
title: 'Enable Server-Side Encryption for SQS queues'
permalink: '/remediation-guides/enable-server-side-encryption-for-sqs-queues/'
resource: true
categories: [Remediation Guides]
parent: 'Remediation Guides'
---

#  Enable Server-Side Encryption for SQS queues

Server-side encryption (SSE) for Amazon SQS queues provides an additional layer of security for your messages by encrypting them at rest. When SSE is enabled, SQS encrypts message contents using AWS KMS keys before saving them to disk and decrypts them when they are retrieved.

## Benefits
- Protects sensitive data in messages with encryption at rest
- Uses AWS KMS for key management and encryption
- Transparent encryption/decryption - no changes needed to application code
- Helps meet compliance requirements for data protection
- Audit capability through AWS CloudTrail logs

## Prerequisites
- AWS account with permissions to modify SQS queues
- Access to AWS Management Console or AWS CLI
- Permissions to use AWS KMS keys

## Implementation Steps

### Using AWS Management Console

1. Sign in to the AWS Management Console
2. Navigate to the Amazon SQS service
3. Select the queue you want to enable encryption for
4. Click on "Edit"
5. Scroll to the "Encryption" section
6. Check "Server-side encryption"
7. Choose encryption settings:
   - Use AWS managed key (aws/sqs) - Recommended for most cases
   - Use custom KMS key - Select an existing customer managed key
8. Click "Save" to apply the changes

### Using AWS CLI

1. To enable SSE using the AWS managed key:
```bash
aws sqs set-queue-attributes \
    --queue-url https://sqs.[region].amazonaws.com/[account-id]/[queue-name] \
    --attributes KmsMasterKeyId=alias/aws/sqs
```

2. To enable SSE using a custom KMS key:
```bash
aws sqs set-queue-attributes \
    --queue-url https://sqs.[region].amazonaws.com/[account-id]/[queue-name] \
    --attributes KmsMasterKeyId=[kms-key-id]
```

## Verification

1. Check queue attributes in the console or using AWS CLI:
```bash
aws sqs get-queue-attributes \
    --queue-url https://sqs.[region].amazonaws.com/[account-id]/[queue-name] \
    --attribute-names KmsMasterKeyId
```

2. Send a test message and verify it's encrypted by checking CloudTrail logs for KMS encryption operations

## Best Practices

- Regularly rotate KMS keys if using customer managed keys
- Monitor KMS API usage through CloudWatch metrics
- Review and audit encryption settings periodically
- Use IAM policies to control access to KMS keys
- Document which queues require encryption for compliance purposes

## Troubleshooting

If you encounter issues:
1. Verify IAM permissions include necessary SQS and KMS actions
2. Ensure KMS key policy allows the service to use the key
3. Check CloudWatch logs for any encryption/decryption errors
4. Verify the KMS key is in the same region as the SQS queue
