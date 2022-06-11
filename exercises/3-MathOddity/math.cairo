%builtins output
from starkware.cairo.common.serialize import serialize_word

# Try doing some simple arithmetic
# such as 
# adding 13 +  14
# multiplying 3 * 6
# dividing 6 by 2
# dividing 7 by 2


func main{output_ptr : felt*}():
    serialize_word(1 + 1)
    return ()
end