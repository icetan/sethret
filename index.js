#!/usr/bin/env node

const fs = require('fs')
const path = require('path')
const keyth = require('keythereum')

// First argument is key file path
const keyFile = process.argv[2]
// Second is an optional passphrase which defaults to empty string
const passphrase = process.argv[3] == null ? "" : process.argv[3]

if (!keyFile) {
  console.warn(`Usage: ${path.basename(process.argv[1])} <PATH_TO_KEYFILE> [<PASSPHRASE>]`)
  process.exit(1)
}

if (!fs.existsSync(keyFile)) {
  throw `Key file doesn't exist at: ${keyFile}`
}

fs.readFile(keyFile, 'utf8', (err, data) => {
  if (err) throw err
  const keyObj = JSON.parse(data);
  const privateKey = keyth.recover(passphrase, keyObj)
  console.debug(privateKey.toString('hex'))
})
