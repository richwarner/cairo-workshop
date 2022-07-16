# Installing protostar

# Unix

Open shell and run:

`curl -L https://raw.githubusercontent.com/software-mansion/protostar/master/install.sh | bash`

Ensure your profile file has protostar path included.

For me installation script failed at it and it had to be added manually.

Open bash configuration file by running:

`nano ~/.bash_profile`

Append this to the file and save:

`export PATH="~/.protostar/dist/protostar"`

Save

Load the changes:

`source ~/.bash_profile`

# Running compliance tests

From within the main repo directory run:

`protostar test test/<TEST_TO_RUN>.cairo`

So running example 1 would be:

`protostar test test/test_ex1.cairo`

**All tests should pass without any modification of the test files.**

**Hence you must only modify the `.cairo` files in the `/exercises/` directory.**

# Conversion helper

File `conversion.py` in the root directory can be used for conversion between felt and strings and numbers and uint256.

To use that helper iteratively interactively run:

`python3 -i conversion.py`
