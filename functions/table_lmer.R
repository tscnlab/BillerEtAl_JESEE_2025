table_lmer <- function(model){
  table <- 
  model %>% 
    tbl_regression(intercept = TRUE, 
                   # tidy_fun = broom.mixed::tidy, 
                   add_estimate_to_reference_rows = TRUE,
                   exponentiate = TRUE,
                   label = list(
                     # `site:Id.sd__(Intercept)` ~ 
                                  # "SD RE participant",
                                # `Residual.sd__Observation` ~ "SD Residual",
                                `(Intercept)` ~ "Intercept"),
                   
                   ) %>% 
    bold_labels() %>% 
    italicize_levels()
  
  p_val_col<-which(names(table$table_body)=="p.value")
  gtsummary::modify_table_body(table, `[`, -p_val_col)
}