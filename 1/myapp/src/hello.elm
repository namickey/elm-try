import Browser
import Html exposing (Html, Attribute, button, div, input, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)

main = Browser.sandbox{init=init, update = update, view = view}

type alias Model = {
  content : String,
  some : String
  }
init : Model
init ={
  content = "init",
  some = "wao"
  }

type Msg
  = Change String
  | Some String

update : Msg -> Model -> Model
update msg model =
  case msg of
    Change newContent ->
      {model | content = newContent}
    Some newSome ->
      {model | some = newSome}

view : Model -> Html Msg
view model =
  div []
    [ input [ value model.content, onInput Change ] []
    , div [] [ text (String.reverse model.content) ]
    , input [ value model.some, onInput Some ] []
    , div [] [ text (model.some) ]
    ]
