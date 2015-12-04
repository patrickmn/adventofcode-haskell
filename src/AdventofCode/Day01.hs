{-# LANGUAGE BangPatterns #-}
module AdventofCode.Day01 (day01a, day01b) where

import Data.List (foldl')

day01a :: String -> Int
day01a = foldl' f 0
  where
    f acc '(' = acc + 1
    f acc ')' = acc - 1
    f _   _   = error "no parse"

day01b :: String -> Int
day01b = go 1 0
  where
    go :: Int -> Int -> String -> Int
    go !pos !flr ('(':xs) = go (pos + 1) (flr + 1) xs
    go !pos !flr (')':xs) = if nflr == -1 then pos else go (pos + 1) nflr xs
      where
        nflr = flr - 1
    go !pos _      _        = pos
