module AdventofCode.Year2015.Day11 (day11a, day11b) where

import Data.List (tails, group)
import qualified Data.Set as S

import AdventofCode.Util

day11a :: String -> String
day11a = head . nextPasswords

nextPasswords :: String -> [String]
nextPasswords = map reverse . filter isValid . iterate increment . reverse
  where
    isValid s               = hasStraight && not hasIol && hasPair
      where
        hasStraight = any straightCheck $ tails s
        hasIol      = any (`S.member` iol) s
        hasPair     = twoOrMore $ filter twoOrMore (group s)
    -- We are checking a reversed string
    straightCheck (x:y:z:_) = x == succ y && y == succ z
    straightCheck _         = False
    iol                     = S.fromAscList "iol"

increment :: String -> String
increment ('z':x:xs) = 'a' : increment (x:xs)
increment "z"        = "aa"
increment (x:xs)     = succ x : xs
increment []         = []

day11b :: String -> String
day11b = (!! 1) . nextPasswords
