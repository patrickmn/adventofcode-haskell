module AdventofCode.Year2016.Day02 (day02a, day02b) where

import Data.List (foldl')

data Instruction = U
                 | D
                 | L
                 | R

day02a :: String -> String
day02a input = run move (parse input)

run :: (Char -> Instruction -> Char) -> [[Instruction]] -> String
run f instrs = reverse $ fst $ foldl' getCode ([], '5') instrs
  where
    getCode (ns, lst) [] = (ns, lst)
    getCode (ns, lst) is = (final : ns, final)
      where
        final = foldl' f lst is

parse :: String -> [[Instruction]]
parse s = map (map parseChar) $ lines s

parseChar :: Char -> Instruction
parseChar 'U' = U
parseChar 'D' = D
parseChar 'L' = L
parseChar 'R' = R
parseChar _   = error "parseChar: failed"

move :: Char -> Instruction -> Char
move '1' D = '4'; move '1' R = '2'
move '2' D = '5'; move '2' L = '1'; move '2' R = '3'
move '3' D = '6'; move '3' L = '2'
move '4' U = '1'; move '4' D = '7'; move '4' R = '5'
move '5' U = '2'; move '5' D = '8'; move '5' R = '6'; move '5' L = '4'
move '6' U = '3'; move '6' D = '9'; move '6' L = '5'
move '7' U = '4'; move '7' R = '8';
move '8' U = '5'; move '8' R = '9'; move '8' L = '7'
move '9' U = '6'; move '9' L = '8'
move c   _ = c

day02b :: String -> String
day02b input = run move2 (parse input)

move2 :: Char -> Instruction -> Char
move2 '1' D = '3'
move2 '2' D = '6'; move2 '2' R = '3'
move2 '3' U = '1'; move2 '3' D = '7'; move2 '3' L = '2'; move2 '3' R = '4'
move2 '4' D = '8'; move2 '4' L = '3'
move2 '5' R = '6'
move2 '6' U = '2'; move2 '6' D = 'A'; move2 '6' L = '5'; move2 '6' R = '7'
move2 '7' U = '3'; move2 '7' D = 'B'; move2 '7' L = '6'; move2 '7' R = '8'
move2 '8' U = '4'; move2 '8' D = 'C'; move2 '8' L = '7'; move2 '8' R = '9'
move2 '9' L = '8'
move2 'A' U = '6'; move2 'A' R = 'B'
move2 'B' U = '7'; move2 'B' D = 'D'; move2 'B' L = 'A'; move2 'B' R = 'C'
move2 'C' U = '8'; move2 'C' L = 'B'
move2 'D' U = 'B'
move2 c   _ = c
