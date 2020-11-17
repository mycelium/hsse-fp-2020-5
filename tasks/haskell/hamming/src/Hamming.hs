module Hamming (distance) where

distance :: String -> String -> Maybe Int
distance xs ys = accumulator 0 xs ys
  where accumulator sum (x:xs) (y:ys) = if x == y
                                        then accumulator sum xs ys
                                        else accumulator (sum + 1) xs ys
        accumulator sum [] [] = Just sum
        accumulator _ [] _ = Nothing
        accumulator _ _ [] = Nothing
