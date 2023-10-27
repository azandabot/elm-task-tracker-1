module Test.Generated.Main exposing (main)

import First_Test

import Test.Reporter.Reporter exposing (Report(..))
import Console.Text exposing (UseColor(..))
import Test.Runner.Node
import Test

main : Test.Runner.Node.TestProgram
main =
    Test.Runner.Node.run
        { runs = 100
        , report = ConsoleReport UseColor
        , seed = 355906675894960
        , processes = 4
        , globs =
            []
        , paths =
            [ "/Users/macbookair/azandabot/elm-task-tracker-1/tests/First_Test.elm"
            ]
        }
        [ ( "First_Test"
          , [ Test.Runner.Node.check First_Test.initModelTests
            , Test.Runner.Node.check First_Test.updateTests
            ]
          )
        ]