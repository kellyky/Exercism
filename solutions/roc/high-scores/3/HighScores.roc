module [latest, personalBest, personalTopThree]

Score : U64

latest : List Score -> Result Score _
latest = \scores -> List.last scores

personalBest : List Score -> Result Score _
personalBest = \scores -> List.max scores
    
personalTopThree : List Score -> List Score
personalTopThree = \scores ->
    scores 
    |> List.sortDesc
    |> List.takeFirst 3