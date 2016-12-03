{-# LANGUAGE OverloadedStrings #-}
module Year2015 (runTests) where

import Data.ByteString (ByteString)
import Data.String (IsString)
import Test.Hspec (Spec, hspec, describe, it, shouldBe)

import AdventofCode.Year2015.Day01
import AdventofCode.Year2015.Day02
import AdventofCode.Year2015.Day03
import AdventofCode.Year2015.Day04
import AdventofCode.Year2015.Day05
import AdventofCode.Year2015.Day06
import AdventofCode.Year2015.Day07
import AdventofCode.Year2015.Day08
import AdventofCode.Year2015.Day09
import AdventofCode.Year2015.Day10
import AdventofCode.Year2015.Day11
import AdventofCode.Year2015.Day12
import AdventofCode.Year2015.Day13
import AdventofCode.Year2015.Day14
import AdventofCode.Year2015.Day15
import AdventofCode.Year2015.Day16
import AdventofCode.Year2015.Day17
import AdventofCode.Year2015.Day18
import AdventofCode.Year2015.Day19
import AdventofCode.Year2015.Day20
import AdventofCode.Year2015.Day21
import AdventofCode.Year2015.Day22
import AdventofCode.Year2015.Day23
import AdventofCode.Year2015.Day24
import AdventofCode.Year2015.Day25

import Util (shouldsBe)

runTests :: IO ()
runTests = hspec $ do
    describe "day01a" $ shouldsBe day01a
        [ ("(())",    0)
        , ("()()",    0)
        , ("(((",     3)
        , ("(()(()(", 3)
        , ("))(((((", 3)
        , ("())",    -1)
        , ("))(",    -1)
        , (")))",    -3)
        ]
    describe "day01b" $ shouldsBe day01b
        [ (")",     1)
        , ("()())", 5)
        ]
    describe "day02a" $ shouldsBe day02a
        [ ("2x3x4",  58)
        , ("1x1x10", 43)
        ]
    describe "day02b" $ shouldsBe day02b
        [ ("2x3x4",  34)
        , ("1x1x10", 14)
        ]
    describe "day03a" $ shouldsBe day03a
        [ (">",          2)
        , ("^>v<",       4)
        , ("^v^v^v^v^v", 2)
        ]
    describe "day03b" $ shouldsBe day03b
        [ ("^v",         3)
        , ("^>v<",       3)
        , ("^v^v^v^v^v", 11)
        ]
    describe "day04" $ shouldsBe day04a
        [ ("abcdef",  609043)
        , ("pqrstuv", 1048970)
        ]
    describe "day05a" $ shouldsBe day05a
        [ ("ugknbfddgicrmopn", 1)
        , ("aaa",              1)
        , ("jchzalrnumimnmhp", 0)
        , ("haegwjzuvuyypxyu", 0)
        , ("dvszwmarrgswjxmb", 0)
        ]
    describe "day05b" $ shouldsBe day05b
        [ ("qjhvhtzxzqqjkmpb", 1)
        , ("xxyxx",            1)
        , ("aaaa",             1)
        , ("uurcxstgmygtbstg", 0)
        , ("ieodomkazucvgmuy", 0)
        ]
    describe "day06a" $ shouldsBe day06a
        [ ("turn on 0,0 through 999,999", 1000000)
        , ("toggle 0,0 through 999,0",    1000)
        , ("turn on 499,499 through 500,500\nturn off 499,499 through 500,500", 0)
        ]
    describe "day06b" $ shouldsBe day06b
        [ ("turn on 0,0 through 0,0",    1)
        , ("toggle 0,0 through 999,999", 2000000)
        ]
    describe "day07" $ shouldsBe day07a
        [ (unlines [ "123 -> x"
                   , "456 -> y"
                   , "x AND y -> d"
                   , "x OR y -> e"
                   , "x LSHIFT 2 -> f"
                   , "y RSHIFT 2 -> g"
                   , "NOT x -> h"
                   , "NOT y -> i"
                   , "i -> a"
                   ], 65079)
        ]
    let day08 = unlines
            [ "\"\""
            , "\"abc\""
            , "\"aaa\\\"aaa\""
            , "\"\\x27\""
            ]
    describe "day08a" $ shouldsBe day08a [(day08, 12)]
    describe "day08b" $ shouldsBe day08b [(day08, 19)]
    let day09 = unlines
            [ "London to Dublin = 464"
            , "London to Belfast = 518"
            , "Dublin to Belfast = 141"
            ]
    describe "day09a" $ shouldsBe day09a [(day09, 605)]
    describe "day09b" $ shouldsBe day09b [(day09, 982)]
    describe "day10" $ shouldsBe day10a
        [ ("1",      82350)
        , ("11",     107312)
        , ("21",     139984)
        , ("1211",   182376)
        , ("111221", 237746)
        ]
    describe "day11a" $ shouldsBe day11a
        [ ("abcdefgh", "abcdffaa")
        , ("ghijklmn", "ghjaabcc")
        ]
    describe "day12a" $ shouldsBe day12a
        [ ("[1,2,3]",                    6)
        , ("{\"a\":2,\"b\":4}",          6)
        , ("[[[3]]]",                    3)
        , ("{\"a\":{\"b\":4},\"c\":-1}", 3)
        , ("{\"a\":[-1,1]}",             0)
        , ("[]",                         0)
        , ("{}",                         0)
        ]
    describe "day12b" $ shouldsBe day12b
        [ ("[1,2,3]",                                 6)
        , ("[1,{\"c\":\"red\",\"b\":2},3]",           4)
        , ("{\"d\":\"red\",\"e\":[1,2,3,4],\"f\":5}", 0)
        , ("[1,\"red\",5]",                           6)
        ]
    -- describe "day14a" $ shouldsBe day14a
    --     [ (unlines [ "Comet can fly 14 km/s for 10 seconds, but then must rest for 127 seconds."
    --                , "Dancer can fly 16 km/s for 11 seconds, but then must rest for 162 seconds."
    --                ], 1120)
    --     ]
