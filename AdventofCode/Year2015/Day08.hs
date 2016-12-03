module AdventofCode.Year2015.Day08 (day08a, day08b) where

day08a :: String -> Int
day08a input = length s - unescapingLength s 0
  where
    s = concat $ lines input

unescapingLength :: String -> Int -> Int
unescapingLength ('\\':'\\':xs)    acc = unescapingLength xs $! succ acc
unescapingLength ('\"':xs)         acc = unescapingLength xs acc
unescapingLength ('\\':'x':_:_:xs) acc = unescapingLength xs $! succ acc
unescapingLength (_:xs)            acc = unescapingLength xs $! succ acc
unescapingLength []                acc = acc

day08b :: String -> Int
day08b input = encodeSum - strSum
  where
    encodeSum  = sum $ map (length . show) ls
    strSum     = sum $ map length ls
    ls         = lines input
