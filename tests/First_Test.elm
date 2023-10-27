module First_Test exposing (..)

import Expect
import Test exposing (..)
import Model exposing (..)
import Update exposing (update, Msg(..))

initModelTests : Test
initModelTests =
    describe "initModel"
        [ test "has an empty task list" <|
            \() ->
                Expect.equal Model.initModel.tasks []

        , test "has an empty newTaskName" <|
            \() ->
                Expect.equal Model.initModel.newTaskName ""
        ]

updateTests : Test
updateTests =
    describe "update"
        [ test "can toggle a task" <|
            \() ->
                let
                    model =
                        { initModel | tasks = [ { name = "Task 1", completed = False } ]
                        }
                    updatedModel = update (ToggleTask "Task 1") model
                in
                    Expect.equal updatedModel.tasks [{ name = "Task 1", completed = True }]

        ,test "can add a new task" <|
            \() ->
                let
                    model = Model.initModel
                    updatedModel = update AddTask model
                in
                Expect.equal updatedModel.tasks [{ name = "New Task", completed = False }]

        ,test "can remove a task" <|
            \() ->
                let
                    model =
                        { initModel | tasks = [ { name = "Task 1", completed = False }, { name = "Task 2", completed = False } ] }
                    updatedModel = update (RemoveTask "Task 1") model
                in
                Expect.equal updatedModel.tasks [{ name = "Task 2", completed = False }]

        ]
