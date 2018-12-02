module AdventofCode.Year2018.Day02 (day02a, day02b) where

import Data.List (group, sort)

day02a :: String -> Int
day02a input = numTwo * numThree
  where
    numTwo   = sum [1 | x <- grouped, any ((== 2) . length) x]
    numThree = sum [1 | x <- grouped, any ((== 3) . length) x]
    grouped  = map (group . sort) $ lines input

day02b :: String -> String
day02b input = undefined
