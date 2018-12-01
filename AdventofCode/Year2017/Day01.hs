module AdventofCode.Year2017.Day01 (day01a, day01b) where

day01a :: String -> Int
day01a input = go (input ++ [head input]) 0
  where
    go (x:y:ys) n = go (y:ys) $! if x == y then n + read [x] else n
    go _        n = n

day01b :: String -> Int
day01b input = go (zip [0..] input) 0
  where
    go ((i, x):xs) n = go xs $! if x == y then n + read [x] else n
      where
        y = input !! ((half + i) `mod` len)
    go _           n = n
    len              = length input
    half             = len `div` 2
