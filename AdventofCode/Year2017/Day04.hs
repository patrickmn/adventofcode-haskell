module AdventofCode.Year2017.Day04 (day04a, day04b) where

import Data.List (group, sort, permutations)
import Data.List.Split (splitOn)

import AdventofCode.Util (twoOrMore)

day04a :: String -> Int
day04a = length . filter (all (not . twoOrMore) . group . sort) . parse

parse :: String -> [[String]]
parse = map (splitOn " ") . lines

-- day04b :: String -> Int
-- day04b = length . filter (null . conflicts) . parse
--   where
--     conflicts row =
--         [ (x, y) | x <- row, y <- row
--         , x /= y, any (== x) (permutations y)
--         ]

day04b :: String -> Int
day04b = length . filter (all (not . twoOrMore) . group . sort . map sort) . parse
