import Html exposing (..)
import Html.Events exposing (onClick)


-- Elm architecture
-- Model (Contains application state)

model = 0

-- View (Visual representation of state)

view model =
  div [] -- this list is the attributes of the div
    [ button [ onClick Decrement ] [ text "-" ]
    , div [] [ text (toString model) ]
    , button [ onClick Increment ] [ text "+" ]
    ]

-- Message (View generates messages, Request from the user to alter state in application)

type Message = Increment | Decrement

-- Update (interpret messages to update model)

update msg model =
  case msg of
    Increment ->
      model + 1
    Decrement ->
      model - 1

main =
  beginnerProgram
  {
     model = model
   , view = view
   , update = update
  }
