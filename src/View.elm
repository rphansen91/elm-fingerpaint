module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Msgs exposing (..)
import Models exposing (Model)
import Wheel.Wheel exposing (..)
import Utils.ToPx exposing (..)
import Canvas.Easel exposing (..)
import Mouse


view : Model -> Html Msg
view model =
    div [ class "container" ]
        [ topbar Open model
        , div [ class "canvas", Mouse.onMove Track, Mouse.onDown StartDrawing, Mouse.onUp StopDrawing, onMouseLeave Stop ]
            [ c model.window model.points ]
        , cursor model.radius model.color model.cursor
        , div [ class "picker", classList [ ( "open", model.open ) ], onClick Close ]
            [ Wheel.Wheel.view (List.map (color Select) pallet) 80
            ]
        ]


topbar : Msg -> Model -> Html Msg
topbar msg model =
    div [ class "topbar" ]
        [ div [ class "icon", id "header" ] [ text "fingerpaint" ]
        , div [ class "icon", id "pallet", style [ ( "background-color", model.color ) ], onClick msg ] []
        ]


pallet : List String
pallet =
    [ "#ff0000", "#ff7f00", "#ffff00", "#00ff00", "#0000ff", "#4B0082", "#9400D3" ]


color : (String -> Msg) -> String -> Html Msg
color msg c =
    div [ onClick (msg c), (class "color"), (style [ ( "backgroundColor", c ) ]) ] []


cursor : Float -> String -> ( Float, Float ) -> Html Msg
cursor radius color ( x, y ) =
    div [ class "cursor", style [ ( "background-color", color ), ( "height", toPx (radius * 2) ), ( "width", toPx (radius * 2) ), ( "left", toPx x ), ( "top", toPx y ) ] ] []
