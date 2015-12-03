module Main where

import Data.List (sort)
import Data.List.Split (splitOn)

import Util (trim)

main :: IO ()
main = do
    input <- trim <$> readFile "day02-input.txt"
    print $ foldr (f . parse) 0 (lines input)
  where
    f (l, w, h) acc = acc + sm1 + sm1 + sm2 + sm2 + (l * w * h)
      where
        [sm1, sm2, _] = sort [l, w, h]

parse :: String -> (Int, Int, Int)
parse s = (read l, read w, read h)
  where
    [l, w, h] = splitOn "x" s
    _         = error "no parse"
