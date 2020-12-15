module Main where

import Hamming

main :: IO ()
main = putStrLn (show (distance "AXZOPP" "AXZOGG")) --Just 2