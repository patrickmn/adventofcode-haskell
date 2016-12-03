module AdventofCode.Year2015.Day10 (day10a, day10b) where

import Data.List (group)

day10a :: String -> Int
day10a = length . (!! 40) . iterate lookAndSay

lookAndSay :: String -> String
lookAndSay = concatMap f . group
  where
    f g = show (length g) ++ [head g]

day10b :: String -> Int
day10b = length . (!! 50) . iterate lookAndSay
