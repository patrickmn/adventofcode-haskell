{-# LANGUAGE Strict #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
module Main (main) where

import ClassyPrelude

import qualified Year2015 as Y15
import qualified Year2016 as Y16

main :: IO ()
main = do
    -- Y15.runTests
    Y16.runTests
