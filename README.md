This is a [wercker](https://wercker.com) step to mark
finished Pivotal Tracker stories as delivered (if the `git log`
reveals commit messages containing those story ids).

## Example

If your repo is private, you need to generate a github oauth id
to put in your environment.

```
deploy:
    steps:
        - ssaunier/pivotal-tracker-mark-as-delivered:
            project_id: 1234567
            github_oauth_token: $GITHUB_OAUTH_TOKEN
```

[![wercker status](https://app.wercker.com/status/3cc6767311aba006ede3e1ac37434a1b/m "wercker status")](https://app.wercker.com/project/bykey/3cc6767311aba006ede3e1ac37434a1b)