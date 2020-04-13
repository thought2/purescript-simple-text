let
    config = ./spago.dhall 
in
{ name = "simple-text-test"
, dependencies = [ "test-unit", "effect", "psci-support" ] # config.dependencies
, packages = ./packages.dhall
, sources = [ "test/**/*.purs"] # config.sources
}
