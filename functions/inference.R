inference_summary <- function(data,
                              formula_H1,
                              formula_H0,
                              type = lme4::glmer,
                              p_adjustment,
                              ...) {
  data %>% 
    rowwise() %>% 
    mutate(
      model = 
        list(
          (!!type)(formula_H1, data = data, ...)
        ),
      model0 = list(
        (!!type)(formula_H0, data = data, ...)
      ),
      comparison = list(anova(model0, model)),
      p.value_adj = comparison$`Pr(>Chisq)`[2] %>%
        p.adjust(method = "fdr", n = p_adjustment),
      significant = p.value_adj <= 0.05,
      summary = list(
        switch(significant+1,
               tidy(model0),
               tidy(model))),
      table = list(
        tibble(
          metric = metric,
          p.value = 
            p.value_adj %>% 
            style_pvalue() %>% 
            {ifelse(significant, paste0("**", ., "**"),.)},
          summary %>%
            mutate(estimate = estimate %>% exp) %>%
            select(term, estimate) %>%
            filter(term != "sd__(Intercept)") %>%
            mutate(term = str_remove_all(term, "\\(|\\)|site")) %>%
            pivot_wider(names_from = term, values_from = estimate)
        ) %>% 
          mutate(malaysia = if(exists("switzerland")) 1 else NA, .after = Intercept)
      )
      ) %>% 
    ungroup()
}

inference_summary2 <- function(data,
                              p_adjustment, ...) {
  data %>% 
    rowwise() %>% 
    mutate(
      model = 
        list(
            do.call(type, list(formula = formula_H1,
                                          data = data,
                               ...))
            ),
      model0 = list(
        do.call(type, list(formula = formula_H0,
                           data = data,
                           ...))
        ),
      comparison = list(anova(model0, model)),
      p.value_adj = comparison %>% tidy() %>% pull(p.value) %>% .[2] %>%
        p.adjust(method = "fdr", n = p_adjustment),
      significant = p.value_adj <= 0.05,
      summary = list(
        switch(significant+1,
               tidy(model0),
               tidy(model))),
      table = list(
        tibble(
          metric = metric,
          p.value =
            p.value_adj %>%
            style_pvalue() %>%
            {ifelse(significant, paste0("**", ., "**"),.)},
          summary %>%
            mutate(estimate = estimate) %>%
            select(term, estimate) %>%
            filter(term != "sd__(Intercept)" &
                     term != "sd__Observation") %>%
            mutate(term = str_remove_all(term, "\\(|\\)|site")) %>%
            pivot_wider(names_from = term, values_from = estimate)
        ) %>%
          mutate(malaysia = if(exists("switzerland")) 0 else NA, .after = Intercept)
    )
    ) %>%
    ungroup()
}

