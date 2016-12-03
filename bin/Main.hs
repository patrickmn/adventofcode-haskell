{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE Strict #-}
{-# LANGUAGE OverloadedStrings #-}
module Main (main) where

import ClassyPrelude
import Control.Monad (forM_)
import GHC.Conc (getNumProcessors)
import Text.Printf (printf)
import qualified Data.ByteString.Char8 as BC

import qualified AdventofCode.Year2015.Day01 as Y15
import qualified AdventofCode.Year2015.Day02 as Y15
import qualified AdventofCode.Year2015.Day03 as Y15
import qualified AdventofCode.Year2015.Day04 as Y15
import qualified AdventofCode.Year2015.Day05 as Y15
import qualified AdventofCode.Year2015.Day06 as Y15
import qualified AdventofCode.Year2015.Day07 as Y15
import qualified AdventofCode.Year2015.Day08 as Y15
import qualified AdventofCode.Year2015.Day09 as Y15
import qualified AdventofCode.Year2015.Day10 as Y15
import qualified AdventofCode.Year2015.Day11 as Y15
import qualified AdventofCode.Year2015.Day12 as Y15
import qualified AdventofCode.Year2015.Day13 as Y15
import qualified AdventofCode.Year2015.Day14 as Y15
import qualified AdventofCode.Year2015.Day15 as Y15
import qualified AdventofCode.Year2015.Day16 as Y15
import qualified AdventofCode.Year2015.Day17 as Y15
import qualified AdventofCode.Year2015.Day18 as Y15
import qualified AdventofCode.Year2015.Day19 as Y15
import qualified AdventofCode.Year2015.Day20 as Y15
import qualified AdventofCode.Year2015.Day21 as Y15
import qualified AdventofCode.Year2015.Day22 as Y15
import qualified AdventofCode.Year2015.Day23 as Y15
import qualified AdventofCode.Year2015.Day24 as Y15
import qualified AdventofCode.Year2015.Day25 as Y15
import qualified AdventofCode.Year2016.Day01 as Y16
import qualified AdventofCode.Year2016.Day02 as Y16
import qualified AdventofCode.Year2016.Day03 as Y16
import qualified AdventofCode.Year2016.Day04 as Y16
import qualified AdventofCode.Year2016.Day05 as Y16
import qualified AdventofCode.Year2016.Day06 as Y16
import qualified AdventofCode.Year2016.Day07 as Y16
import qualified AdventofCode.Year2016.Day08 as Y16
import qualified AdventofCode.Year2016.Day09 as Y16
import qualified AdventofCode.Year2016.Day10 as Y16
import qualified AdventofCode.Year2016.Day11 as Y16
import qualified AdventofCode.Year2016.Day12 as Y16
import qualified AdventofCode.Year2016.Day13 as Y16
import qualified AdventofCode.Year2016.Day14 as Y16
import qualified AdventofCode.Year2016.Day15 as Y16
import qualified AdventofCode.Year2016.Day16 as Y16
import qualified AdventofCode.Year2016.Day17 as Y16
import qualified AdventofCode.Year2016.Day18 as Y16
import qualified AdventofCode.Year2016.Day19 as Y16
import qualified AdventofCode.Year2016.Day20 as Y16
import qualified AdventofCode.Year2016.Day21 as Y16
import qualified AdventofCode.Year2016.Day22 as Y16
import qualified AdventofCode.Year2016.Day23 as Y16
import qualified AdventofCode.Year2016.Day24 as Y16
import qualified AdventofCode.Year2016.Day25 as Y16
import AdventofCode.Util (getInput)

main :: IO ()
main = do
    setNumCapabilities =<< getNumProcessors
    args <- getArgs
    case args of
        []        -> usage
        (_:[])    -> usage
        (year:xs) -> case year of
            "2015" -> mapM_ run2015 xs
            "2016" -> mapM_ run2016 xs
            _      -> putStrLn "Invalid year"

usage :: IO ()
usage = putStrLn "Usage: adventofcode <year> [1a, 1b, 7a, ...]"

run2015 :: Text -> IO ()
run2015 "1a"  = getInput "input/2015/day01" >>= print . Y15.day01a
run2015 "1b"  = getInput "input/2015/day01" >>= print . Y15.day01b
run2015 "2a"  = getInput "input/2015/day02" >>= print . Y15.day02a
run2015 "2b"  = getInput "input/2015/day02" >>= print . Y15.day02b
run2015 "3a"  = getInput "input/2015/day03" >>= print . Y15.day03a
run2015 "3b"  = getInput "input/2015/day03" >>= print . Y15.day03b
run2015 "4a"  = getInput "input/2015/day04" >>= print . Y15.day04a . BC.pack
run2015 "4b"  = getInput "input/2015/day04" >>= print . Y15.day04b . BC.pack
run2015 "5a"  = getInput "input/2015/day05" >>= print . Y15.day05a
run2015 "5b"  = getInput "input/2015/day05" >>= print . Y15.day05b
run2015 "6a"  = getInput "input/2015/day06" >>= print . Y15.day06a
run2015 "6b"  = getInput "input/2015/day06" >>= print . Y15.day06b
run2015 "7a"  = getInput "input/2015/day07" >>= print . Y15.day07a
run2015 "7b"  = getInput "input/2015/day07" >>= print . Y15.day07b
run2015 "8a"  = getInput "input/2015/day08" >>= print . Y15.day08a
run2015 "8b"  = getInput "input/2015/day08" >>= print . Y15.day08b
run2015 "9a"  = getInput "input/2015/day09" >>= print . Y15.day09a
run2015 "9b"  = getInput "input/2015/day09" >>= print . Y15.day09b
run2015 "10a" = getInput "input/2015/day10" >>= print . Y15.day10a
run2015 "10b" = getInput "input/2015/day10" >>= print . Y15.day10b
run2015 "11a" = getInput "input/2015/day11" >>= print . Y15.day11a
run2015 "11b" = getInput "input/2015/day11" >>= print . Y15.day11b
run2015 "12a" = getInput "input/2015/day12" >>= print . Y15.day12a
run2015 "12b" = getInput "input/2015/day12" >>= print . Y15.day12b . BC.pack
run2015 "13a" = getInput "input/2015/day13" >>= print . Y15.day13a
run2015 "13b" = getInput "input/2015/day13" >>= print . Y15.day13b
run2015 "14a" = getInput "input/2015/day14" >>= print . Y15.day14a
run2015 "14b" = getInput "input/2015/day14" >>= print . Y15.day14b
run2015 "15a" = getInput "input/2015/day15" >>= print . Y15.day15a
run2015 "15b" = getInput "input/2015/day15" >>= print . Y15.day15b
run2015 "16a" = getInput "input/2015/day16" >>= print . Y15.day16a
run2015 "16b" = getInput "input/2015/day16" >>= print . Y15.day16b
run2015 "17a" = getInput "input/2015/day17" >>= print . Y15.day17a
run2015 "17b" = getInput "input/2015/day17" >>= print . Y15.day17b
run2015 "18a" = getInput "input/2015/day18" >>= print . Y15.day18a
run2015 "18b" = getInput "input/2015/day18" >>= print . Y15.day18b
run2015 "19a" = getInput "input/2015/day19" >>= print . Y15.day19a
run2015 "19b" = getInput "input/2015/day19" >>= print . Y15.day19b
run2015 "20a" = getInput "input/2015/day20" >>= print . Y15.day20a
run2015 "20b" = getInput "input/2015/day20" >>= print . Y15.day20b
run2015 "21a" = getInput "input/2015/day21" >>= print . Y15.day21a
run2015 "21b" = getInput "input/2015/day21" >>= print . Y15.day21b
run2015 "22a" = getInput "input/2015/day22" >>= print . Y15.day22a
run2015 "22b" = getInput "input/2015/day22" >>= print . Y15.day22b
run2015 "23a" = getInput "input/2015/day23" >>= print . Y15.day23a
run2015 "23b" = getInput "input/2015/day23" >>= print . Y15.day23b
run2015 "24a" = getInput "input/2015/day24" >>= print . Y15.day24a
run2015 "24b" = getInput "input/2015/day24" >>= print . Y15.day24b
run2015 "25a" = getInput "input/2015/day25" >>= print . Y15.day25a
run2015 "25b" = getInput "input/2015/day25" >>= print . Y15.day25b
run2015 s     = printf "Problem '%s' not found for 2015\n" s

run2016 :: Text -> IO ()
run2016 "1a"  = getInput "input/2016/day01" >>= print . Y16.day01a
run2016 "1b"  = getInput "input/2016/day01" >>= print . Y16.day01b
run2016 "2a"  = getInput "input/2016/day02" >>= print . Y16.day02a
run2016 "2b"  = getInput "input/2016/day02" >>= print . Y16.day02b
run2016 "3a"  = getInput "input/2016/day03" >>= print . Y16.day03a
run2016 "3b"  = getInput "input/2016/day03" >>= print . Y16.day03b
run2016 "4a"  = getInput "input/2016/day04" >>= print . Y16.day04a
run2016 "4b"  = getInput "input/2016/day04" >>= print . Y16.day04b
run2016 "5a"  = getInput "input/2016/day05" >>= print . Y16.day05a
run2016 "5b"  = getInput "input/2016/day05" >>= print . Y16.day05b
run2016 "6a"  = getInput "input/2016/day06" >>= print . Y16.day06a
run2016 "6b"  = getInput "input/2016/day06" >>= print . Y16.day06b
run2016 "7a"  = getInput "input/2016/day07" >>= print . Y16.day07a
run2016 "7b"  = getInput "input/2016/day07" >>= print . Y16.day07b
run2016 "8a"  = getInput "input/2016/day08" >>= print . Y16.day08a
run2016 "8b"  = getInput "input/2016/day08" >>= print . Y16.day08b
run2016 "9a"  = getInput "input/2016/day09" >>= print . Y16.day09a
run2016 "9b"  = getInput "input/2016/day09" >>= print . Y16.day09b
run2016 "10a" = getInput "input/2016/day10" >>= print . Y16.day10a
run2016 "10b" = getInput "input/2016/day10" >>= print . Y16.day10b
run2016 "11a" = getInput "input/2016/day11" >>= print . Y16.day11a
run2016 "11b" = getInput "input/2016/day11" >>= print . Y16.day11b
run2016 "12a" = getInput "input/2016/day12" >>= print . Y16.day12a
run2016 "12b" = getInput "input/2016/day12" >>= print . Y16.day12b
run2016 "13a" = getInput "input/2016/day13" >>= print . Y16.day13a
run2016 "13b" = getInput "input/2016/day13" >>= print . Y16.day13b
run2016 "14a" = getInput "input/2016/day14" >>= print . Y16.day14a
run2016 "14b" = getInput "input/2016/day14" >>= print . Y16.day14b
run2016 "15a" = getInput "input/2016/day15" >>= print . Y16.day15a
run2016 "15b" = getInput "input/2016/day15" >>= print . Y16.day15b
run2016 "16a" = getInput "input/2016/day16" >>= print . Y16.day16a
run2016 "16b" = getInput "input/2016/day16" >>= print . Y16.day16b
run2016 "17a" = getInput "input/2016/day17" >>= print . Y16.day17a
run2016 "17b" = getInput "input/2016/day17" >>= print . Y16.day17b
run2016 "18a" = getInput "input/2016/day18" >>= print . Y16.day18a
run2016 "18b" = getInput "input/2016/day18" >>= print . Y16.day18b
run2016 "19a" = getInput "input/2016/day19" >>= print . Y16.day19a
run2016 "19b" = getInput "input/2016/day19" >>= print . Y16.day19b
run2016 "20a" = getInput "input/2016/day20" >>= print . Y16.day20a
run2016 "20b" = getInput "input/2016/day20" >>= print . Y16.day20b
run2016 "21a" = getInput "input/2016/day21" >>= print . Y16.day21a
run2016 "21b" = getInput "input/2016/day21" >>= print . Y16.day21b
run2016 "22a" = getInput "input/2016/day22" >>= print . Y16.day22a
run2016 "22b" = getInput "input/2016/day22" >>= print . Y16.day22b
run2016 "23a" = getInput "input/2016/day23" >>= print . Y16.day23a
run2016 "23b" = getInput "input/2016/day23" >>= print . Y16.day23b
run2016 "24a" = getInput "input/2016/day24" >>= print . Y16.day24a
run2016 "24b" = getInput "input/2016/day24" >>= print . Y16.day24b
run2016 "25a" = getInput "input/2016/day25" >>= print . Y16.day25a
run2016 "25b" = getInput "input/2016/day25" >>= print . Y16.day25b
run2016 s     = printf "Problem '%s' not found for 2016\n" s
