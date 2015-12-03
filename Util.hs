module Util where

import Data.Char (isSpace)

trimLeft :: String -> String
trimLeft = dropWhile isSpace

trimRight :: String -> String
trimRight = reverse . trimLeft . reverse

trim :: String -> String
trim = trimRight . trimLeft
