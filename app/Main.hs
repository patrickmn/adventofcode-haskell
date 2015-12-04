module Main where

import Control.Concurrent (setNumCapabilities)
import Control.Monad (forM_)
import GHC.Conc (getNumProcessors)
import System.Environment (getArgs)
import Text.Printf (printf)

import AdventofCode.Day01
import AdventofCode.Day02
import AdventofCode.Day03
import AdventofCode.Day04
import AdventofCode.Day05
import AdventofCode.Day06
import AdventofCode.Day07
import AdventofCode.Day08
import AdventofCode.Day09
import AdventofCode.Day10
import AdventofCode.Day11
import AdventofCode.Day12
import AdventofCode.Day13
import AdventofCode.Day14
import AdventofCode.Day15
import AdventofCode.Day16
import AdventofCode.Day17
import AdventofCode.Day18
import AdventofCode.Day19
import AdventofCode.Day20
import AdventofCode.Day21
import AdventofCode.Day22
import AdventofCode.Day23
import AdventofCode.Day24
import AdventofCode.Day25

main :: IO ()
main = do
    setNumCapabilities =<< getNumProcessors
    args <- getArgs
    forM_ args $ \arg -> case lookup arg problems of
        Nothing   -> putStrLn $ printf "Problem '%s' not found" arg
        Just prob -> prob >>= print

problems :: [(String, IO Int)]
problems =
    [ ("1-a", day01a)
    , ("1-b", day01b)
    , ("2-a", day02a)
    , ("2-b", day02b)
    , ("3-a", day03a)
    , ("3-b", day03b)
    , ("4-a", day04a)
    , ("4-b", day04b)
    , ("5-a", day05a)
    , ("5-b", day05b)
    , ("6-a", day06a)
    , ("6-b", day06b)
    , ("7-a", day07a)
    , ("7-b", day07b)
    , ("8-a", day08a)
    , ("8-b", day08b)
    , ("9-a", day09a)
    , ("9-b", day09b)
    , ("10-a", day10a)
    , ("10-b", day10b)
    , ("11-a", day11a)
    , ("11-b", day11b)
    , ("12-a", day12a)
    , ("12-b", day12b)
    , ("13-a", day13a)
    , ("13-b", day13b)
    , ("14-a", day14a)
    , ("14-b", day14b)
    , ("15-a", day15a)
    , ("15-b", day15b)
    , ("16-a", day16a)
    , ("16-b", day16b)
    , ("17-a", day17a)
    , ("17-b", day17b)
    , ("18-a", day18a)
    , ("18-b", day18b)
    , ("19-a", day19a)
    , ("19-b", day19b)
    , ("20-a", day20a)
    , ("20-b", day20b)
    , ("21-a", day21a)
    , ("21-b", day21b)
    , ("22-a", day22a)
    , ("22-b", day22b)
    , ("23-a", day23a)
    , ("23-b", day23b)
    , ("24-a", day24a)
    , ("24-b", day24b)
    , ("25-a", day25a)
    , ("25-b", day25b)
    ]
