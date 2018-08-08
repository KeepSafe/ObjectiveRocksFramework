# ObjectiveRocksFramework

Binary framework version of ObjectiveRocks for iOS and macOS to save time building code from scratch each run.

## Instructions

**Note**: versions of this pod should *always* match [the version in the main ObjectiveRocks repo](https://github.com/iabudiab/ObjectiveRocks/blob/develop/ObjectiveRocks.podspec).

1. Clone [Keepsafe's fork of the ObjectiveRocks repo](https://github.com/KeepSafe/ObjectiveRocks) and switch to the `frameworks` branch
2. From that repo, run `$ ./build_universal_framework.sh`
3. Upload the resulting zip file to this repo's release page as a new release (or overwrite an existing release if the release # hasn't changed)
4. Bump the version on the `.podspec` file in this repo and `pod trunk push` from this repo's directory
5. Update your app repo's pod with `$ pod update ObjectiveRocksFramework` and open a pull request with those changes
