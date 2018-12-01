{-# LANGUAGE Strict #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
module Main (main) where

import ClassyPrelude

-- import qualified Year2015 as Y15
-- import qualified Year2016 as Y16
-- import qualified Year2017 as Y17
import qualified Year2018 as Y18

main :: IO ()
main = do
    -- Avoid running old tests
    -- Y15.runTests
    -- Y16.runTests
    -- Y17.runTests
    Y18.runTests
