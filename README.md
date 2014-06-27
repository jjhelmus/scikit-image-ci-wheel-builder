Using Travis CI to build OS-X wheels for scikit-image
=====================================================

This repository uses [Travis CI](https://travis-ci.org/) to create Python [wheel](http://wheel.readthedocs.org/en/latest/) packages for the 0.10.0 release of [scikit-image](http://scikit-image.org/).

Instructions:

1. Fork the repository.
2. Replace the secure api key in the **deploy** section of the [.travis.yml](https://github.com/jjhelmus/scikit-image-ci-wheel-builder/blob/master/.travis.yml#L28) file with one appropiate for your GitHub credentials.  See the  [Travis Documentation](http://docs.travis-ci.com/user/deployment/releases/) for details.
3. Create a new commit and push to GitHub.  Empty commits are fine.  Check that Travis CI successfully built the wheel packages.  [Example](https://travis-ci.org/jjhelmus/scikit-image-ci-wheel-builder/builds/28591680)
4. Using the GitHub Web interface create a release, Travis CI will rerun the build and deloy the .whl files to the release when complete.  [Example](https://travis-ci.org/jjhelmus/scikit-image-ci-wheel-builder/builds/28592876)
5. Wheel packages can no be downloaded from the GitHub release page.  [Example](https://github.com/jjhelmus/scikit-image-ci-wheel-builder/releases/tag/wheel_0.10.0).


See the [Spinning wheels](https://github.com/MacPython/wiki/wiki/Spinning-wheels) page for additional details on using binary wheels on OS X.

