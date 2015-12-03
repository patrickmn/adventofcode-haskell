module Main where

import Data.List.Split (splitOn)

import Util (trim)

main :: IO ()
main = do
    input <- trim <$> readFile "day02-input.txt"
    print $ foldr (f . parse) 0 (lines input)
  where
    f (l, w, h) acc = acc + surface + smallest
      where
        surface   = (2 * side1) + (2 * side2) + (2 * side3)
        side1     = l * w
        side2     = w * h
        side3     = h * l
        smallest  = minimum [side1, side2, side3]

parse :: String -> (Int, Int, Int)
parse s = (read l, read w, read h)
  where
    [l, w, h] = splitOn "x" s
    _         = error "no parse"
