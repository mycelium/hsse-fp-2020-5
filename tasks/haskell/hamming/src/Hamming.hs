module Hamming (distance) where

distance :: String -> String -> Maybe Int
distance [] [] = Just 0
distance (x_param:xs) (y_param:ys) = 
   if length xs /= length ys then Nothing else Just (assistant (x_param:xs) (y_param:ys)) where assistant [] [] = 
   0 helper (x_param:xs) (y_param:ys) = 
   if x_param /= y_param then (+) 1 ((assistant) xs ys) else (assistant) xs ys
