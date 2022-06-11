%builtins output
from starkware.cairo.common.serialize import serialize_word

# Create a function to add one to a value
# It should take one parameter called y

func main{output_ptr : felt*}():

    let (res) = addOne(y=13)

    # Verify the computation.
    assert res = (13 + 1)
    serialize_word(res)
        
    return ()
end
