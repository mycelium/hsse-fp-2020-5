module Hamming (distance) where

distance :: String -> String -> Maybe Int
distance xs ys = if (length xs == length ys) then Just (length(createDifferent(zip xs ys)))
                 else Nothing

createDifferent :: [(Char, Char)] -> [(Char, Char)]
createDifferent [] = []
createDifferent ((a,b) : xs)
    | a /= b = (a,b) : (createDifferent xs)
    | otherwise = createDifferent xs
