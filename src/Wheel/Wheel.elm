module Wheel.Wheel exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Utils.ToPx exposing (..)


type alias Wheel =
    List


view : List (Html msg) -> Float -> Html msg
view wheel size =
    div [ style (absoluteCenter ++ [ ( "height", toPx size ), ( "width", toPx size ) ]) ]
        (items wheel size)


items : List (Html msg) -> Float -> List (Html msg)
items wheel size =
    (List.indexedMap (,) wheel |> List.map (item size (List.length wheel)))


item : Float -> Int -> ( Int, Html msg ) -> Html msg
item size length ( index, element ) =
    div [ style (absoluteCenter ++ [ ( "transform", (position (toFloat length) (toFloat index)) |> scalar size |> translate ) ]) ]
        [ element
        ]


translate : ( Float, Float ) -> String
translate ( x, y ) =
    "translate3d(" ++ toString x ++ "px," ++ toString y ++ "px,0)"


position : Float -> Float -> ( Float, Float )
position length index =
    let
        r =
            degrees length index |> radians
    in
        ( cos r, sin r )


degrees : Float -> Float -> Float
degrees length index =
    (360 / length) * index


radians : Float -> Float
radians deg =
    deg * (pi * 180)


scalar : Float -> ( Float, Float ) -> ( Float, Float )
scalar radius ( x, y ) =
    ( x * radius, y * radius )


absoluteCenter : List ( String, String )
absoluteCenter =
    [ ( "position", "absolute" )
    , ( "margin", "auto" )
    , ( "top", "0" )
    , ( "bottom", "0" )
    , ( "left", "0" )
    , ( "right", "0" )
    ]
