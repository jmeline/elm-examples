module Hello exposing (..)

import Html exposing (text)

main =
  text (toString (addOne 9))

-- Anonymous functions
-- \x -> x + 1

-- Named functions
addOne : Int -> Int
addOne x =
  x + 1
