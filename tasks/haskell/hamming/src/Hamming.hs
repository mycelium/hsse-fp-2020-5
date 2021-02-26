module Hamming (distance) where

distance :: String -> String -> Maybe Int
distance xs ys = if (length xs == length ys) 
                 then Just (length(createListDifferent(zip xs ys)))
                 else Nothing

createListDifferent :: [(Char, Char)] -> [(Char, Char)]
createListDifferent [] = []
createListDifferent ((a,b) : xs)
    | a /= b = (a,b) : (createListDifferent xs)
    | otherwise = createListDifferent xs