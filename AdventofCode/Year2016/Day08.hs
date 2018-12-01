module AdventofCode.Year2016.Day08 (day08a, day08b) where

import Data.List (foldl')
import Data.List.Split (splitOn)
import Data.Set (Set)
import qualified Data.Set as Set

data Operation = Rect Int Int
               | RotateColumn Int Int
               | RotateRow Int Int

day08a :: String -> Int
day08a input = undefined

-- day08a :: String -> Int
-- day08a = Set.size . foldl' apply Set.empty . parse

-- apply :: Set (Int, Int) -> Operation -> Set (Int, Int)
-- -- TODO: containers-0.8.5.1 has fromDistinctDescList
-- apply d (Rect x y)           = Set.union d $ Set.fromList $ rectIndices x y
-- apply d (RotateColumn col n) = Set.union pruned newlySet
--   where
--     pruned   = undefined
--     newlySet = undefined
--     map (`mod` 49 . (+ n))
-- apply d (RotateRow row n)    = map (`mod` 5 . (+ n))

-- rectIndices :: Int -> Int -> [(Int, Int)]
-- rectIndices topX topY = [(x, y) | x <- [topX,topX-1..0], y <- [topY,topY-1..0]]

-- parse :: String -> [Operation]
-- parse = map (f . words) . lines
--   where
--     f ["rect", s]                              = Rect (read x) (read y) where [x, y] = splitOn "x" s
--     f ["rotate", "column", colStr, "by", nstr] = RotateColumn (read $ drop 2 colStr) (read nstr)
--     f ["rotate", "row", rowStr, "by", nstr]    = RotateRow (read $ drop 2 rowStr) (read nstr)
--     f _                                        = error "parse: failed"

day08b :: String -> Int
day08b input = undefined
