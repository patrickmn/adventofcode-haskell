module AdventofCode.Day09 (day09a, day09b) where

import Data.List (nub, permutations)
import qualified Data.HashMap.Strict as H

day09a :: String -> Int
day09a = minimum . day09

day09 :: String -> [Int]
day09 input = routeDists
  where
    routeDists     = map routeSum possibleRoutes
    routeSum locs  = sum $ map (dist H.!) (zip locs (tail locs))
    possibleRoutes = permutations $ nub $ map fst $ H.keys dist
    dist           = H.fromList $ concatMap (parse . words) $ lines input

parse :: [String] -> [((String, String), Int)]
parse [x, "to", y, "=", nstr] = [((x, y), n), ((y, x), n)]
  where
    n = read nstr
parse _                    = error "no parse"

day09b :: String -> Int
day09b = maximum . day09
