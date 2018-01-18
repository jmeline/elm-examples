import Html exposing (text)

type alias Point =
  { x : Float
  , y : Float
  }

main =
  let
      point1 = {x = 1, y = 2}
      point2 = {x = 5, y = 10}
  in
      distanceBetween point1 point2
      |> toString
      |> text

distanceBetween : Point -> Point -> Float
distanceBetween p1 p2 =
  ((p1.x - p2.x) ^ 2 + (p1.y - p2.y) ^ 2) ^ 0.5

