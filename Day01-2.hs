{-# LANGUAGE BangPatterns #-}
module Main where

import Data.List (foldl')

import Util (trim)

main :: IO ()
main = do
    input <- trim <$> readFile "day01-input.txt"
    print $ go 1 0 input
  where
    go :: Int -> Int -> String -> Int
    go !pos !floor ('(':xs) = go (pos+1) (floor+1) xs
    go !pos !floor (')':xs) = if nfloor == -1 then pos else go (pos+1) nfloor xs
      where
        nfloor = floor-1
    go !pos _      _        = pos
