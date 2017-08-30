module Msgs exposing (..)

import Mouse


type Msg
    = Toggle
    | Open
    | Close
    | Select String
    | Resize ( Int, Int )
    | Track Mouse.Event
    | StartDrawing Mouse.Event
    | StopDrawing Mouse.Event
    | Stop
