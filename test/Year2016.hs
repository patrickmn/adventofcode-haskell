{-# LANGUAGE OverloadedStrings #-}
module Year2016 (runTests) where

import Data.ByteString (ByteString)
import Data.String (IsString)
import Test.Hspec (Spec, hspec, describe, it, shouldBe)

import AdventofCode.Year2016.Day01
import AdventofCode.Year2016.Day02
import AdventofCode.Year2016.Day03
import AdventofCode.Year2016.Day04
import AdventofCode.Year2016.Day05
import AdventofCode.Year2016.Day06
import AdventofCode.Year2016.Day07
import AdventofCode.Year2016.Day08
import AdventofCode.Year2016.Day09
import AdventofCode.Year2016.Day10
import AdventofCode.Year2016.Day11
import AdventofCode.Year2016.Day12
import AdventofCode.Year2016.Day13
import AdventofCode.Year2016.Day14
import AdventofCode.Year2016.Day15
import AdventofCode.Year2016.Day16
import AdventofCode.Year2016.Day17
import AdventofCode.Year2016.Day18
import AdventofCode.Year2016.Day19
import AdventofCode.Year2016.Day20
import AdventofCode.Year2016.Day21
import AdventofCode.Year2016.Day22
import AdventofCode.Year2016.Day23
import AdventofCode.Year2016.Day24
import AdventofCode.Year2016.Day25

import Util (shouldsBe)

runTests :: IO ()
runTests = hspec $ do
    describe "day01a" $ shouldsBe day01a
        [ ("R2, L3",         5)
        , ("R2, R2, R2",     2)
        , ("R5, L5, R5, R3", 12)
        ]
    describe "day01b" $ shouldsBe day01b
        [ ("R8, R4, R4, R8", 4)
        ]
