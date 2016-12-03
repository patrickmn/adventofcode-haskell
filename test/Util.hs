module Util where

import Data.String (IsString)
import Test.Hspec (Spec, it, shouldBe)

shouldsBe :: (IsString a, Show a, Eq b, Show b)
          => (a -> b)
          -> [(a, b)]
          -> Spec
shouldsBe f = mapM_ (\(input, v) -> it (show input) $ f input `shouldBe` v)
