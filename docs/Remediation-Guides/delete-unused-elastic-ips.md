---
layout: page
title: 'Delete unused Elastic IPs'
permalink: '/remediation-guides/delete-unused-elastic-ips/'
resource: true
categories: [Remediation Guides]
parent: 'Remediation Guides'
---

#  Delete unused Elastic IPs

## Benefits
- Reduce AWS costs by eliminating charges for unused Elastic IPs
- Improve IP address management and avoid hitting regional Elastic IP limits
- Maintain a cleaner AWS infrastructure by removing unused resources
- Prevent accidental use of unmanaged IP addresses

## Prerequisites
- AWS Management Console access with appropriate IAM permissions
- Permissions to view and delete Elastic IPs

## Steps

1. Log into the AWS Management Console

2. Navigate to the EC2 Dashboard
   - Go to Services > EC2
   - Or use the search bar and type "EC2"

3. Find Elastic IPs
   - In the left navigation pane, under "Network & Security"
   - Click on "Elastic IPs"

4. Identify unused Elastic IPs
   - Look for Elastic IPs where the "Instance" or "Associated instance ID" column is empty
   - These IPs are not currently associated with any EC2 instances

5. Verify the Elastic IPs are safe to delete
   - Check if the IP is referenced in any DNS records
   - Confirm the IP is not used in any application configurations
   - Ensure the IP is not planned for future use

6. Delete unused Elastic IPs
   - Select the Elastic IP you want to delete
   - Click "Actions" dropdown
   - Select "Release Elastic IP address"
   - Confirm the deletion in the popup dialog

7. Repeat for all unused Elastic IPs
   - Follow steps 4-6 for each unused Elastic IP
   - Document any IPs released for future reference

## Best Practices
- Regularly audit Elastic IP usage
- Document any released IPs in case they need to be referenced later
- Consider implementing AWS Cost Explorer alerts for Elastic IP charges
- Use AWS Tags to better track and manage Elastic IP allocations

## Note
Once an Elastic IP is released, it cannot be recovered. Ensure you have verified the IP is truly unused before deletion.
