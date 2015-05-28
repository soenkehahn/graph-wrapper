
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

  describe "depthNumbering" $ do
    it "ignores non-existing given roots" $ do
      let graph :: Graph Int Int
          graph = fromListSimple $
            (1, [1]) :
            []
      toList (depthNumbering graph [-1]) `shouldBe`
        [(1, (1, Nothing), [1])]
