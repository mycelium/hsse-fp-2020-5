module Hamming (distance) where

distance :: String -> String -> Maybe Int
distance xs ys = if (length xs /= length ys) then Nothing else (Just (length (filter (\el -> (fst el) /= (snd el)) (zip xs ys))))
