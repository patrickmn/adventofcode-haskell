module AdventofCode.Year2016.Day07 (day07a, day07b) where

import Data.List (break)

data Sequence = Supernet String
              | Hypernet String

day07a :: String -> Int
day07a = length . filter isTls . parse

isTls :: [Sequence] -> Bool
isTls seqs = any hasAbba supers && not (any hasAbba hypers)
  where
    (supers, hypers) = partitionSequences seqs

hasAbba :: String -> Bool
hasAbba xs@(a:b:c:d:_) = (a == d && b == c && a /= b) || hasAbba (drop 1 xs)
hasAbba _              = False

partitionSequences :: [Sequence] -> ([String], [String])
partitionSequences = foldr go ([], [])
  where
    go (Supernet s) (ns, ss) = (s:ns, ss)
    go (Hypernet s) (ns, ss) = (ns, s:ss)

parse :: String -> [[Sequence]]
parse = map go . lines
  where
    go []       = []
    go ('[':xs) = let (beg, end) = break (== ']') xs
                   in Hypernet beg : go (drop 1 end)
    go s        = let (beg, end) = break (== '[') s
                   in Supernet beg : go end

day07b :: String -> Int
day07b = length . filter isSsl . parse

isSsl :: [Sequence] -> Bool
isSsl seqs = any (hasBab hypers) $ concatMap abas supers
  where
    (supers, hypers) = partitionSequences seqs

abas :: String -> [(Char, Char, Char)]
abas xs@(a:b:c:_) = if a == c && a /= b
    then (a, b, c) : abas (drop 1 xs)
    else abas (drop 1 xs)
abas _            = []

hasBab :: [String] -> (Char, Char, Char) -> Bool
hasBab []     _   = False
hasBab (x:xs) aba = go x aba || hasBab xs aba
  where
    go xs'@(a':b':c':_) (a, b, c) = (a' == b && b' == a && c' == b) ||
        go (drop 1 xs') (a, b, c)
    go _             _            = False
