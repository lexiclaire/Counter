module Main exposing (..)
import Html exposing (..)
import Html.App as App
import Html.Events exposing (onClick)

type alias Model =
  {count : Int
  , increment : Int
  , decrement : Int
  }

type Msg = Increment | Decrement | Reset

initialModel : Model
initialModel =
  {count = 0
  , increment = 0
  , decrement = 0
  }

update : Msg -> Model -> Model
update msg model =
  case msg of
    Increment ->
      {model
      | count = model.count + 1
      , increment = model.increment + 1
      }
    Decrement ->
    {model
    | count = model.count - 1
    , decrement = model.decrement + 1
    }
    Reset ->
      {model | count = 0}

view : Model -> Html Msg
view model =
  div[]
    [button [onClick Decrement] [text "-"]
    , div [] [text (toString model.count)]
    , button [onClick Increment] [text "+"]
    , button [onClick Reset] [text "Reset"]
    , h3 [] [text ("- clicked " ++ (toString model.decrement) ++ " times")]
    , h3 [] [text ("+ clicked " ++ (toString model.increment) ++ " times")]
    ]

main : Program Never
main =
  App.beginnerProgram
  {model = initialModel
  , view = view
  , update = update
  }
