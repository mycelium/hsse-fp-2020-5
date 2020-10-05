module Hamming (distance) where

import Data.Maybe

distance :: String -> String -> Maybe Int
distance xs ys =
    if ((length xs) > 0 || (length ys) > 0)
        then
            if ((length xs) > 0 && (length ys) > 0)
                then
                   if (isJust (distance (drop 1 xs) (drop 1 ys)))
                       then
                           Just ((fromJust (distance (drop 1 xs) (drop 1 ys))) + (if (head xs) /= (head ys) then 1 else 0))
                       else
                           Nothing
                else
                    Nothing
        else
            Just 0

