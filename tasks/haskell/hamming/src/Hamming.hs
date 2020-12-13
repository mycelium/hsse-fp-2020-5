module Hamming (distance) where

-- | zipWith is very convenient to do list comparison. So turning String into list.
-- | else if length xs == 0 && length ys == 0 then Just 0
distance :: String -> String -> Maybe Int

distance xs ys =  
    if length xs /= length ys then Nothing
    else if length xs == 0 && length ys == 0 then Just 0
    else countDistance xs ys 0

-- | no pre-increment. this isn't functional
-- | haskell can't do things like if x == '' which seems ridiculous but might have its reasons 
-- | ...so [] [] dist added
countDistance:: String -> String -> Int -> Maybe Int

countDistance [] [] dist = Just dist
countDistance (x:xs) (y:ys) dist = 
    if  (x /= y) then countDistance xs ys (dist + 1)
    else countDistance xs ys dist

