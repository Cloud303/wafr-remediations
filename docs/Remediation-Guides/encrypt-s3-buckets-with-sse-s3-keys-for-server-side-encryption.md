---
layout: page
title: 'Encrypt S3 buckets with SSE-S3 keys for server-side encryption'
permalink: '/remediation-guides/encrypt-s3-buckets-with-sse-s3-keys-for-server-side-encryption/'
resource: true
categories: [Remediation Guides]
parent: 'Remediation Guides'
---

#  Encrypt S3 buckets with SSE-S3 keys for server-side encryption

## Benefits
- Protects data at rest in S3 buckets using industry-standard AES-256 encryption
- Encryption and decryption is handled automatically by S3, reducing operational overhead
- No additional cost for using SSE-S3 encryption
- Helps meet compliance requirements for data protection and encryption
- Provides an additional layer of security beyond bucket policies and IAM controls

## Overview
Amazon S3 Server-Side Encryption with S3-Managed Keys (SSE-S3) provides built-in encryption for objects stored in S3 buckets. When you use SSE-S3, Amazon S3 handles all the encryption/decryption operations using AES-256 encryption while maintaining performance.

## Implementation Steps

### Option 1: Enable encryption via AWS Console

1. Sign in to the AWS Management Console
2. Navigate to the S3 service
3. Select the bucket you want to encrypt
4. Click on the "Properties" tab
5. Scroll to "Default encryption" section
6. Click "Edit"
7. Select "Server-side encryption with Amazon S3-managed keys (SSE-S3)"
8. Click "Save changes"

### Option 2: Enable encryption via AWS CLI

Run the following AWS CLI command:

```bash
aws s3api put-bucket-encryption \
    --bucket BUCKET_NAME \
    --server-side-encryption-configuration '{
        "Rules": [
            {
                "ApplyServerSideEncryptionByDefault": {
                    "SSEAlgorithm": "AES256"
                }
            }
        ]
    }'
```

### Option 3: Enable encryption via CloudFormation

Add the following configuration to your S3 bucket resource:

```yaml
Resources:
  S3Bucket:
    Type: 'AWS::S3::Bucket'
    Properties:
      BucketEncryption:
        ServerSideEncryptionConfiguration:
          - ServerSideEncryptionByDefault:
              SSEAlgorithm: AES256
```

## Verification Steps

1. Upload a new object to the bucket
2. Check the object properties
3. Verify that the encryption type shows "Amazon S3-managed keys (SSE-S3)"

## Best Practices

- Enable default encryption on all new S3 buckets
- Review and update existing buckets to use encryption
- Consider using bucket policies to enforce encryption on object uploads
- Regularly audit buckets to ensure encryption settings remain properly configured

## Additional Considerations

- Existing objects will not be automatically encrypted when enabling default encryption
- To encrypt existing objects, you need to copy them back to the bucket
- SSE-S3 encryption is transparent to authorized users
- Consider using AWS KMS keys (SSE-KMS) if you need additional control over encryption keys
