{-# LANGUAGE OverloadedStrings #-}
module AdventofCode.Year2015.Day04 (day04a, day04b) where

import Data.ByteString (ByteString)

import AdventofCode.Common (isMd5Preimage)

day04a :: ByteString -> Int
day04a input = head $ filter (isMd5Preimage input "00000") [1..]

day04b :: ByteString -> Int
day04b input = head $ filter (isMd5Preimage input "000000") [1..]
