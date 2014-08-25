
module Data.Graph.WrapperSpec where


import           Control.DeepSeq
import           Test.Hspec
import           Test.QuickCheck

import           Data.Graph.Wrapper


spec :: Spec
spec = do
  describe "fromListLenient" $ do
    it "does not crash" $ do
      property $ \ list ->
        deepseq (toList (fromListLenient list :: Graph Integer ())) True
