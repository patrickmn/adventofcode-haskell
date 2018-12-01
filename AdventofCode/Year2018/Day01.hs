module AdventofCode.Year2018.Day01 (day01a, day01b) where

import Data.IntSet (IntSet)
import Data.List (foldl')
import qualified Data.IntSet as IS

day01a :: String -> Int
day01a = foldl' doOp 0 . lines

doOp :: Int -> String -> Int
doOp acc ('+':nstr) = acc + read nstr
doOp acc ('-':nstr) = acc - read nstr
doOp _   _          = error "day01 doOp: invalid instruction"

day01b :: String -> Int
day01b = go (0, IS.singleton 0) . concat . repeat . lines
  where
    go _           []     = error "day01b: not found"
    go (acc, seen) (x:xs) = let nacc = doOp acc x in
        if nacc `IS.member` seen
            then nacc
            else go (nacc, IS.insert nacc seen) xs
