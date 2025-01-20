photoperiod <- function(coordinates, date, tz, solarDep = 6) {
  c("dawn", "dusk") %>% 
    map(
      \(x) {
        crepuscule(
          matrix(coordinates, nrow = 1),
          as.POSIXct(date, tz = tz),
          solarDep = solarDep,
          direction = x,
          POSIXct.out = TRUE
        ) %>% 
          select(time) %>% 
          rename(!!x := time)
      }
    ) %>% 
    list_cbind() %>% 
    mutate(date = date, 
           tz = tz,
           .before = 1)
}
