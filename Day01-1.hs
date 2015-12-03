module Main where

import Data.List (foldl')

import Util (trim)

main :: IO ()
main = do
    input <- trim <$> readFile "day01-input.txt"
    print $ foldl' act (0 :: Int) input
  where
    act acc '(' = acc + 1
    act acc ')' = acc - 1
