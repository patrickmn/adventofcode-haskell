module AdventofCode.Year2016.Day01 (day01a, day01b) where

import Data.List (foldl')
import Data.List.Split (splitOn)
import qualified Data.Set as Set

data Action = TurnLeftThenWalk Int
            | TurnRightThenWalk Int

data Direction = North
               | South
               | East
               | West

day01a :: String -> Int
day01a input = blocksAway end
  where
    end = fst $ foldl' walk ((0, 0), North) $ parse input

blocksAway :: (Int, Int) -> Int
blocksAway (x, y) = abs x + abs y

walk :: ((Int, Int), Direction) -> Action -> ((Int, Int), Direction)
walk (cs, dir) (TurnLeftThenWalk n)  = (move cs ndir n, ndir) where ndir = leftOf dir
walk (cs, dir) (TurnRightThenWalk n) = (move cs ndir n, ndir) where ndir = rightOf dir

move :: (Int, Int) -> Direction -> Int -> (Int, Int)
move (x, y) North n = (x, y+n)
move (x, y) South n = (x, y-n)
move (x, y) East  n = (x+n, y)
move (x, y) West  n = (x-n, y)

leftOf :: Direction -> Direction
leftOf North = West
leftOf South = East
leftOf East  = North
leftOf West  = South

rightOf :: Direction -> Direction
rightOf = leftOf . leftOf . leftOf

parse :: String -> [Action]
parse s = map f $ splitOn ", " s
  where
    f ('R':nstr) = TurnRightThenWalk $ read nstr
    f ('L':nstr) = TurnLeftThenWalk $ read nstr
    f _          = error "parse: failed"

day01b :: String -> Int
day01b input = blocksAway end
  where
    end                       = go (Set.singleton (0, 0)) ((0, 0), North) $ parse input
    go _    _          []     = error "day01b: Haven't been to the same place twice"
    go been st@(cs, _) (x:xs) = sgo been $ pointsBetween cs ncs
      where
        sgo b []       = go b nst xs
        sgo b (x':xs') = if x' `Set.member` b
            then x'
            else sgo (Set.insert x' b) xs'
        nst@(ncs, _)   = walk st x

pointsBetween :: (Int, Int) -> (Int, Int) -> [(Int, Int)]
pointsBetween (x, y) (ox, oy)
    | x == ox   = drop 1 [(x, n) | n <- enum y oy]
    | y == oy   = drop 1 [(n, y) | n <- enum x ox]
    | otherwise = error "pointsBetween: Both axes moved"

enum :: (Ord a, Enum a) => a -> a -> [a]
enum a b = if a > b then reverse [b..a] else [a..b]
