module Main where

import Prelude

import Data.Argonaut.Decode (class DecodeJson)
import Debug (spy)
import Effect (Effect)
import Effect.Aff (Aff, launchAff_)
import Effect.Class.Console (logShow)
import Generated.Gql.Schema.Admin (Query)
import Generated.Gql.Schema.Admin.Enum.Colour (Colour(..))
import Generated.Gql.Symbols (colour, widgets)
import GraphQL.Client.Alias ((:))
import GraphQL.Client.Args ((=>>))
import GraphQL.Client.Operation (OpQuery)
import GraphQL.Client.Query (query_)
import GraphQL.Client.ToGqlString (toGqlQueryString)
import GraphQL.Client.Types (class GqlQuery)
import GraphQL.Client.Variable (Var(..))
import GraphQL.Client.Variables (getVarsJson, getVarsTypeNames, withVars)
import Type.Data.List (Nil')
import Type.Proxy (Proxy(..))

main :: Effect Unit
main =
  launchAff_ do
    { red_widgets, widgets } <-
      queryGql "widgets"
        $
          { red_widgets: widgets : { colour: Var :: _ "colourVar" Colour } =>> { colour }
          , widgets: { ids: Var :: _ "ids" (Array Int) } =>> { id: unit }
          }
            `withVars`
              { colourVar: RED
              , ids: [ 1, 2 ]
              }
    -- Will log [ RED ] as there is one red widget
    logShow $ map _.colour red_widgets

    logShow widgets

  where
  queryStr = spy "query vars" $ getVarsTypeNames $
    { red_widgets: widgets : { colour: Var :: _ "colourVar" Colour } =>> { colour }
    , widgets: { ids: Var :: _ "ids" (Array Int) } =>> { id: unit }
    }
      `withVars`
        { colourVar: RED
        , ids: [ 1, 2 ]
        }

-- Run gql query
queryGql
  :: forall query returns
   . GqlQuery Nil' OpQuery Query query returns
  => DecodeJson returns
  => String
  -> query
  -> Aff returns
queryGql = query_ "http://localhost:4000/graphql" (Proxy :: Proxy Query)
