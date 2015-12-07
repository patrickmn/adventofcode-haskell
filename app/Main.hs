module Main (main) where

import Control.Concurrent (setNumCapabilities)
import Control.Monad (forM_, liftM)
import GHC.Conc (getNumProcessors)
import System.Environment (getArgs)
import Text.Printf (printf)
import qualified Data.ByteString.Char8 as BC

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
import AdventofCode.Util (getInput)

main :: IO ()
main = do
    setNumCapabilities =<< getNumProcessors
    args <- getArgs
    forM_ args $ \arg -> case arg of
        "1a"  -> getInput "input/day01" >>= print . day01a
        "1b"  -> getInput "input/day01" >>= print . day01b
        "2a"  -> getInput "input/day02" >>= print . day02a
        "2b"  -> getInput "input/day02" >>= print . day02b
        "3a"  -> getInput "input/day03" >>= print . day03a
        "3b"  -> getInput "input/day03" >>= print . day03b
        "4a"  -> getInput "input/day04" >>= print . day04a . BC.pack
        "4b"  -> getInput "input/day04" >>= print . day04b . BC.pack
        "5a"  -> getInput "input/day05" >>= print . day05a
        "5b"  -> getInput "input/day05" >>= print . day05b
        "6a"  -> getInput "input/day06" >>= print . day06a
        "6b"  -> getInput "input/day06" >>= print . day06b
        "7a"  -> getInput "input/day07" >>= print . day07a
        "7b"  -> getInput "input/day07" >>= print . day07b
        "8a"  -> getInput "input/day08" >>= print . day08a
        "8b"  -> getInput "input/day08" >>= print . day08b
        "9a"  -> getInput "input/day09" >>= print . day09a
        "9b"  -> getInput "input/day09" >>= print . day09b
        "10a" -> getInput "input/day10" >>= print . day10a
        "10b" -> getInput "input/day10" >>= print . day10b
        "11a" -> getInput "input/day11" >>= print . day11a
        "11b" -> getInput "input/day11" >>= print . day11b
        "12a" -> getInput "input/day12" >>= print . day12a
        "12b" -> getInput "input/day12" >>= print . day12b
        "13a" -> getInput "input/day13" >>= print . day13a
        "13b" -> getInput "input/day13" >>= print . day13b
        "14a" -> getInput "input/day14" >>= print . day14a
        "14b" -> getInput "input/day14" >>= print . day14b
        "15a" -> getInput "input/day15" >>= print . day15a
        "15b" -> getInput "input/day15" >>= print . day15b
        "16a" -> getInput "input/day16" >>= print . day16a
        "16b" -> getInput "input/day16" >>= print . day16b
        "17a" -> getInput "input/day17" >>= print . day17a
        "17b" -> getInput "input/day17" >>= print . day17b
        "18a" -> getInput "input/day18" >>= print . day18a
        "18b" -> getInput "input/day18" >>= print . day18b
        "19a" -> getInput "input/day19" >>= print . day19a
        "19b" -> getInput "input/day19" >>= print . day19b
        "20a" -> getInput "input/day20" >>= print . day20a
        "20b" -> getInput "input/day20" >>= print . day20b
        "21a" -> getInput "input/day21" >>= print . day21a
        "21b" -> getInput "input/day21" >>= print . day21b
        "22a" -> getInput "input/day22" >>= print . day22a
        "22b" -> getInput "input/day22" >>= print . day22b
        "23a" -> getInput "input/day23" >>= print . day23a
        "23b" -> getInput "input/day23" >>= print . day23b
        "24a" -> getInput "input/day24" >>= print . day24a
        "24b" -> getInput "input/day24" >>= print . day24b
        "25a" -> getInput "input/day25" >>= print . day25a
        "25b" -> getInput "input/day25" >>= print . day25b
        _     -> printf "Problem '%s' not found" arg
