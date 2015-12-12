{-# LANGUAGE OverloadedStrings #-}
module AdventofCode.Day12 (day12a, day12b) where

import Data.ByteString (ByteString)
import Data.Char (isDigit)
import Data.Maybe (fromJust)
import Data.Scientific (toBoundedInteger)
import qualified Data.Aeson as AE
import qualified Data.HashMap.Strict as H

day12a :: String -> Int
day12a input = go (d input) 0
  where
    go [] acc = acc
    go xs acc = go (d nxs) $! acc + n
      where
        n        = read s
        (s, nxs) = span cond xs
    d         = dropWhile (not . cond)
    cond x    = isDigit x || x == '-'

day12b :: ByteString -> Int
day12b = jsum . fromJust . AE.decodeStrict
  where
    jsum (AE.Object v)  = let es = H.elems v
                           in if any isRed (H.elems v)
                                  then 0
                                  else sum $ map jsum es
    jsum (AE.Array v)   = foldr ((+) . jsum) 0 v
    jsum (AE.Number v)  = fromJust $ toBoundedInteger v
    jsum _              = 0
    isRed (AE.String v) = v == "red"
    isRed _             = False
