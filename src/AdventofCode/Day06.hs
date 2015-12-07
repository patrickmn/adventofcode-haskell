module AdventofCode.Day06 (day06a, day06b) where

import Control.Monad (forM_, foldM)
import Control.Monad.ST (runST)
import Data.List.Split (splitOn)
import qualified Data.Vector.Unboxed.Mutable as VUM

data Action = TurnOn [Int]
            | TurnOff [Int]
            | Toggle [Int]

getAction :: Int -> String -> Action
getAction skip s = case words s of
    ["turn", "on", xy, "through", oxy]  -> TurnOn $ getIndices skip (parseCoords xy) (parseCoords oxy)
    ["turn", "off", xy, "through", oxy] -> TurnOff $ getIndices skip (parseCoords xy) (parseCoords oxy)
    ["toggle", xy, "through", oxy]      -> Toggle $ getIndices skip (parseCoords xy) (parseCoords oxy)
    _                                   -> error "getAction: no parse"

getIndices :: Int -> (Int, Int) -> (Int, Int) -> [Int]
getIndices skip (x, y) (ox, oy) =
    concatMap ((\beg -> [beg+y..beg+oy]) . (* skip)) [x..ox]

parseCoords :: String -> (Int, Int)
parseCoords s = (read x, read y)
  where
    [x, y] = splitOn "," s

day06a :: String -> Int
day06a input = runST $ do
    let vlen = skip * 1000
        skip = 1000
    v <- VUM.replicate vlen False
    let actions = map (getAction skip) (lines input)
    forM_ actions $ \act -> case act of
        TurnOn  is -> mapM_ (\i -> VUM.write v i True) is
        TurnOff is -> mapM_ (\i -> VUM.write v i False) is
        Toggle  is -> mapM_ (VUM.modify v not) is
    let count acc i = VUM.read v i
                      >>= \on -> return $ if on then succ acc else acc
    foldM count 0 [0..vlen-1]

day06b :: String -> Int
day06b input = runST $ do
    let vlen = skip * 1000
        skip = 1000
    v <- VUM.replicate vlen 0
    let actions = map (getAction skip) (lines input)
    forM_ actions $ \act -> case act of
        TurnOn  is -> mapM_ (VUM.modify v (+1)) is
        TurnOff is -> mapM_ (VUM.modify v (\n -> max 0 (n-1))) is
        Toggle  is -> mapM_ (VUM.modify v (+2)) is
    let count acc i = VUM.read v i >>= \n -> return (acc + n)
    foldM count 0 [0..vlen-1]
