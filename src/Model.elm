module Model exposing (..)

type alias Task = 
    {
        name: String, 
        completed: Bool
    }

type alias Model = 
    {
        tasks: List Task,
        newTaskName: String
    }

initModel: Model 
initModel = 
    {
        tasks = [],
        newTaskName = ""
    }