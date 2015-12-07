module AdventofCode.Day07 (day07a, day07b) where

import Data.Bits ((.&.), (.|.), shiftL, shiftR, complement)
import Data.Function.Memoize (memoize)
import Data.Word (Word16)
import Text.Read (readMaybe)
import qualified Data.HashMap.Strict as H

type Circuit = H.HashMap String Op

data Op = Wire `And`    Wire
        | Wire `Or`     Wire
        | Wire `Lshift` Wire
        | Wire `Rshift` Wire
        | Not  Wire
        | NoOp Wire

parseOp :: [String] -> (String, Op)
parseOp [x, "AND",    y, "->", w] = (w, newWire x `And`    newWire y)
parseOp [x, "OR",     y, "->", w] = (w, newWire x `Or`     newWire y)
parseOp [x, "LSHIFT", y, "->", w] = (w, newWire x `Lshift` newWire y)
parseOp [x, "RSHIFT", y, "->", w] = (w, newWire x `Rshift` newWire y)
parseOp ["NOT",       x, "->", w] = (w, Not  $ newWire x)
parseOp [x,              "->", w] = (w, NoOp $ newWire x)
parseOp _                         = error "no parseOp"

data Wire = Ident String
          | Value Word16

newWire :: String -> Wire
newWire s = case readMaybe s of
    Nothing -> Ident s
    Just n  -> Value n

applyWire :: Circuit -> String -> Word16
applyWire c = mf
  where
    mf                = memoize f
    f s               = case c H.! s of
        (x `And`    y) -> get x .&. get y
        (x `Or`     y) -> get x .|. get y
        (x `Lshift` y) -> get x `shiftL` fromIntegral (get y)
        (x `Rshift` y) -> get x `shiftR` fromIntegral (get y)
        (Not  x)       -> complement $ get x
        (NoOp x)       -> get x
    get (Ident ident) = mf ident
    get (Value val)   = val

day07a :: String -> Word16
day07a input = applyWire c "a"
  where
    c = H.fromList $ map (parseOp . words) (lines input)

day07b :: String -> Word16
day07b input = applyWire nc "a"
  where
    nc   = H.insert "b" (NoOp $ Value bega) c
    bega = applyWire c "a"
    c    = H.fromList $ map (parseOp . words) (lines input)
