module View exposing (..)

import Html exposing (Html, div, input, button, ul, li, text)
import Html.Attributes exposing (placeholder, type_)
import Html.Events exposing (onClick, onInput)
import Model exposing (Model)
import Update exposing (Msg(..))

view: Model -> Html Msg
view model = 
    div[]
        [
            input [placeholder "New Task", onInput NewTaskNameInput ] [],
            button [onClick AddTask] [text "Add Task"],
            ul [] (List.map viewTask model.tasks)
        ]

viewTask: Model.Task -> Html Msg
viewTask task = 
    li []
        [
            input [type_ "checkbox", onClick (ToggleTask task.name)] [],
            text task.name,
            button [onClick (RemoveTask task.name)] [text "Remove"]
        ]