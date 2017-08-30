module Canvas.Easel exposing (..)

import Html exposing (..)
import Element exposing (..)
import Color exposing (..)
import Collage exposing (..)
import Color.Convert exposing (..)
import Models exposing (..)


c : ( Int, Int ) -> List Point -> Html msg
c ( w, h ) points =
    collage w h (List.map (p ( w, h )) points) |> toHtml


p : ( Int, Int ) -> Point -> Form
p win point =
    circle point.size
        |> (hex point.color |> filled)
        |> move (coords win point.pos)


hex : String -> Color
hex code =
    case (hexToColor code) of
        Ok col ->
            col

        Err _ ->
            rgb 0 0 0


coords : ( Int, Int ) -> Models.Position -> Models.Position
coords ( w, h ) ( x, y ) =
    ( x - (toFloat w / 2), (toFloat h / 2) - y )
