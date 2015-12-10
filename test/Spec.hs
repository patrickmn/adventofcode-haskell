{-# LANGUAGE OverloadedStrings #-}
module Main (main) where

import Data.ByteString (ByteString)
import Data.String (IsString)
import Test.Hspec (Spec, hspec, describe, it, shouldBe)

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
main = hspec $ do
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

shouldsBe :: (IsString a, Show a, Eq b, Show b)
          => (a -> b)
          -> [(a, b)]
          -> Spec
shouldsBe f = mapM_ (\(input, v) -> it (show input) $ f input `shouldBe` v)
