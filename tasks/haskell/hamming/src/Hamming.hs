module Hamming (distance) where

distance :: String -> String -> Maybe Int
distance xs ys = if ln xs /= ln ys then Nothing else Just . ln . filter not . zipWith (==) xs $ ys
