module Hamming (distance) where

distance :: String -> String -> Maybe Int
--если строки имеют разную длину, то мы ничего не возращаем, если же все хорошо отсчет расстояния начинаем с 0
distance xs ys  | (length xs) /= (length ys) = Nothing | otherwise = dist 0 xs ys
  where
    dist counter [] [] = Just counter
--берем элемент из каждой строки
    dist counter (x:xs) (y:ys) = 
--проверяем элементы на равенство
      if x /= y
        then dist (counter+1) xs ys
      else dist counter xs ys
