module Hamming (distance) where

distance :: String -> String -> Maybe Int
-- case diff length - impossible
-- case same length - starter value 0
distance xs ys  | (length xs) /= (length ys) = Nothing | otherwise = dist 0 xs ys                
  where
    dist mistakesequence [] [] = Just mistakesequence
    dist mistakesequence (x:xs) (y:ys) = 
-- compare
      if x /= y
        then dist (mistakesequence+1) xs ys
      else dist mistakesequence xs ys
