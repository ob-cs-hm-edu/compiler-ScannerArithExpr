{-# LANGUAGE ScopedTypeVariables #-}
module ScannerSpec (spec) where

import           Scanner    (scan)
import           Test.Hspec
import           Types

spec :: Spec
spec = do

  describe "A scanner for arithmetic expressions" $ do

    it "should scan \"+\"" $
        scan "+" `shouldBe` Just [Add]

    it "should scan \"++++\"" $
        scan "++++" `shouldBe` Just [Add, Add, Add, Add]

    it "should not scan \"Hello World!\"" $
        scan "Hello World!" `shouldBe` Nothing

    it "should scan \"-\"" $
        scan "-" `shouldBe` Just [Minus]

    it "should scan \"-+--\"" $
        scan "-+--" `shouldBe` Just [Minus, Add, Minus, Minus]

    it "should scan \"12345\"" $
        scan "12345" `shouldBe` Just [NatNum 12345]

    it "should scan \"123123*(3123/(123-(123+123)))\"" $
        scan "123123*(3123/(123-(123+123)))" `shouldBe`
          Just [ NatNum 123123, Mult, OpeningParenthesis, NatNum 3123, Div
               , OpeningParenthesis, NatNum 123, Minus, OpeningParenthesis
               , NatNum 123, Add, NatNum 123, ClosingParenthesis
               , ClosingParenthesis, ClosingParenthesis]
