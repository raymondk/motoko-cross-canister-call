Testing out icp-cli + cross canister calls + canister environment variables

Requires:
* mops >= 2.10 - to handle concurrent canister builds
* moc >= 1.5 - to handle --actor-env-alias

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

