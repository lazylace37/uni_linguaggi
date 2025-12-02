fact :: Integer -> Integer
fact 0 = 1
fact n = n * fact (n - 1)

bin :: Integer -> Integer -> Integer
bin n k = (fact n) `div` ((fact k) * (fact (n - k)))

-- oppure con il "triangolo di Targaglia"
bin2 n k | n == 0    = 1
         | n == k    = 1
         | otherwise = (bin (n - 1) k) + (bin (n - 1) (k - 1))
