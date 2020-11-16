module Lib (distance) where

distance :: String -> String -> Maybe Int
distance xs ys = if length xs == length ys then Just (length $ filter (uncurry (/=)) $ zip xs ys) else Nothing
