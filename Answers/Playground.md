
Function

%builtins output
from starkware.cairo.common.serialize import serialize_word

func addOne(y : felt) -> (x : felt):
    return (x = y + 1)
end

func main{output_ptr : felt*}():

    let (res) = addOne(y=13)

    # Verify the computation.
    assert res = (13 + 1)
    serialize_word(res)
        
    return ()
end



