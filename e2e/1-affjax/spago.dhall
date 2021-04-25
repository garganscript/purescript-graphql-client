{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "my-project"
, dependencies =
  [ "aff"
  , "aff-promise"
  , "affjax"
  , "argonaut-codecs"
  , "argonaut-core"
  , "arrays"
  , "bifunctors"
  , "console"
  , "control"
  , "datetime"
  , "effect"
  , "either"
  , "enums"
  , "foldable-traversable"
  , "foreign"
  , "foreign-generic"
  , "foreign-object"
  , "functions"
  , "halogen-subscriptions"
  , "heterogeneous"
  , "http-methods"
  , "integers"
  , "lists"
  , "maybe"
  , "media-types"
  , "newtype"
  , "nullable"
  , "numbers"
  , "ordered-collections"
  , "parsing"
  , "prelude"
  , "psci-support"
  , "quickcheck"
  , "record"
  , "spec"
  , "spec-discovery"
  , "string-parsers"
  , "strings"
  , "strings-extra"
  , "transformers"
  , "tuples"
  , "type-equality"
  , "typelevel"
  , "unicode"
  , "unsafe-coerce"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs", "../../src/**/*.purs" ]
}
