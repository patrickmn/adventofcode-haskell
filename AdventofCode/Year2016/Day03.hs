module AdventofCode.Year2016.Day03 (day03a, day03b) where

import AdventofCode.Util (trimLeft)

day03a :: String -> Int
day03a input = length $ filter isTriangle $ parse input

isTriangle :: (Int, Int, Int) -> Bool
isTriangle (a, b, c) = a + b > c && a + c > b && b + c > a

parse :: String -> [(Int, Int, Int)]
parse = map f . lines
  where
    f s = ( read $ trimLeft $ take 5 s
          , read $ trimLeft $ take 5 $ drop 5 s
          , read $ trimLeft $ take 5 $ drop 10 s
          )

day03b :: String -> Int
day03b = length . filter isTriangle . go . parse
  where
    go []                                                = []
    go ((a1, a2, a3) : (b1, b2, b3) : (c1, c2, c3) : xs) =
        (a1, b1, c1) : (a2, b2, c2) : (a3, b3, c3) : go xs
    go _                                                 =
        error "day03b: Invalid input"
