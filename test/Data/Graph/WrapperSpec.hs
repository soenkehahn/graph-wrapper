
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

  describe "reachableVertices" $ do
    context "when the vertex is not in the given graph" $ do
      it "returns the empty list" $ do
        reachableVertices (fromList [] :: Graph Integer ()) 0
          `shouldBe` []
