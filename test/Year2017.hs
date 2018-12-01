{-# LANGUAGE OverloadedStrings #-}
module Year2017 (runTests) where

import Data.ByteString (ByteString)
import Data.String (IsString)
import Test.Hspec (Spec, hspec, describe, it, shouldBe)

import AdventofCode.Year2017.Day01
import AdventofCode.Year2017.Day02
import AdventofCode.Year2017.Day03
import AdventofCode.Year2017.Day04
import AdventofCode.Year2017.Day05
import AdventofCode.Year2017.Day06
import AdventofCode.Year2017.Day07
import AdventofCode.Year2017.Day08
import AdventofCode.Year2017.Day09
import AdventofCode.Year2017.Day10
import AdventofCode.Year2017.Day11
import AdventofCode.Year2017.Day12
import AdventofCode.Year2017.Day13
import AdventofCode.Year2017.Day14
import AdventofCode.Year2017.Day15
import AdventofCode.Year2017.Day16
import AdventofCode.Year2017.Day17
import AdventofCode.Year2017.Day18
import AdventofCode.Year2017.Day19
import AdventofCode.Year2017.Day20
import AdventofCode.Year2017.Day21
import AdventofCode.Year2017.Day22
import AdventofCode.Year2017.Day23
import AdventofCode.Year2017.Day24
import AdventofCode.Year2017.Day25

import Util (shouldsBe)

runTests :: IO ()
runTests = hspec $ do
    describe "day01a" $ shouldsBe day01a
        [ ("1122",     3)
        , ("1111",     4)
        , ("1234",     0)
        , ("91212129", 9)
        ]
    describe "day01b" $ shouldsBe day01b
        [ ("1212",     6)
        , ("1221",     0)
        , ("123425",   4)
        , ("123123",   12)
        , ("12131415", 4)
        ]
    describe "day02a" $ shouldsBe day02a
        [ ("5\t1\t9\t5\n7\t5\t3\n2\t4\t6\t8", 18)
        ]
    describe "day02b" $ shouldsBe day02b
        [ ("5\t9\t2\t8\n9\t4\t7\t3\n3\t8\t6\t5", 9)
        ]
    -- describe "day03a" $ shouldsBe day03a
    --     [ ("1",    0)
    --     , ("12",   3)
    --     , ("23",   2)
    --     , ("1024", 31)
    --     ]
    describe "day04a" $ shouldsBe day04a
        [ ("aa bb cc dd ee",  1)
        , ("aa bb cc dd aa",  0)
        , ("aa bb cc dd aaa", 1)
        ]
    describe "day04b" $ shouldsBe day04b
        [ ("abcde fghij",              1)
        , ("abcde xyz ecdab",          0)
        , ("a ab abc abd abf abj",     1)
        , ("iiii oiii ooii oooi oooo", 1)
        , ("oiii ioii iioi iiio",      0)
        ]
    describe "day05a" $ shouldsBe day05a
        [ ("0\n3\n0\n1\n-3", 5)
        ]
    describe "day05b" $ shouldsBe day05b
        [ ("0\n3\n0\n1\n-3", 10)
        ]
    describe "day06a" $ shouldsBe day06a
        [ ("0\t2\t7\t0", 5)
        ]
    -- describe "day07a" $ shouldsBe day07a
    --     [ ( "pbga (66)\nxhth (57)\nebii (61)\nhavc (66)\nktlj (57)\nfwft (72) -> ktlj, cntj, xhth\nqoyq (66)\npadx (45) -> pbga, havc, qoyq\ntknk (41) -> ugml, padx, fwft\njptl (61)\nugml (68) -> gyxo, ebii, jptl\ngyxo (61)\ncntj (57)"
    --       , "tknk"
    --       )
    --     ]
    -- describe "day08a" $ shouldsBe day08a
    --     [ ("b inc 5 if a > 1\na inc 1 if b < 5\nc dec -10 if a >= 1\nc inc -20 if c == 10", 1)
    --     ]
    describe "day09a" $ shouldsBe day09a
        [ ("{}",                             1)
        , ("{{{}}}",                         6)
        , ("{{},{}}",                        5)
        , ("{{{},{},{{}}}}",                16)
        , ("{<a>,<a>,<a>,<a>}",              1)
        , ("{{<ab>},{<ab>},{<ab>},{<ab>}}",  9)
        , ("{{<!!>},{<!!>},{<!!>},{<!!>}}",  9)
        , ("{{<a!>},{<a!>},{<a!>},{<ab>}}",  3)
        ]
