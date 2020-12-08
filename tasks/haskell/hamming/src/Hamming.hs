module Hamming (distance) where

distance :: String -> String -> Maybe Int
distance xs ys = mistake xs ys 0

mistake :: String -> String -> Int -> Maybe Int
mistake [] [] n = Just n
mistake xs [] n = Nothing
mistake [] ys n = Nothing
mistake (x:xs) (y:ys) n | (x /= y) = mistake xs ys (n + 1) | otherwise = mistake xs ys n
