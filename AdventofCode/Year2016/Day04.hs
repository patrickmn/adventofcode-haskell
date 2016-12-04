{-# LANGUAGE RecordWildCards #-}
module AdventofCode.Year2016.Day04 (day04a, day04b) where

import Data.Char (chr, ord, isUpper, isLower)
import Data.List (group, sort, sortBy, find)
import Data.Maybe (fromJust)

data Room = Room
    { name     :: !String
    , sectorId :: !Int
    , checksum :: !String
    } deriving Show

day04a :: String -> Int
day04a = sum . map sectorId . filter validRoom . parse

validRoom :: Room -> Bool
validRoom Room{..} = go checksum occurrences
  where
    go []     _          = True
    go (c:cs) ((x:_):xs) = (c == x) && go cs xs
    go _      _          = error "Invalid input/checksum"
    occurrences          = sortBy cmp $ drop 1 $ group $ sort name  -- Drop '-' grouping
    cmp v ov             = length ov `compare` length v  -- Longest first

parse :: String -> [Room]
parse = map f . lines
  where
    f s = Room nstr sid csum
      where
        nstr = reverse $ drop 1 $ dropWhile (/= '-') rev
        sid  = read $ reverse $ takeWhile (/= '-') $ drop 1 $ dropWhile (/= '[') rev
        csum = reverse $ takeWhile (/= '[') rev
        rev  = drop 1 $ reverse s

day04b :: String -> Int
day04b = sectorId . fromJust . find (("northpole object storage" ==) . name) .
         map decrypt . filter validRoom . parse
  where
    decrypt room@Room{..} = room { name = shift sectorId name }

shift :: Int -> String -> String
shift ntimes = map (rot ntimes)
    where
      rot n c
          | c == '-'  = ' '
          | isUpper c = chr $ ((ord c - ord 'A' + n) `mod` 26) + ord 'A'
          | isLower c = chr $ ((ord c - ord 'a' + n) `mod` 26) + ord 'a'
          | otherwise = c
