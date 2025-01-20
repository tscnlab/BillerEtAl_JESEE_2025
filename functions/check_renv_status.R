#generated with a large language model
check_renv_status <- function() {
  output <- capture.output(renv::status())
  # Check for the presence of keywords indicating mismatches
  mismatched <- any(grepl("The following package(s) are out of sync", output))
  if (mismatched) {
    stop("Installed libraries do not match the renv lock file. Please run renv::restore().")
  }
}