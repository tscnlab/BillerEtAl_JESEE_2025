#function definition to show missing and available data

implicitly_missing_summary <- function(data, 
                                       title, 
                                       epoch, 
                                       time_unit = "days") {
 
  #get some statistics on the data to compare to missing data
  data_explicit <- 
    data %>% 
    summarize(
      length_no_complete = length(Datetime),
      length_duration_complete = (length_no_complete*epoch)
    )
  
  #record the gaps in the data
  data_gaps <- data %>% 
    gap_finder(gap.data = TRUE, silent = TRUE)
  
  #gaps per group
  data_gaps_no <- 
    suppressWarnings({
      data_gaps %>% 
        group_by(Id, .drop = FALSE) %>% 
        summarise(gaps = max(gap.id), 
                  length_no = length(gap.id),
                  length_duration = (length_no*60)
        ) %>% 
        mutate(gaps = ifelse(gaps == -Inf, 0, gaps)) 
    }) %>% 
    left_join(data_explicit, by = "Id") %>% 
    mutate(length_pct = length_no/(length_no_complete+length_no))
  
  #smallest, largest, and median number of gaps per participant
  data_gaps_sum <- 
    data_gaps_no %>% 
    pivot_longer(-Id) %>% 
    group_by(name) %>% 
    summarise(
      min = min(value), max = max(value), 
      median = median(value), mean = mean(value),
      total = sum(value)
    )
  
  data_gaps_sum$total[6] <- 
    data_gaps_sum$total[4]/(data_gaps_sum$total[4]+data_gaps_sum$total[5])
  
  #show a table of gap summaries
  inject(
  data_gaps_sum %>% 
    gt(caption = !!title, 
       rowname_col = "name") %>% 
    fmt_percent(rows = "length_pct", decimals = 1) %>% 
    fmt_number(rows = c("gaps", "length_no", "length_no_complete"), 
               decimals = 0) %>%
    fmt_duration(rows = c("length_duration", "length_duration_complete"), 
                 input_units = "seconds", 
                 output_units = time_unit,
                 duration_style = "wide"
    ) %>% 
    gt::text_case_match(
      .locations = gt::cells_stub(),
      "gaps" ~ "Number of gaps",
      "length_duration" ~ "Duration missed by available data points",
      "length_duration_complete" ~ "Duration covered by available data points",
      "length_no" ~ "Number of missing data points",
      "length_no_complete" ~ "Number of available data points",
      "length_pct" ~ "Percentage of missing data points"
    ) %>% 
    gt::tab_footnote(paste("min, max, median, mean, and total values for", 
                           nrow(data_gaps_no), "participants"))
  )
}