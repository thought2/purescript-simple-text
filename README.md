# purescript-simple-text

```purescript
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
  # print
```

```
Let me tell a story...

Have you eaten the `Apple`, yet?
No, I've eaten the `Bannana`.
OK.
```
