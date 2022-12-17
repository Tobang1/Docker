### Create s3 bucket postgres-backup and create lifecycle rule
### create a folder for each environment 
### create a role for service-account and add permission to the specific bucket

```
{
    "Statement": [
        {
            "Action": [
                "s3:ListBucket"
            ],
            "Effect": "Allow",
            "Resource": "arn:aws:s3:::postgres-backup",
            "Sid": "AllowListObjects"
        },
        {
            "Action": [
                "s3:DeleteObject",
                "s3:GetObject",
                "s3:PutObject"
            ],
            "Effect": "Allow",
            "Resource": "arn:aws:s3:::postgres-backup/*",
            "Sid": "AllowObjectsCRUD"
        }
    ],
    "Version": "2012-10-17"
}


```

### add a trust policy to the role trust relationship.

{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "",
            "Effect": "Allow",
            "Principal": {
                "Federated": "arn:aws:iam::<account-id>:oidc-provider/oidc.eks.<region>.amazonaws.com/id/3C7BAF68EC1E4E230673CD1C1B765F54" <change the id>
            },
            "Action": "sts:AssumeRoleWithWebIdentity",
            "Condition": {
                "StringEquals": {
                    "oidc.eks.eu-west-2.amazonaws.com/id/3C7BAF68EC1E4E230673CD1C1B765F54:aud": "sts.amazonaws.com",
                    "oidc.eks.eu-west-2.amazonaws.com/id/3C7BAF68EC1E4E230673CD1C1B765F54:sub": "system:serviceaccount:<namespace>:<service-account-name>"
                }
            }
        }
    ]
}

```