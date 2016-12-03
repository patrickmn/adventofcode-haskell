module AdventofCode.Util where

import Control.Monad (liftM)
import Data.Char (isSpace)

getInput :: FilePath -> IO String
getInput = liftM trim . readFile

trim :: String -> String
trim = trimRight . trimLeft

trimLeft :: String -> String
trimLeft = dropWhile isSpace

trimRight :: String -> String
trimRight = reverse . trimLeft . reverse

twoOrMore :: [a] -> Bool
twoOrMore = not . null . drop 1

threeOrMore :: [a] -> Bool
threeOrMore = not . null . drop 2
