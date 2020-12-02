module Hamming (distance) where

import Data.List

distance :: String -> String -> Maybe Int
distance xs ys = case length xs /= length ys of
                      True -> Nothing
                      _    -> Just (countElems 0 (filter (\x -> fst x /= snd x) (zip xs ys)))
                 where
                      countElems n [] = n
                      countElems n (x:xs) = countElems (n+1) xs

