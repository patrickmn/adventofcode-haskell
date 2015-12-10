module AdventofCode.Day10 (day10a, day10b) where

import Data.List (group)

day10a :: String -> Int
day10a = length . loop 40

loop :: Int -> String -> String
loop n = go 0
  where
    go cur input = if cur == n then input else go (succ cur) (encode input)

encode :: String -> String
encode = concatMap f . group
  where
    f g = show (length g) ++ [head g]

day10b :: String -> Int
day10b = length . loop 50
