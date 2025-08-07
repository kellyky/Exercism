raindrops <- function(number) {
  drops <- ''

  if (number %% 3 == 0) {
    drops<-paste0(drops, 'Pling')
  }

  if (number %% 5 == 0) {
    drops<-paste0(drops, 'Plang')
  }

  if (number %% 7 == 0) {
    drops<-paste0(drops, 'Plong')
  }

  if (drops == ''){
    drops <- paste0(drops, number) 
  }

  drops
}
