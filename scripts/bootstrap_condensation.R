chunks <- 
  list(
 a = 1:500,
 b = 501:1000,
 c = 1001:1500,
 d = 1501:2000,
 e = 2001:2500,
 f = 2501:3000,
 g = 3001:3500,
 h = 3501:4000,
 i = 4001:4500,
 j = 4501:5000
)

#creating chunks of 500 (x2) Bootstraps

iwalk(chunks, \(y, idy) {
  
  bootdata <- tibble()
  
  walk(y, \(x) {
    load(sprintf("data/processed/bootstrap%04d.RData", x))
    bootdata <<- bind_rows(bootdata, bootstraps)
  }, .progress = TRUE)
  
  bootstraps <- bootdata
  save(bootstraps, file = paste0("data/processed/bootstraps", idy, ".RData"))
  
}, .progress = TRUE)

#combining the chunks into one

bootdata <- tibble()

walk(letters[1:10], \(x) {
  load(paste0("data/processed/bootstraps", x, ".RData"))
  bootdata <<- bind_rows(bootdata, bootstraps)
}, .progress = TRUE)

bootstraps <- bootdata
rm(bootdata)

bootstraps <- 
bootstraps %>%
  group_by(threshold, metric, bootstrap_id, Id) %>%
  summarize(value = mean(value, na.rm = TRUE), .groups = "drop") %>%
  group_by(threshold, metric, Id) %>%
  summarize(
    mean_bs = mean(value, na.rm = TRUE),
    lower_bs1 = quantile(value, 0.16, na.rm = TRUE),
    lower_bs2 = quantile(value, 0.05, na.rm = TRUE),
    lower_bs3 = min(value, na.rm = TRUE),
    upper_bs1 = quantile(value, 0.84, na.rm = TRUE),
    upper_bs2 = quantile(value, 0.95, na.rm = TRUE),
    upper_bs3 = max(value, na.rm = TRUE),
    .groups = "drop_last"
  )

#saving the combined bootstraps
save(bootstraps, file = "data/processed/bootstraps.RData")

