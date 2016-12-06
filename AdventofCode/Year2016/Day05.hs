{-# LANGUAGE OverloadedStrings #-}
module AdventofCode.Year2016.Day05 (day05a, day05b) where

import Data.ByteString (ByteString)
import Data.Maybe (fromJust)
import qualified Data.ByteString.Char8 as BC

import AdventofCode.Common (md5Hex, isMd5Preimage)

day05a :: ByteString -> String
day05a input = map sixthHexChr $ take 8 $ filter (isMd5Preimage input "00000") [1..]
  where
    sixthHexChr = flip BC.index 5 . md5Hex . (input `BC.append`) . BC.pack . show

day05b :: ByteString -> String
day05b input = go (0 :: Int) $
    map posAndChar $ filter (isMd5Preimage input "00000") [1..]
  where
    go 8 _       = []
    go n pcs     = fromJust (lookup (head $ show n) pcs) : go (succ n) pcs
    posAndChar n = (BC.index s 5, BC.index s 6)
      where
        s = md5Hex $ input `BC.append` BC.pack (show n)
