# Sethret

Decrypt and extract secret from a JSON key file.

## Install

```sh
nix-env -i -f https://github.com/icetan/sethret/archive/master.tar.gz
```

## Usage

```sh
sethret <PATH_TO_KEYFILE> [<PASSPHRASE>]
```

To print the decrypted secret from a JSON formated key file, pass the path to
the JSON file as the first argument to `sethret` with an optional passphrase
as the second argument.

Key files are usually stored in a keystore directory, e.g. `geth`'s default
keystore path is `~/.ethereum/keystore`. Key files are named after this
template: `UTC--<created_at UTC ISO8601>-<address hex>`.

```sh
sethret ~/.ethereum/keystore/UTC--2019-02-12T14-48-33Z--43a1bafa-c9e2-5cd0-565d-5446b41090aa
```

## Sources

- Sethret is just a thin CLI wrapper around [Keythereum](https://github.com/ethereumjs/keythereum )
- Based on code from this [Stack Exchange answer](https://ethereum.stackexchange.com/questions/3720/how-do-i-get-the-raw-private-key-from-my-mist-keystore-file )
