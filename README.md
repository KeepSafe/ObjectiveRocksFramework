# ObjectiveRocksFramework

Binary framework version of ObjectiveRocks for iOS and macOS to save time building code from scratch each run.

## Instructions

1. Clone [Keepsafe's fork of the ObjectiveRocks repo](https://github.com/KeepSafe/ObjectiveRocks) and switch to the `frameworks` branch
2. From that repo, run `$ ./build_universal_framework.sh`
3. Upload the resulting zip file to this repo's release page as a new release (or overwrite an existing release if the release # hasn't changed)
4. Update your app repo's pod with `$ pod update ObjectiveRocks` and open a pull request with those changes
