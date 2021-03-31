# df should be long format
# tgt_var : column name of interest 
hist_plot = function(df, tgt_var, nbreaks = 15, nbin =  30) {
  tgt_var = deparse(substitute(tgt_var))
  tgt_var_med = round(median(pull(df, tgt_var), na.rm = TRUE), 3)
  ggplot(df) +
    geom_histogram(aes(x = get(tgt_var)),
                   color = "black" ,
                   fill  = "white",
                   bins  = nbin) +
    scale_x_continuous(breaks = scales::pretty_breaks(n = nbreaks)) +
    geom_vline(xintercept = tgt_var_med,
               colour     = "red",
               linetype   = "twodash") +
    annotate("text",
              label = paste0(" \n \n Median : ", tgt_var_med),
              x = tgt_var_med,
              y = Inf
              ) +
    labs(x = tgt_var) +
    theme_bw()
}


# hist_plot(mtcars,mpg, 10)
# ... %>% hist_plot(., Columname)



