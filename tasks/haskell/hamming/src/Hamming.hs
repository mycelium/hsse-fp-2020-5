module Hamming (distance) where

import Data.Maybe

distance :: String -> String -> Maybe Int
distance xs ys =
    if ((length xs) == (length ys))
        then
            Just (sum (map fromEnum (map (uncurry (/=)) (zip xs ys))))
        else
            Nothing
