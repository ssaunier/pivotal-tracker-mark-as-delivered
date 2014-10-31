if [ ! -n "$WERCKER_PIVOTAL_TRACKER_MARK_AS_DELIVERED_PROJECT_ID" ]; then
  echo 'Please specify a pivotal tracker project-id param'
  exit 0
fi

if [ ! -n "$WERCKER_PIVOTAL_TRACKER_MARK_AS_DELIVERED_TOKEN" ]; then
  echo 'Please specify your Pivotal Tracker API token (through an environment variable !)'
  exit 0
fi

pushd $WERCKER_SOURCE_DIR
git checkout -fq $WERCKER_GIT_COMMIT
git submodule update --init --recursive
gem install tracker-git -v 0.0.5 --no-ri --no-rdoc
echo "Tracker project: $WERCKER_PIVOTAL_TRACKER_MARK_AS_DELIVERED_PROJECT_ID. Marking finished story with commits as delivered"
tracker $WERCKER_PIVOTAL_TRACKER_MARK_AS_DELIVERED_PROJECT_ID $WERCKER_PIVOTAL_TRACKER_MARK_AS_DELIVERED_TOKEN
popd