Exercises 5 - 7 use [Nile] (https://github.com/OpenZeppelin/nile)

## Using Nile

Set up the Nile development environment to help with your cairo contract development.
[Documentation](https://github.com/OpenZeppelin/nile)


Install dependencies

```js
python3 -m venv env
source env/bin/activate
pip install cairo-nile
```


Setup the  project

```js
nile init
```

Start a local node

```js
nile node &
```

Compile the contracts
```js
nile compile
```
this compiles all contracts under the contracts directory

Deploy the contract 

```js
nile deploy contract --alias my_contract
``` 

(Edit the .env file to provide a different private key, do not use this key elsewhere)

```js
nile setup PKEY1
```

Now change the  contract
add a variable similar to balance called supply and a function get_supply to return the supply

Re compile and redeploy the contract

```js
nile compile 
nile deploy contract --alias my_contract2
```

Call the get_balance and get_supply functions

```js 
nile call my_contract2 get_balance
nile call my_contract2 get_supply
```

Try a send transaction using the syntax

```js
nile send <private_key_alias> <contract_identifier> <method> [PARAM_1, PARAM2...]
```


### Deploy to the testnet
Use the --network parameter to deploy to the alpha-goerli test network.

Try adding a constructor to set the initial supply
See https://www.cairo-lang.org/docs/hello_starknet/constructors.html



