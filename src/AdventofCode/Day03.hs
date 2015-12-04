module AdventofCode.Day03 (day03a, day03b) where

import Data.List (foldl')
import qualified Data.Set as S

import AdventofCode.Util (getInput)

day03a :: IO Int
day03a = do
    input <- getInput "input/day03"
    let (_, visited) = foldl' f ((0, 0), S.singleton (0, 0)) input
    return $ S.size visited
  where
    f ((x, y), visited) dir = ((nx, ny), nvisited)
      where
        (nx, ny) = case dir of
            '^' -> (x, y+1)
            'v' -> (x, y-1)
            '>' -> (x+1, y)
            '<' -> (x-1, y)
            _   -> error "no parse"
        nvisited = S.insert (nx, ny) visited

day03b :: IO Int
day03b = do
    input <- getInput "input/day03"
    let (_, visited1)    = foldl' f ((0, 0), S.singleton (0, 0)) input1
        (_, visited2)    = foldl' f ((0, 0), S.singleton (0, 0)) input2
        (input1, input2) = unthread input
    return $ S.size $ S.union visited1 visited2
  where
    f ((x, y), visited) dir = ((nx, ny), nvisited)
      where
        (nx, ny) = case dir of
            '^' -> (x, y+1)
            'v' -> (x, y-1)
            '>' -> (x+1, y)
            '<' -> (x-1, y)
            _   -> error "no parse"
        nvisited = S.insert (nx, ny) visited

unthread :: String -> (String, String)
unthread = go [] [] False
  where
    go l1 l2 False (x:xs) = go (x : l1) l2 True xs
    go l1 l2 True  (x:xs) = go l1 (x : l2) False xs
    go l1 l2 _     []     = (reverse l1, reverse l2)
