from starkware.cairo.common.uint256 import Uint256
from starkware.cairo.common.uint256 import uint256_add

# Modify both functions so that they
# incremented value by one and return it
func addOne(y : felt) -> (bit : felt):   
   return (y + 1) 
end

func addOneU256{range_check_ptr}(y : Uint256) -> (bit : Uint256):   
   let (a, b) = uint256_add(y, Uint256(1, 1))
   return (a)
end
