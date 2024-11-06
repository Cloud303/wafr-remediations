---
layout: page
title: 'Enable DynamoDB deletion protection'
permalink: '/remediation-guides/enable-dynamodb-deletion-protection/'
resource: true
categories: [Remediation Guides]
parent: 'Remediation Guides'
---

#  Enable DynamoDB deletion protection

## Benefits
- Prevents accidental deletion of DynamoDB tables and data loss
- Adds an additional layer of protection for business-critical data
- Helps maintain data integrity and availability
- Reduces operational risks from human error
- Supports compliance requirements for data protection

## Overview
DynamoDB deletion protection is a feature that prevents tables from being accidentally deleted. When enabled, any attempt to delete a protected table will be rejected until deletion protection is explicitly disabled.

## Implementation Steps

### For New Tables
1. When creating a new DynamoDB table through AWS Console:
   - Navigate to DynamoDB service
   - Click "Create table"
   - Fill in table details
   - Under "Additional settings", check "Enable deletion protection"
   - Complete table creation

### For Existing Tables
1. Navigate to the AWS DynamoDB Console
2. Select the table you want to protect
3. Click on "Additional settings" tab
4. Click "Edit" button
5. Check the "Enable deletion protection" option
6. Click "Save changes"

### Using AWS CLI
To enable deletion protection via AWS CLI:

```bash
aws dynamodb update-table \
    --table-name <YOUR_TABLE_NAME> \
    --deletion-protection-enabled
```

### Using AWS CloudFormation
Add the following property to your DynamoDB table resource:

```yaml
Resources:
  MyDynamoDBTable:
    Type: AWS::DynamoDB::Table
    Properties:
      DeletionProtectionEnabled: true
      # ... other table properties
```

## Verification
To verify deletion protection is enabled:

1. Open AWS Console and navigate to DynamoDB
2. Select the table
3. Check "Additional settings" tab
4. Confirm "Deletion protection" is enabled
5. Attempt to delete the table - it should fail with an error message

## Best Practices

- Enable deletion protection for all production tables
- Document any tables where deletion protection is deliberately disabled
- Include deletion protection status in security audits
- Use AWS Organizations SCPs or IAM policies to enforce deletion protection
- Implement change management processes for disabling deletion protection

## Note
To delete a protected table, you must first disable deletion protection:

1. Edit the table settings
2. Uncheck "Enable deletion protection"
3. Save changes
4. Delete the table

This two-step process helps prevent accidental deletions while still allowing intentional removal when necessary.
