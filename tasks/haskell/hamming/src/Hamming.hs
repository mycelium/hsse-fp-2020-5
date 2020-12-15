module Hamming (distance) where

distance :: String -> String -> Maybe Int
distance xs ys = let
         helper [] [] n = Just n
         helper xs [] n = Nothing
         helper [] ys n = Nothing
         helper (x:xs) (y:ys) n
         | (x /= y) = helper xs ys (n + 1)
         | otherwise = helper xs ys n
         in helper xs ys 0
