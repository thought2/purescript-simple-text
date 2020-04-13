module Test.Main where

import Prelude
import Effect (Effect)
import Test.SimpleText as Test.SimpleText
import Test.Unit.Main (runTest)

main :: Effect Unit
main =
  runTest
    Test.SimpleText.testSuite
