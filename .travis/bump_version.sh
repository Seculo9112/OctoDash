#!/bin/sh

make_version() {
  git checkout -- .
  git status
  COMMIT=$(git log -1 --pretty=%B)
  VERSION_BUMP="patch"
  if [[ $COMMIT == *"version:major"* ]]; then
    VERSION_BUMP="major"
  fi
    if [[ $COMMIT == *"version:minor"* ]]; then
    VERSION_BUMP="minor"
  fi
  echo "commit message: "$COMMIT
  echo "will execute npm version "$VERSION_BUMP
  npm version $VERSION_BUMP -m "bump version to %s [skip ci]"
  ls $TRAVIS_BUILD_DIR
  ls $TRAVIS_BUILD_DIR/package
  mv $TRAVIS_BUILD_DIR/package/*armv7l.deb $TRAVIS_BUILD_DIR/OctoDash_$(git describe --tags $(git rev-list --tags --max-count=1))_armv7l.deb
  mv $TRAVIS_BUILD_DIR/package/*arm64.deb $TRAVIS_BUILD_DIR/OctoDash_$(git describe --tags $(git rev-list --tags --max-count=1))_arm64.deb
}

upload_files() {
  git push origin HEAD:$TRAVIS_BRANCH
  git push --tags
}

make_version
# upload_files