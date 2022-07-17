## Return summation of every number below and including n
func calculate_sum(n : felt) -> (sum : felt):
    if n == 1: 
        return (1)
    else:    
        let (newSum) = calculate_sum(n-1)
        return (n + newSum)
    end
end

