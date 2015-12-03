module Main where

import Data.List.Split (splitOn)

import Util (trim)

main :: IO ()
main = do
    input <- trim <$> readFile "day02-input.txt"
    print $ foldr (f . parse) 0 (lines input)
  where
    f (l, w, h) acc = acc + surface + minimum sides
      where
        surface = sum $ map (2 *) sides
        sides   = [l*w, w*h, h*l]

parse :: String -> (Int, Int, Int)
parse s = (read l, read w, read h)
  where
    [l, w, h] = splitOn "x" s
    _         = error "no parse"
