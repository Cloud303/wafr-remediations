---
layout: page
title: 'IAM Password Policy Configuration Guide'
permalink: '/remediation-guides/iam-password-policy/'
resource: true
categories: [Remediation Guides]
parent: 'Remediation Guides'
---

#  IAM Password Policy Configuration Guide

## Benefits
Implementing a strong IAM password policy helps:
- Protect against unauthorized access through password guessing/brute force attacks
- Ensure passwords meet minimum complexity requirements
- Force regular password rotation to limit exposure from compromised credentials
- Meet compliance requirements for password security controls
- Reduce risk of account takeover through weak passwords

## Implementation Steps

### Using AWS Console

1. Sign in to the AWS Management Console
2. Navigate to IAM service
3. In the left navigation pane, click "Account settings"
4. Click "Change password policy" button
5. Configure the following settings:
   - ✓ Enable "Enforce password expiration" and set to 90 days
   - ✓ Enable "Require at least one uppercase letter"
   - ✓ Enable "Require at least one lowercase letter" 
   - ✓ Enable "Require at least one number"
   - ✓ Enable "Require at least one non-alphanumeric character"
   - ✓ Set "Minimum password length" to 14 characters
6. Click "Save changes"

### Using AWS CLI

```bash
aws iam update-account-password-policy \
    --minimum-password-length 14 \
    --require-symbols \
    --require-numbers \
    --require-uppercase-characters \
    --require-lowercase-characters \
    --max-password-age 90
```

### Using AWS CloudFormation

```yaml
Resources:
  PasswordPolicy:
    Type: AWS::IAM::AccountPasswordPolicy
    Properties:
      MaxPasswordAge: 90
      MinimumPasswordLength: 14
      RequireLowercaseCharacters: true
      RequireNumbers: true
      RequireSymbols: true
      RequireUppercaseCharacters: true
```

## Verification

To verify the password policy has been properly configured:

1. In the AWS Console, navigate to IAM > Account settings
2. Confirm all password requirements are enabled with correct values
3. Test creating a new IAM user to ensure password requirements are enforced

## Notes

- Existing IAM user passwords will not be affected until they expire or are changed
- Users will be prompted to change password upon next login after expiration
- Consider implementing AWS SSO/IAM Identity Center for enhanced identity management
