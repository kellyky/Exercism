module [colorCode, colors]

resistorColors : Dict Str U64
resistorColors =
    Dict.empty {}
        |> Dict.insert "black" 0
        |> Dict.insert "brown" 1
        |> Dict.insert "red" 2
        |> Dict.insert "orange" 3
        |> Dict.insert "yellow" 4
        |> Dict.insert "green" 5
        |> Dict.insert "blue" 6
        |> Dict.insert "violet" 7
        |> Dict.insert "grey" 8
        |> Dict.insert "white" 9

colorCode : Str -> Result U64 _
colorCode = \color ->
    Dict.get resistorColors color

colors : List Str
colors = Dict.keys resistorColors