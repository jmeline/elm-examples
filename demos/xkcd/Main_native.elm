module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (src)
import Html.Events exposing (..)
import Http
import Json.Decode exposing (..)


-- import Json.Decode.Pipeline exposing (..)

import Random


type alias Model =
    { topic : String
    , err : String
    , comicUrl : String
    , comic : Comic
    }


type alias Comic =
    { title : String
    , img : String
    }


initComic =
    Comic "" ""


init : ( Model, Cmd Msg )
init =
    ( Model
        "XKCD"
        ""
        ""
        initComic
    , getRandomComic
    )


getRandomComic : Cmd Msg
getRandomComic =
    Random.generate GetComic (Random.int 1 1935)


getXKCDComic : String -> Cmd Msg
getXKCDComic url =
    let
        request =
            Http.get url comicDecoder
    in
        Http.send ComicResp request


comicDecoder : Decoder Comic
comicDecoder =
    map2 Comic
        (field "title" string)
        (field "img" string)


type Msg
    = GetComic Int
    | ComicResp (Result Http.Error Comic)
    | NewComic


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NewComic ->
            ( model, getRandomComic )

        GetComic comic ->
            let
                comicUrl =
                    "https://xkcd.com/" ++ (toString comic) ++ "/info.0.json"

                url =
                    "https://jsonp.afeld.me/?url=" ++ comicUrl
            in
                ( { model | comicUrl = comicUrl }, getXKCDComic url )

        ComicResp (Ok newComic) ->
            ( { model | comic = newComic }, Cmd.none )

        ComicResp (Err err) ->
            ( { model | err = toString err }, Cmd.none )



-- views --


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick NewComic ] [ text "new comic" ]
        , h2 [] [ text model.comic.title ]
        , br [] []
        , img [ src model.comic.img ] []
        ]


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , update = update
        , view = view
        , subscriptions = always Sub.none
        }
