%builtins output
from starkware.cairo.common.serialize import serialize_word

func double(y : felt) -> (x : felt):
    return (x = y * 2)
end

func main{output_ptr : felt*}():

    let (res) = double(y=17)

    # Verify the computation.
    assert res = (17 * 2)
    serialize_word(res)
        
    return ()
end
