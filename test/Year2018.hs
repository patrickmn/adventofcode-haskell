{-# LANGUAGE OverloadedStrings #-}
module Year2018 (runTests) where

import Data.ByteString (ByteString)
import Data.String (IsString)
import Test.Hspec (Spec, hspec, describe, it, shouldBe)

import AdventofCode.Year2018.Day01
import AdventofCode.Year2018.Day02
import AdventofCode.Year2018.Day03
import AdventofCode.Year2018.Day04
import AdventofCode.Year2018.Day05
import AdventofCode.Year2018.Day06
import AdventofCode.Year2018.Day07
import AdventofCode.Year2018.Day08
import AdventofCode.Year2018.Day09
import AdventofCode.Year2018.Day10
import AdventofCode.Year2018.Day11
import AdventofCode.Year2018.Day12
import AdventofCode.Year2018.Day13
import AdventofCode.Year2018.Day14
import AdventofCode.Year2018.Day15
import AdventofCode.Year2018.Day16
import AdventofCode.Year2018.Day17
import AdventofCode.Year2018.Day18
import AdventofCode.Year2018.Day19
import AdventofCode.Year2018.Day20
import AdventofCode.Year2018.Day21
import AdventofCode.Year2018.Day22
import AdventofCode.Year2018.Day23
import AdventofCode.Year2018.Day24
import AdventofCode.Year2018.Day25

import Util (shouldsBe)

runTests :: IO ()
runTests = hspec $ do
    describe "day01a" $ shouldsBe day01a
        [ ("+1\n-2\n+3\n+1", 3)
        , ("+1\n+1\n+1", 3)
        , ("+1\n+1\n-2", 0)
        , ("-1\n-2\n-3", -6)
        ]
    describe "day01b" $ shouldsBe day01b
        [ ("+1\n-1", 0)
        , ("+3\n+3\n+4\n-2\n-4", 10)
        , ("-6\n+3\n+8\n+5\n-6", 5)
        , ("+7\n+7\n-2\n-7\n-4", 14)
        ]
    describe "day02a" $ shouldsBe day02a
        [ ("abcdef\nbababc\nabbcde\nabcccd\naabcdd\nabcdee\nababab", 12)
        ]
    describe "day02b" $ shouldsBe day02b
        [ ("abcde\nfghij\nklmno\npqrst\nfguij\naxcye\nwvxyz", "fgij")
        ]
