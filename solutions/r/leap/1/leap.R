leap <- function(year) {
  year %% 4 == 0 && year && (year %% 100 != 0 || year %% 400 == 0)
}
