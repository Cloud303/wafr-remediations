---
layout: page
title: 'Enable Server-Side Encryption for EFS'
permalink: '/remediation-guides/enable-server-side-encryption-for-efs/'
resource: true
categories: [Remediation Guides]
parent: 'Remediation Guides'
---

#  Enable Server-Side Encryption for EFS

## Benefits
- Protects sensitive data at rest through encryption
- Helps meet compliance requirements for data protection
- Provides transparent encryption/decryption without application changes
- Uses industry standard AES-256 encryption algorithm
- No additional cost for using EFS encryption

## Overview
Amazon EFS server-side encryption provides automatic encryption of data at rest. When enabled, all data and metadata is encrypted using AWS KMS keys. The encryption and decryption is handled transparently by EFS, so no changes are required to applications accessing the file system.

## Prerequisites
- An existing EFS file system
- Appropriate IAM permissions to modify EFS settings
- AWS KMS key access if using a customer managed key

## Implementation Steps

### 1. Enable Encryption on New File System
When creating a new EFS file system:

1. Open the Amazon EFS console
2. Click "Create File System"
3. In the configuration settings:
   - Check "Enable encryption of data at rest"
   - Select either AWS managed key or customer managed key
4. Complete file system creation

### 2. Enable Encryption on Existing File System
For existing file systems:

1. Open the Amazon EFS console
2. Select the file system to encrypt
3. Click "Actions" dropdown
4. Select "Manage file system settings"
5. Under "Encryption":
   - Enable "Encryption at rest"
   - Choose encryption key type
6. Click "Save" to apply changes

### 3. Verify Encryption Status
To confirm encryption is enabled:

1. Open the EFS console
2. Select the file system
3. Check the "Encrypted" property in details pane
4. Verify it shows "Enabled"

## Best Practices
- Use AWS KMS customer managed keys for more control over key rotation and access
- Enable encryption before storing sensitive data
- Regularly audit encryption settings through AWS Config rules
- Document key management procedures

## Limitations
- Cannot disable encryption once enabled
- Encryption settings cannot be modified after creation
- Slight performance impact due to encryption overhead

## Related Documentation
- [Amazon EFS Encryption Documentation](https://docs.aws.amazon.com/efs/latest/ug/encryption.html)
- [AWS KMS Documentation](https://docs.aws.amazon.com/kms/latest/developerguide/overview.html)
