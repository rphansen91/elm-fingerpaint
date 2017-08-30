module Main exposing (..)

import Html exposing (program)
import Msgs exposing (Msg)
import Models exposing (Model)
import Update exposing (update)
import View exposing (view)
import Window exposing (..)
import Task exposing (..)


init : ( Model, Cmd Msg )
init =
    ( Model 10 False "#ff0000" [] ( 0, 0 ) False ( 0, 0 ), windowSize )


windowSize : Cmd Msg
windowSize =
    Task.perform Msgs.Resize (map2 (,) Window.width Window.height)


subscriptions : Model -> Sub Msg
subscriptions model =
    Window.resizes (\{ width, height } -> Msgs.Resize ( width, height ))



-- MAIN


main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
