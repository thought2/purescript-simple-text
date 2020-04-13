module Test.SimpleText where

import Prelude
import Data.String as String
import SimpleText (SimpleText(..))
import SimpleText as SimpleText
import Test.Unit (TestSuite)
import Test.Unit as Test
import Test.Unit.Assert (shouldEqual)

example :: SimpleText
example =
  Paragraphs
    [ Ellipsis (Text "Let me tell a story")
    , Lines
        [ Question
            ( Items
                [ Texts [ Text "Have you eaten the", Backtick (Text "Apple") ]
                , Text "yet"
                ]
            )
        , Sentence (Texts [ Text "No, I've eaten the", Backtick (Text "Bannana") ])
        , Sentence (Text "OK")
        ]
    ]

exampleResult :: String
exampleResult =
  String.joinWith "\n"
    [ "Let me tell a story..."
    , ""
    , "Have you eaten the `Apple`, yet?"
    , "No, I've eaten the `Bannana`."
    , "OK."
    ]

testSuiteExample :: TestSuite
testSuiteExample =
  Test.test "example" do
    SimpleText.print example `shouldEqual` exampleResult

testSuiteSimpleText :: TestSuite
testSuiteSimpleText = do
  Test.suite "SimpleText" do
    Test.test "Text" do
      SimpleText.print (Text "Foo Bar")
        `shouldEqual`
          "Foo Bar"
    Test.test "Texts" do
      SimpleText.print (Texts [ Text "Foo1 Bar1", Text "Foo2 Bar2" ])
        `shouldEqual`
          "Foo1 Bar1 Foo2 Bar2"
    Test.test "Items" do
      SimpleText.print (Items [ Text "Foo1 Bar1", Text "Foo2 Bar2", Text "Foo3 Bar3" ])
        `shouldEqual`
          "Foo1 Bar1, Foo2 Bar2, Foo3 Bar3"
    Test.test "Sentence" do
      SimpleText.print (Sentence (Text "Foo Bar"))
        `shouldEqual`
          "Foo Bar."
    Test.test "Question" do
      SimpleText.print (Question (Text "Foo Bar"))
        `shouldEqual`
          "Foo Bar?"
    Test.test "Ellipsis" do
      SimpleText.print (Ellipsis (Text "Foo Bar"))
        `shouldEqual`
          "Foo Bar..."
    Test.test "Lines" do
      SimpleText.print (Lines [ Text "Foo1 Bar1", Text "Foo2 Bar2", Text "Foo3 Bar3" ])
        `shouldEqual`
          ( String.joinWith "\n"
              [ "Foo1 Bar1"
              , "Foo2 Bar2"
              , "Foo3 Bar3"
              ]
          )
    Test.test "Parentheses" do
      SimpleText.print (Parentheses (Text "Foo Bar"))
        `shouldEqual`
          "(Foo Bar)"
    Test.test "Backtick" do
      SimpleText.print (Backtick (Text "Foo Bar"))
        `shouldEqual`
          "`Foo Bar`"
    Test.test "Paragraphs" do
      SimpleText.print (Paragraphs [ Text "Foo1 Bar1", Text "Foo2 Bar2", Text "Foo3 Bar3" ])
        `shouldEqual`
          ( String.joinWith "\n\n"
              [ "Foo1 Bar1"
              , "Foo2 Bar2"
              , "Foo3 Bar3"
              ]
          )
    Test.test "Word" do
      SimpleText.print (Word [ Text "Foo", Text "Bar", Text "Baz" ])
        `shouldEqual`
          "FooBarBaz"

testSuite :: TestSuite
testSuite =
  Test.suite "SimpleText" do
    testSuiteSimpleText
    testSuiteExample
