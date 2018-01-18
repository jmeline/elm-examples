module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onMouseOver, onMouseLeave)


-- Html, Attribute, beginning program, text, div, input


main =
    beginnerProgram
        { model = model
        , view = view
        , update = update
        }


model : Model
model =
    Model False ""


type alias Model =
    { hover : Bool, text : String }


type Msg
    = Input String
    | MouseOver
    | MouseLeave


update : Msg -> Model -> Model
update msg model =
    case msg of
        Input content ->
            { model | text = String.reverse content }

        MouseOver ->
            { model | hover = True }

        MouseLeave ->
            { model | hover = False }


view : Model -> Html Msg
view model =
    div []
        [ div [ onMouseOver MouseOver, onMouseLeave MouseLeave ] [ text "hello world" ]
        , input [ placeholder "Text", onInput Input, style [ ( "text-align", "center" ) ] ] []
        , h1 [ style [ ( "color", "red" ) ] ] [ text model.text ]
        , h6 [] [ text ("State: " ++ toString (model.hover)) ]
        ]
