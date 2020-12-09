module Hamming (distance) where

distance :: String -> String -> Maybe Int
distance xs ys =
  if ((length xs) == (length ys))
    then
      Just (sum (map fromEnum (zipWith(/=) xs ys)))
    else
      Nothing
