{-# LANGUAGE BangPatterns #-}
module AdventofCode.Day01 (day01a, day01b) where

import Data.List (foldl')

import AdventofCode.Util (trim)

day01a :: IO Int
day01a = do
    input <- trim <$> readFile "input/day01"
    return $ foldl' act (0 :: Int) input
  where
    act acc '(' = acc + 1
    act acc ')' = acc - 1

day01b :: IO Int
day01b = do
    input <- trim <$> readFile "input/day01"
    return $ go 1 0 input
  where
    go :: Int -> Int -> String -> Int
    go !pos !floor ('(':xs) = go (pos+1) (floor+1) xs
    go !pos !floor (')':xs) = if nfloor == -1 then pos else go (pos+1) nfloor xs
      where
        nfloor = floor-1
    go !pos _      _        = pos
