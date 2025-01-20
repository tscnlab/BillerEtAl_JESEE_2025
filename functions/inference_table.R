#function for a boxplot
boxplot_function <- function(datanumber, data, value) {
  purrr::map(datanumber, \(x) {
    data$data[[x]] %>% 
      ggplot(aes(x = site, y = {{ value }}, fill = site)) +
      geom_boxplot() + 
      theme_void() +
      theme(
        # axis.text.x = element_text(),
        legend.position = "none"
      )+
      scale_fill_jco() + 
      coord_flip() 
    
  })
}

Inference_Table <- function(data, p_adjustment, value) {
  gt_table <- 
  data$table %>% 
    list_rbind() %>% 
    # replace_na(list(switzerland = 1)) %>% 
    gt(rowname_col = "metric") %>% 
    fmt_markdown(columns = "p.value") %>% 
    sub_missing() %>% 
    tab_footnote(
      paste("p-values are adjusted for multiple comparisons using the false-discovery-rate for n=", p_adjustment, "comparisons"),
      locations = cells_column_labels(columns = "p.value")
    ) %>% 
    tab_spanner(
      label = md("Site coefficients"),
      columns = c(malaysia, switzerland)
    ) %>% 
    tab_style(
      style = cell_text(weight = "bold"),
      locations = list(cells_column_labels(), cells_stub(), cells_column_spanners())
    )
  gt_table %>% 
    cols_add(Plot = 1:nrow(data)) %>% 
    text_transform(locations = cells_body(Plot),
                   fn = \(x) {
                       gt::ggplot_image(
                         boxplot_function(as.numeric(x),data, {{ value }}),
                         height = gt::px(100)
                         )
                   }) %>% 
    tab_style(
      style = cell_text(color = pal_jco()(1)),
      locations = cells_column_labels(c(malaysia))
    ) %>% 
    tab_style(
      style = cell_text(color = pal_jco()(2)[2]),
      locations = cells_column_labels(c(switzerland))
    ) %>% 
    cols_label(
      p.value = "p-value",
      malaysia = "Malaysia",
      switzerland = "Switzerland",
      Plot = ""
    )
  
}
