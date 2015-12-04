module AdventofCode.Day03 (day03a, day03b) where

import Data.List (foldl')
import qualified Data.Set as S

day03a :: String -> Int
day03a input = S.size visited
  where
    (_, visited)    = foldl' f ((0, 0), S.singleton (0, 0)) input
    f (xy, vis) dir = (nxy, nvis)
      where
        nxy  = moveXY dir xy
        nvis = S.insert nxy vis

moveXY :: Char -> (Int, Int) -> (Int, Int)
moveXY '^' (x, y) = (x, y+1)
moveXY 'v' (x, y) = (x, y-1)
moveXY '>' (x, y) = (x+1, y)
moveXY '<' (x, y) = (x-1, y)
moveXY _   _      = error "moveXY: no parse"

day03b :: String -> Int
day03b input = S.size $ S.union visited1 visited2
  where
    (_, visited1)       = foldl' f ((0, 0), S.singleton (0, 0)) input1
    (_, visited2)       = foldl' f ((0, 0), S.singleton (0, 0)) input2
    (input1, input2)    = unthread input
    f (xy, visited) dir = (nxy, nvisited)
      where
        nxy      = moveXY dir xy
        nvisited = S.insert nxy visited

unthread :: String -> (String, String)
unthread = go [] [] False
  where
    go l1 l2 False (x:xs) = go (x : l1) l2 True xs
    go l1 l2 True  (x:xs) = go l1 (x : l2) False xs
    go l1 l2 _     []     = (reverse l1, reverse l2)
