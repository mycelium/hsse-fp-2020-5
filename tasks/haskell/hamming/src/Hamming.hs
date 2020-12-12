module Hamming (distance) where

-- | zipWith is very convenient to do list comparison. So turning String into list.
distance :: String -> String -> Maybe Int
distance xs ys =  
    if length xs /= length ys then Nothing
    else countDistance xs ys 0

-- | no pre-increment. this isn't functional
countDistance:: String -> String -> Int -> Maybe Int
countDistance (x:xs) (y:ys) dist = 
    if (x /= y) then countDistance xs ys (dist + 1)
    else countDistance xs ys dist
