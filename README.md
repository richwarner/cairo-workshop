# cairoWorkshop

Install the dependencies
```
python3 -m venv env
source env/bin/activate
pip install cairo-nile
```

Setup the project

```js
nile init
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

