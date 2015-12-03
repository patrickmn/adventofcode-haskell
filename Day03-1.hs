module Main where

import Data.List (foldl')
import qualified Data.Set as S

import Util (trim)

main :: IO ()
main = do
    input <- trim <$> readFile "day03-input.txt"
    let (_, visited) = foldl' f ((0, 0), S.singleton (0, 0)) input
    print $ S.size visited
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
