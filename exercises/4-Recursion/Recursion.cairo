%builtins output

from starkware.cairo.common.serialize import serialize_word

func calculate_sum(n : felt) -> (sum : felt):
## use recursion to calculate the sum of numbers 0 to n
end

func main{output_ptr : felt*}():
    let (res) = calculate_sum(n=5)

    # Output the result.
    serialize_word(res)
    return ()
end
