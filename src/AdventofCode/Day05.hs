module AdventofCode.Day05 (day05a, day05b) where

import Data.List (group, sort, tails)
import qualified Data.Set as S

day05a :: String -> Int
day05a = length . filter isNice . lines
  where
    isNice s = has3Vowels && hasSame && not hasBad
      where
        has3Vowels = not $ null $ drop 2 $ filter (`S.member` vowels) s
        hasSame    = any (not . null . drop 1) $ group s
        hasBad     = any ((`S.member` bad) . take 2) $ tails s
    vowels   = S.fromAscList "aeiou"
    bad      = S.fromAscList ["ab", "cd", "pq", "xy"]

day05b :: String -> Int
day05b = length . filter isNice . lines
  where
    isNice s = hasPair && hasRepeat
      where
        -- The (/= 2) . length filter is necessary to discard overlaps, e.g.
        -- "aaa", but not "aaaa" (which contains two pairs of "aa".)
        hasPair               = any (not . null . tail) $ group $ sort $
                                concat $ filter ((/= 2) . length) $ group $
                                map (take 2) $ tails s
        hasRepeat             = any repeatCheck $ tails s
        repeatCheck (x:_:y:_) = x == y
        repeatCheck _         = False
