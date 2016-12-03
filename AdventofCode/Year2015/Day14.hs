module AdventofCode.Year2015.Day14 (day14a, day14b) where

day14a :: String -> Int
day14a = maximum . map (dist 2503 . parse . words) . lines

dist :: Int -> (Int, Int, Int) -> Int
dist end (speed, dur, rest) = go 0 0
  where
    go elapsed d
        | elapsed >= end       = d
        | elapsed + dur >= end = d + (speed * (elapsed + dur - end))
        | otherwise            = go (elapsed + dur + rest) $! (d + (speed * dur))

parse :: [String] -> (Int, Int, Int)
parse [_, "can", "fly", speed, "km/s", "for", dur, "seconds,", "but", "then", "must", "rest", "for", rest, "seconds."] =
    (read speed, read dur, read rest)
parse _ = error "no parse"

day14b :: String -> Int
day14b = undefined
