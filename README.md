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

## How this version works

Looks like moc will look for
```
${ACTOR_IDL}/${ENVVARNAME}.did
```
The env var name is set by icp-cli as:
```
  PUBLIC_CANISTER_ID:<canister_name>
```

In this case, the canister name is `Greeter` so the file is at
  `did/PUBLIC_CANISTER_ID:Greeter.did`

## Possible improvements

Next improvements would be to update mops so that the `--actor-env-alias` parameters are
specified in the mops.toml file of the canister

