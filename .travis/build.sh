#!/bin/sh
curl -fsLO https://raw.githubusercontent.com/scijava/scijava-scripts/master/travis-build.sh
sh -x travis-build.sh $encrypted_f76761764219_key $encrypted_f76761764219_iv &&
if [ ! -f release.properties ]
then
  echo
  echo '== No release.properties; running integration tests =='
  # Not a release -- also perform integration tests.
  mvn -Dinvoker.debug=true -Prun-its
fi

