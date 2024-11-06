---
layout: page
title: 'Delete unused EBS volumes and snapshots'
permalink: '/remediation-guides/delete-unused-ebs-volumes-and-snapshots/'
resource: true
categories: [Remediation Guides]
parent: 'Remediation Guides'
---

#  Delete unused EBS volumes and snapshots

## Benefits
- Reduce unnecessary AWS storage costs by removing unused EBS volumes and snapshots
- Improve security by eliminating potential data exposure from orphaned volumes
- Better resource management and cleaner AWS environment
- Simplified backup management by removing obsolete snapshots

## Prerequisites
- AWS Console access with appropriate IAM permissions
- Ability to identify and verify unused EBS resources
- Basic understanding of EC2 and EBS services

## Steps to Delete Unused EBS Volumes

1. Log into the AWS Management Console

2. Navigate to EC2 Service
   - Click "Services" at the top of the console
   - Select "EC2" under Compute section

3. Identify Unused Volumes
   - In the left navigation pane, click on "Volumes" under "Elastic Block Store"
   - Look for volumes with "State" showing as "available"
   - These volumes are not attached to any EC2 instances

4. Verify Volume Usage
   - Review the volume details including:
     - Creation date
     - Size
     - Tags
   - Confirm with application owners that the volume is no longer needed
   - Consider creating a final backup snapshot if needed

5. Delete Unused Volumes
   - Select the unused volume(s)
   - Click "Actions"
   - Select "Delete Volume"
   - Confirm deletion in the popup dialog

## Steps to Delete Unused Snapshots

1. Navigate to Snapshots
   - In the EC2 console's left navigation pane
   - Click on "Snapshots" under "Elastic Block Store"

2. Identify Obsolete Snapshots
   - Review snapshot details including:
     - Creation date
     - Description
     - Volume information
   - Look for snapshots associated with deleted volumes
   - Identify redundant or outdated snapshots

3. Delete Unused Snapshots
   - Select the snapshot(s) to delete
   - Click "Actions"
   - Choose "Delete snapshot"
   - Confirm deletion

## Best Practices

- Create a snapshot before deleting any volume for backup purposes
- Document the volumes and snapshots being deleted
- Implement tagging strategy to better track EBS resource usage
- Consider using AWS Cost Explorer to monitor storage costs
- Set up AWS Config rules to identify unattached volumes automatically

## Automation Options

Consider implementing automation using:
- AWS CLI scripts
- AWS Lambda functions
- AWS Systems Manager automation
- Third-party cloud management tools

## Verification

After deletion:
1. Confirm removed volumes no longer appear in EC2 console
2. Verify deleted snapshots are removed from snapshot listing
3. Monitor AWS billing to confirm cost reduction
4. Ensure no applications are impacted by the deletion

## Additional Considerations

- Some volumes might be temporarily detached for maintenance
- Snapshots might be part of disaster recovery procedures
- Cross-region snapshots may need separate cleanup
- Consider retention policies for compliance requirements
