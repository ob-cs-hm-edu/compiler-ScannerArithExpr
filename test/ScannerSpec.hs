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

    -- to be replaced and continued

    it "please remove me and add a lot of meaningful test cases" $
        True `shouldBe` False
