Testing out icp-cli + cross canister calls + canister environment variables

Depends on:
* moc from https://github.com/caffeinelabs/motoko/actions/runs/23295693053
* moc is expected to be at `./bin/moc`

Requires:
* mops 2.5

```
# Start the network
icp network start -d

icp deploy

icp canister call test call_greet '()'

# Stop the network
icp network stop
```

## Possible improvements

Next improvements would be to update mops so that the `--actor-env-alias` parameters are
specified in the mops.toml file of the canister

