module AdventofCode.Year2018.Day02 (day02a, day02b) where

import Data.List (group, sort)

day02a :: String -> Int
day02a input = numTwo * numThree
  where
    numTwo   = length $ filter (any ((== 2) . length)) grouped
    numThree = length $ filter (any ((== 3) . length)) grouped
    grouped  = map (group . sort) $ lines input

day02b :: String -> String
day02b input = case filter ((== 1) . length . snd) splits of
    []         -> error "day02b: not found"
    ((c, _):_) -> c
  where
    splits = concatMap (\x -> map (splitLetters x) ids) ids
    ids    = lines input

splitLetters :: String -> String -> (String, String)
splitLetters = go ("", "")
  where
    go (c, uc) []     []     = (reverse c, reverse uc)
    go (c, uc) []     (y:ys) = go (c, y:uc) [] ys
    go (c, uc) (x:xs) []     = go (c, x:uc) xs []
    go (c, uc) (x:xs) (y:ys)
        | x == y    = go (x:c, uc) xs ys
        | otherwise = go (c, x:uc) xs ys
