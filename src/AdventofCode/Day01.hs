{-# LANGUAGE BangPatterns #-}
module AdventofCode.Day01 (day01a, day01b) where

import Data.List (foldl')

import AdventofCode.Util (trim)

day01a :: String -> Int
day01a = foldl' act 0
  where
    act acc '(' = acc + 1
    act acc ')' = acc - 1

day01b :: String -> Int
day01b = go 1 0
  where
    go :: Int -> Int -> String -> Int
    go !pos !floor ('(':xs) = go (pos+1) (floor+1) xs
    go !pos !floor (')':xs) = if nfloor == -1 then pos else go (pos+1) nfloor xs
      where
        nfloor = floor-1
    go !pos _      _        = pos
