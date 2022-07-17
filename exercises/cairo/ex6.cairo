%lang starknet

from starkware.cairo.common.bitwise import bitwise_and, bitwise_xor
from starkware.cairo.common.cairo_builtins import BitwiseBuiltin, HashBuiltin

## Using binary operations return: 
## - 1 when the pattern of bits is alternating, excluding leading zeros
## - 0 otherwise

func pattern{bitwise_ptr: BitwiseBuiltin*, range_check_ptr}(n: felt, idx: felt, exp: felt, broken_chain: felt) -> (true : felt):
    if n == 0:
        return (1)
    end 
    if n == 1:
        return (1)
    end
    let (digit0) = bitwise_and(n, 1) # get the right-most bit
    let (zero_last) = bitwise_and(n, 0x7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE) # zero out the last bit so we're sure to get no remainder in next steps
    tempvar shifted = zero_last / 2 # remove final bit
    let (digit1) = bitwise_and(shifted, 1) # get the next right-most bit    
    let (result) = bitwise_xor(digit0, digit1)
    %{         
        print(ids.n) # 170 10101010
        print(ids.digit0) # 0
        print(ids.zero_last) # 168 10101000
        print(ids.digit1) # 0    
        print(ids.shifted) # 85 1010101    
        print(ids.result) # 0
    %}
    if result == 1:
        return pattern(shifted, 0, 0, 0)
    else: 
        return (0)
    end
end






