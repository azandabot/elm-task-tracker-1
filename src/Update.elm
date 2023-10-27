module Update exposing (..)

import Model exposing (Model, Task)

type Msg = 
    NewTaskNameInput String
    | AddTask 
    | ToggleTask String
    | RemoveTask String

update: Msg -> Model -> Model 
update msg model = 
    case msg of
        NewTaskNameInput newName -> 
            { model | newTaskName = newName }

        AddTask -> 
            if String.isEmpty model.newTaskName then
                model
            else
                { model | tasks = {name = model.newTaskName, completed = False} :: model.tasks, newTaskName = "" }

        ToggleTask taskName -> 
            { model | tasks = toggleTask taskName model.tasks }

        RemoveTask taskName -> 
            { model | tasks = removeTask taskName model.tasks }

toggleTask: String -> List Task -> List Task
toggleTask name tasks = 
    List.map (\task -> if task.name == name then { task | completed = not task.completed } else task) tasks

removeTask: String -> List Task -> List Task
removeTask name tasks = 
    List.filter (\task -> task.name /= name) tasks