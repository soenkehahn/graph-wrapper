
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

  describe "Eq Graph" $ do
    context "when the graphs are identical" $ do
      it "returns True" $ do
        let g1 = fromList [('a', 'a', ['a', 'b', 'c']), ('b', 'b', ['b', 'c']), ('c', 'c', ['a'])]
        let g2 = fromList [('a', 'a', ['a', 'b', 'c']), ('b', 'b', ['b', 'c']), ('c', 'c', ['a'])]
        g1 == g2 `shouldBe` True

    context "when the graphs are isomorphic" $ do
      it "returns False" $ do
        let g1 = fromList [('1','a',['2']), ('2','b',[])]
        let g2 = fromList [('2','a',['1']), ('1','b',[])]
        g1 == g2 `shouldBe` False

    context "when the vertices are listed in a different order" $ do
      it "returns True" $ do
        let g1 = fromList [('a', 'a', ['a', 'b', 'c']), ('b', 'b', ['b', 'c']), ('c', 'c', ['a'])]
        let g2 = fromList [('b', 'b', ['b', 'c']), ('c', 'c', ['a']), ('a', 'a', ['a', 'b', 'c'])]
        g1 == g2 `shouldBe` True

    context "when the edges are listed in a different order" $ do
      it "returns True" $ do
        let g1 = fromList [('a', 'a', ['a', 'b', 'c']), ('b', 'b', ['b', 'c']), ('c', 'c', ['a'])]
        let g2 = fromList [('a', 'a', ['b', 'c', 'a']), ('b', 'b', ['c', 'b']), ('c', 'c', ['a'])]
        g1 == g2 `shouldBe` True

    context "when the graphs are different" $ do
      it "returns False" $ do
        let g1 = fromList [('a', 'a', ['a', 'b', 'c']), ('b', 'b', ['b', 'c']), ('c', 'c', ['a'])]
        let g2 = fromList [('a', 'a', ['a', 'b', 'c']), ('b', 'b', ['b', 'a']), ('c', 'c', ['a'])]
        g1 == g2 `shouldBe` False
