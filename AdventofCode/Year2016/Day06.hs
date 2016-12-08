module AdventofCode.Year2016.Day06 (day06a, day06b) where

import Data.Function (on)
import Data.List (group, sort, minimumBy)
import qualified Data.IntMap.Strict as IM

day06a :: String -> String
day06a = findPop (flip compare `on` length)

findPop :: (String -> String -> Ordering) -> String -> String
findPop cmp = map pop . IM.toAscList . IM.fromListWith (++) .
              concatMap (zip [0..] . map (: [])) . lines
  where
    pop (_, cs) = head $ minimumBy cmp (group $ sort cs)

day06b :: String -> String
day06b = findPop (compare `on` length)
