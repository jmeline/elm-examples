module Main exposing (..)

import Html exposing (Html, beginnerProgram, div, text, input)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)


myStyle =
    style
        [ ( "padding", "10px" )
        , ( "text-align", "center" )
        ]


type alias Model =
    { text : String
    , discovered : Bool
    }


model =
    Model "" False


type Msg
    = NewContent String


update : Msg -> Model -> Model
update msg model =
    case msg of
        NewContent newContent ->
            { model | text = newContent }


view : Model -> Html Msg
view model =
    div []
        [ input
            [ placeholder "Pick a number", onInput NewContent, myStyle ]
            []
        , div [ myStyle ] [ text model.text ]
        ]


main =
    beginnerProgram
        { model = model
        , view = view
        , update = update
        }
