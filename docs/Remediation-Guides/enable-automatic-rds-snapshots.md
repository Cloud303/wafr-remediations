---
layout: page
title: 'Enable automatic RDS snapshots'
permalink: '/remediation-guides/enable-automatic-rds-snapshots/'
resource: true
categories: [Remediation Guides]
parent: 'Remediation Guides'
---

#  Enable automatic RDS snapshots

Enabling automatic snapshots for Amazon RDS instances provides critical backup protection for your databases. This feature helps ensure business continuity, enables point-in-time recovery, and protects against data loss.

## Benefits
- Automated daily backups of your RDS databases
- Ability to restore to any point in time within the retention period
- Protection against accidental data deletion or corruption
- No performance impact on production databases during backup
- Automated cleanup of old snapshots based on retention policy

## Prerequisites
- AWS account with appropriate IAM permissions
- Existing RDS instance(s)
- IAM permissions: `rds:ModifyDBInstance`

## Steps to Enable Automatic Snapshots

1. Sign in to the AWS Management Console

2. Navigate to RDS
   ```
   Services > Database > RDS
   ```

3. Select the RDS instance
   - In the RDS dashboard, click on "Databases" in the left navigation
   - Select the database instance you want to modify

4. Modify backup settings
   - Click the "Modify" button
   - Scroll to the "Backup" section
   - Enable "Automatic backups"

5. Configure backup settings
   - Set "Backup retention period" (1-35 days)
   - Choose preferred backup window
   - Select "Copy tags to snapshots" if desired

6. Apply changes
   - Select when to apply changes:
     - "Apply immediately" (may cause brief interruption)
     - "Apply during next maintenance window"
   - Click "Continue"
   - Review changes and click "Modify DB Instance"

## Verification

1. Check backup status
   - Navigate to your RDS instance
   - Select the "Maintenance & backups" tab
   - Verify "Automated backups" is enabled
   - Confirm retention period is set correctly

2. Monitor first backup
   - Wait for the first backup window
   - Check "Snapshots" section for new automated snapshot
   - Verify snapshot status is "Available"

## Best Practices

- Set retention period based on compliance requirements
- Choose backup window during low-traffic periods
- Regularly test backup restoration process
- Monitor backup success through CloudWatch metrics
- Consider cross-region backup copies for disaster recovery

## Additional Considerations

- Automated backups count towards storage costs
- Longer retention periods increase storage costs
- Snapshots are stored in S3 but not directly accessible
- Manual snapshots can complement automated backups
- Consider using AWS Backup for centralized backup management
