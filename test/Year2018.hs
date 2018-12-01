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
        [ ("1122",     3)
