---
layout: page
title: 'Enable DynamoDB backups'
permalink: '/remediation-guides/enable-dynamodb-backups/'
resource: true
categories: [Remediation Guides]
parent: 'Remediation Guides'
---

#  Enable DynamoDB backups

## Benefits
- Protects against accidental data loss or corruption
- Enables point-in-time recovery (PITR) of DynamoDB tables
- Allows restoration of tables to any point within the last 35 days
- No impact on table performance or availability
- Automated backup process requires minimal maintenance

## Implementation Steps

### Enable Point-in-Time Recovery (PITR)

1. Sign in to the AWS Management Console and open the DynamoDB console
2. In the navigation pane, choose **Tables**
3. Select the table you want to enable backups for
4. Choose the **Backups** tab
5. Under **Point-in-time recovery**, choose **Edit**
6. Toggle **Point-in-time recovery** to **Enabled**
7. Choose **Save**

### Enable On-Demand Backups (Optional)

1. From the **Backups** tab of your table
2. Choose **Create backup**
3. Enter a backup name
4. Choose **Create backup**

### Using AWS CLI

To enable PITR via AWS CLI:

```bash
aws dynamodb update-continuous-backups \
    --table-name YourTableName \
    --point-in-time-recovery-specification PointInTimeRecoveryEnabled=true
```

### Using AWS CloudFormation

Add the following to your DynamoDB table resource:

```yaml
PointInTimeRecoverySpecification:
  PointInTimeRecoveryEnabled: true
```

## Verification

1. Open the DynamoDB console
2. Select your table
3. Choose the **Backups** tab
4. Verify that **Point-in-time recovery** shows as **Enabled**
5. Check that the backup status is **Available**

## Best Practices

- Enable PITR for all production tables
- Regularly test the backup restoration process
- Monitor backup costs through AWS Cost Explorer
- Set up AWS CloudWatch alarms to monitor backup failures
- Document backup and restoration procedures in your disaster recovery plan

## Additional Considerations

- PITR backups are retained for 35 days
- On-demand backups are retained until manually deleted
- Backup storage incurs additional costs
- Cross-region backup copies may be needed for disaster recovery
