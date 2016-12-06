module AdventofCode.Common where

-- Helpers used by more than one problem/day

import Crypto.Hash (Digest, MD5, hash, digestToHexByteString)
import Data.ByteString (ByteString)
import qualified Data.ByteString.Char8 as BC

isMd5Preimage :: ByteString -> ByteString -> Int -> Bool
isMd5Preimage input prefix num = prefix `BC.isPrefixOf` h
  where
    h = md5Hex $ input `BC.append` BC.pack (show num)

md5Hex :: ByteString -> ByteString
md5Hex input = digestToHexByteString d
  where
    d :: Digest MD5
    d = hash input
