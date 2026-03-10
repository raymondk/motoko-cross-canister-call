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

This forces all the did files to be in the same folder. But a canister might have
several dependencies and it might be convenient for a user to refer to did files that
are in other directories, next to their canister code.

```
#  Use something like this:
#
# --actor-env-alias <name> <idl_path> <variable>
# [--var-prefix <prefix>] - optional, default to `PUBLIC_CANISTER_ID:` 

--actor-env-alias 
    greet              # Because `import "canister:greet"`
    idl_path           # point to some random did file
    Greeter            # Generate binding PUBLIC_CANISTER_ID:Greeter

# If the import is always `import "canister:<canister-name>"`
# Them maybe we can drop the third parameter and just do
# --actor-env-alias <canister_name> <idl_path>
# [--var-prefix <prefix>] - optional, default to `PUBLIC_CANISTER_ID:` 
#

--actor-env-alias
    greet              # Because `import "canister:greet"`
    idl_path           # point to some random did file

# but I'm not sure if it's a problem to not be able to override the canister
# name in your icp.yaml

```

In icp.yaml, the recipe for a motoko canister would look like:

```yaml
# canister.yaml
name: test
recipe:
  type: "@dfinity/motoko@vX.X.X"
  configuration:
    main: src/Test.mo
    bindings:
      # We can add many bindings
      - name: greet
        idl: did/greet.did
```
