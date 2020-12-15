module Hamming (distance) where

distance :: String -> String -> Maybe Int
distance seq1 seq2 = comp seq1 seq2 0

comp :: String -> String -> Int -> Maybe Int
comp [] [] n = Just n
comp seq1 [] n = Nothing 
comp [] seq2 n = Nothing
comp (x:seq1) (y:seq2) n
    | (x /= y) = comp seq1 seq2 (n + 1)
    | otherwise = comp seq1 seq2 n