module Update exposing (..)

import Msgs exposing (Msg(..))
import Models exposing (..)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Toggle ->
            if (model.open) then
                ( { model | open = False }, Cmd.none )
            else
                ( { model | open = True }, Cmd.none )

        Open ->
            ( { model | open = True }, Cmd.none )

        Close ->
            ( { model | open = False }, Cmd.none )

        Select color ->
            ( { model | color = color, open = False }, Cmd.none )

        Resize window ->
            ( { model | window = window }, Cmd.none )

        Track { clientPos } ->
            if (model.drawing) then
                let
                    points =
                        addPoint model clientPos
                in
                    ( { model | points = points, cursor = clientPos }, Cmd.none )
            else
                ( { model | cursor = clientPos }, Cmd.none )

        StartDrawing { clientPos } ->
            let
                points =
                    addPoint model clientPos
            in
                ( { model | points = points, drawing = True }, Cmd.none )

        StopDrawing _ ->
            ( { model | drawing = False }, Cmd.none )

        Stop ->
            ( { model | drawing = False }, Cmd.none )


addPoint : Model -> Position -> List Point
addPoint model pos =
    model.points ++ [ (Point model.color model.radius pos) ]
