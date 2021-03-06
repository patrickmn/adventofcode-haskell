module AdventofCode.Year2015.Day02 (day02a, day02b) where

import Data.List (sort)
import Data.List.Split (splitOn)

day02a :: String -> Int
day02a = foldr (f . parse) 0 . lines
  where
    f (l, w, h) acc = acc + surface + minimum sides
      where
        surface = sum $ map (2 *) sides
        sides   = [l*w, w*h, h*l]

parse :: String -> (Int, Int, Int)
parse s = (read l, read w, read h)
  where
    [l, w, h] = splitOn "x" s

day02b :: String -> Int
day02b = foldr (f . parse) 0 . lines
  where
    f (l, w, h) acc = acc + sm1 + sm1 + sm2 + sm2 + (l * w * h)
      where
        [sm1, sm2, _] = sort [l, w, h]
