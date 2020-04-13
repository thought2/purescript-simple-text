let
    config = ./spago.dhall 
in
{ name = "simple-text-test"
, dependencies = [ "test-unit", "effect" ] # config.dependencies
, packages = ./packages.dhall
, sources = [ "test/**/*.purs"] # config.sources
}
