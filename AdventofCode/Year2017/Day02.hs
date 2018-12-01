module AdventofCode.Year2017.Day02 (day02a, day02b) where

import Data.List (sort)
import Data.List.Split (splitOn)

day02a :: String -> Int
day02a input = sum $ map diffRow $ parse input
  where
    diffRow row = let sorted = sort row in last sorted - head sorted

parse :: String -> [[Int]]
parse = map (map read . splitOn "\t") . lines

day02b :: String -> Int
day02b input = sum $ map diffRow $ parse input
  where
    diffRow row = head
        [ fromIntegral rnd | x <- row, y <- row
        , let d   = fromIntegral x / fromIntegral y :: Double
        , let rnd = round d
        , x /= y, y /= 0
        , d == fromInteger rnd
        ]
