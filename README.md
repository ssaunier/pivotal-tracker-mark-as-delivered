This is a [wercker](https://wercker.com) step to mark
finished Pivotal Tracker stories as delivered (if the `git log`
reveals commit messages containing those story ids).

This step uses the [tracker-git](https://github.com/robb1e/tracker-git) gem.

## Example

It is important that you specify set `keep-repository` to `true` so that
Wercker keeps the original repo to be pushed to Heroku, as we need the
full `git log` to check for story ids in commit messages.

```
deploy:
    steps:
        - heroku-deploy:
            keep-repository: true
            key-name: HEROKU_KEY

        - ssaunier/pivotal-tracker-mark-as-delivered:
            project_id: 1234567
            token: $TRACKER_API_TOKEN
```

[![wercker status](https://app.wercker.com/status/3cc6767311aba006ede3e1ac37434a1b/m "wercker status")](https://app.wercker.com/project/bykey/3cc6767311aba006ede3e1ac37434a1b)