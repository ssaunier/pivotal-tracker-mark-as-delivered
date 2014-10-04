if [ ! -n "$WERCKER_PIVOTAL_TRACKER_MARK_AS_DELIVERED_PROJECT_ID" ]; then
  error 'Please specify a pivotal tracker project-id param'
  exit 1
fi

if [ ! -n "$WERCKER_PIVOTAL_TRACKER_MARK_AS_DELIVERED_TOKEN" ]; then
  error 'Please specify your Pivotal Tracker API token (through an environment variable !)'
  exit 1
fi

git clone https://$WERCKER_PIVOTAL_TRACKER_MARK_AS_DELIVERED_GITHUB_OAUTH_TOKEN:x-oauth-basic@github.com/$WERCKER_GIT_OWNER/$WERCKER_GIT_REPOSITORY.git /pipeline/repo
pushd /pipeline/repo
git checkout -fq $WERCKER_GIT_COMMIT
git submodule update --init --recursive
gem install tracker-git -v 0.0.5 --no-ri --no-rdoc
echo "Tracker project: $WERCKER_PIVOTAL_TRACKER_MARK_AS_DELIVERED_PROJECT_ID. Marking finished story with commits as delivered"
tracker $WERCKER_PIVOTAL_TRACKER_MARK_AS_DELIVERED_PROJECT_ID $WERCKER_PIVOTAL_TRACKER_MARK_AS_DELIVERED_TOKEN
popd