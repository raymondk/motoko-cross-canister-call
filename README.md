Testing out icp-cli + cross canister calls + canister environment variables

Depends on:
* moc from https://github.com/caffeinelabs/motoko/actions/runs/22722229033/
* moc is expected to be at `./bin/moc`

Notes:
* $(mops toolchain bin moc) doesn't seem to work with any random build.
Looks like it fails parsing the semver of a dirty build

```
# Start the network
icp network start -d

icp deploy

icp canister call test call_greet '()'

# Stop the network
icp network stop
```
