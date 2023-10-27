module Main exposing (..)

import Browser
import Model exposing (Model, initModel)
import Update exposing (..)
import View exposing (view)

main : Program () Model Msg
main = 
    Browser.sandbox { init = initModel, update = update, view = view }