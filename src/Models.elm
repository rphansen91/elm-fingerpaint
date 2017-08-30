module Models exposing (..)


type alias Model =
    { radius : Float
    , open : Bool
    , color : String
    , points : List Point
    , cursor : Position
    , drawing : Bool
    , window : ( Int, Int )
    }


type alias Point =
    { color : String
    , size : Float
    , pos : Position
    }


type alias Position =
    ( Float, Float )
