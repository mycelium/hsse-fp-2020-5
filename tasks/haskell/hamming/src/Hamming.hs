module Hamming (distance) where

distance :: String -> String -> Maybe Int
distance xs ys = if (length xs == length ys)
			     then Just (length(makeListDifferent(zip xs ys)))
			     else Nothing

makeListDifferent :: [(Char, Char)] -> [(Char, Char)]
makeListDifferent [] = []
makeListDifferent ((a,b) : xs)
    | a /= b = (a,b) : (makeListDifferent xs)
    | otherwise = makeListDifferent xs

