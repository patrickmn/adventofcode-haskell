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
    [ ("1a", day01a)
    , ("1b", day01b)
    , ("2a", day02a)
    , ("2b", day02b)
    , ("3a", day03a)
    , ("3b", day03b)
    , ("4a", day04a)
    , ("4b", day04b)
    , ("5a", day05a)
    , ("5b", day05b)
    , ("6a", day06a)
    , ("6b", day06b)
    , ("7a", day07a)
    , ("7b", day07b)
    , ("8a", day08a)
    , ("8b", day08b)
    , ("9a", day09a)
    , ("9b", day09b)
    , ("10a", day10a)
    , ("10b", day10b)
    , ("11a", day11a)
    , ("11b", day11b)
    , ("12a", day12a)
    , ("12b", day12b)
    , ("13a", day13a)
    , ("13b", day13b)
    , ("14a", day14a)
    , ("14b", day14b)
    , ("15a", day15a)
    , ("15b", day15b)
    , ("16a", day16a)
    , ("16b", day16b)
    , ("17a", day17a)
    , ("17b", day17b)
    , ("18a", day18a)
    , ("18b", day18b)
    , ("19a", day19a)
    , ("19b", day19b)
    , ("20a", day20a)
    , ("20b", day20b)
    , ("21a", day21a)
    , ("21b", day21b)
    , ("22a", day22a)
    , ("22b", day22b)
    , ("23a", day23a)
    , ("23b", day23b)
    , ("24a", day24a)
    , ("24b", day24b)
    , ("25a", day25a)
    , ("25b", day25b)
    ]
