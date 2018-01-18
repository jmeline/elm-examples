module Hello exposing (..)

import Html exposing (..)


type alias User =
    { name : String, age : Maybe Int }


canBuyOverWatch : User -> Bool
canBuyOverWatch user =
    case user.age of
        Nothing ->
            False

        Just age ->
            age >= 21


displayUser : User -> String
displayUser user =
    "name: " ++ (.name user) ++ ", Can by Overwatch? " ++ (toString (canBuyOverWatch user))


jack =
    User "Jack" Nothing


jim =
    User "Jim" (Just 25)


main =
    div []
        [ div [] [ text (displayUser jack) ]
        , div [] [ text (displayUser jim) ]
        ]
