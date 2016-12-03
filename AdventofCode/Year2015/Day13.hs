module AdventofCode.Year2015.Day13 (day13a, day13b) where

import Data.List (nub, permutations)
import qualified Data.HashMap.Strict as H

day13a :: String -> Int
day13a = minimum . day13

day13 :: String -> [Int]
day13 input = map undefined possibleSettings
  where
    routeSum locs    = sum $ map (dist H.!) (zip locs (tail locs))
    possibleSettings = permutations $ nub $ map fst (H.keys dist)
    dist             = H.fromList $ concatMap (parse . words . init) (lines input)

parse :: [String] -> [((String, String), Int)]
parse [x, "would", "gain", n, "happiness", "units", "by", "sitting", "next", "to", y] = undefined
parse [x, "would", "lose", n, "happiness", "units", "by", "sitting", "next", "to", y] = undefined
parse _                    = error "no parse"

day13b :: String -> Int
day13b = maximum . day13
