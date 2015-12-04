{-# LANGUAGE OverloadedStrings #-}
module AdventofCode.Day04 (day04a, day04b) where

import Crypto.Hash (Digest, MD5, hash, digestToHexByteString)
import Data.ByteString (ByteString)
import qualified Data.ByteString.Char8 as BC

import AdventofCode.Util (getInput)

day04a :: ByteString -> Int
day04a input = head $ filter (checkPrefix input "00000") [1..]

checkPrefix :: ByteString -> ByteString -> Int -> Bool
checkPrefix input prefix num = prefix `BC.isPrefixOf` digestToHexByteString d
  where
    d :: Digest MD5
    d = hash $ input `BC.append` BC.pack (show num)

day04b :: ByteString -> Int
day04b input = head $ filter (checkPrefix input "000000") [1..]
