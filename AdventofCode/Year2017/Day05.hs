module AdventofCode.Year2017.Day05 (day05a, day05b) where

import Control.Monad (forM_)
import Control.Monad.Primitive (PrimMonad, PrimState)
import Control.Monad.ST (runST)
import qualified Data.Vector.Unboxed.Mutable as VUM

day05a :: String -> Int
day05a input = runST $ parse input >>= \v -> go v False 0 0

parse :: PrimMonad m => String -> m (VUM.MVector (PrimState m) Int)
parse input = do
    let parsed = map read $ lines input
    v <- VUM.new $ length parsed
    forM_ (zip [0..] parsed) $ uncurry (VUM.write v)
    return v

go :: PrimMonad m => VUM.MVector (PrimState m) Int -> Bool -> Int -> Int -> m Int
go v strange i n
    | i >= VUM.length v = return n
    | otherwise         = do
          x <- VUM.read v i
          let nx = if strange && x >= 3 then pred x else succ x
          VUM.write v i nx
          go v strange (i + x) (succ n)

day05b :: String -> Int
day05b input = runST $ parse input >>= \v -> go v True 0 0
