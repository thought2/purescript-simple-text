module SimpleText where

import Prelude
import Data.String as String

data SimpleText
  = Text String
  | Texts (Array SimpleText)
  | Items (Array SimpleText)
  | Sentence SimpleText
  | Question SimpleText
  | Ellipsis SimpleText
  | Lines (Array SimpleText)
  | Parentheses SimpleText
  | Backtick SimpleText
  | Paragraphs (Array SimpleText)
  | Word (Array SimpleText)

print :: SimpleText -> String
print = case _ of
  Text x -> x
  Texts xs ->
    xs <#> print
      # String.joinWith " "
  Items xs ->
    xs
      <#> print
      # String.joinWith ", "
  Sentence x -> print x <> "."
  Question x -> print x <> "?"
  Ellipsis x -> print x <> "..."
  Lines xs ->
    xs
      <#> print
      # String.joinWith "\n"
  Parentheses x -> "(" <> print x <> ")"
  Backtick x -> "`" <> print x <> "`"
  Paragraphs xs ->
    xs
      <#> print
      # String.joinWith "\n\n"
  Word xs ->
    xs
      <#> print
      # String.joinWith ""
