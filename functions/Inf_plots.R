Inf_plots <- function(...){
  Inf_plots1(...)
  
  Inf_plots2(...)
  
  Inf_plots3(...)
}

Inf_plots1 <- function(Model, Data){
  Model %>% residuals() %>%
    DescTools::PlotQQ(main = "Q-Q-Plot (Residuals)")
  Model %>% ranef() %>% .$`site:Id` %>% pull(`(Intercept)`) %>%
    DescTools::PlotQQ(main = "Q-Q-Plot (Random Effects)")
  
}

Inf_plots2 <- function(Model, Data){
  Fitted <- Model %>% fitted()
  Residuals <- Model %>% residuals(type = "pearson")
  Residuals2 <- Model %>% residuals(type = "pearson")
  plot_data <- tibble(Fitted, Residuals, Residuals2)
  
  P1 <- ggplot(data = plot_data, aes(x=Fitted, y = Residuals)) + geom_point() + geom_hline(aes(yintercept = 0)) + ggtitle("Pearson Residuals vs. Fitted values") + geom_smooth(method = "lm")
  
  P2 <- ggplot(data = plot_data, aes(x=Residuals2)) + geom_histogram(bins = 10) + ggtitle("Residual Histogram")
  
  P1 + P2
}

Inf_plots3 <- function(Model, Data, value, transformation) {
  forModel <- fortify.merMod(Model, data = Data)
  
  ggplot(forModel, aes(do.call(transformation, list(.fitted)), {{ value }})) +
    geom_point(colour = "blue") +
    geom_abline(intercept = 0, slope = 1) +
    xlab("Fitted values") + ylab("Observed values")
}
