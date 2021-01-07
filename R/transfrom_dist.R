transform_dist = function(df,nbreaks = 20){
  df %>% 
    pivot_longer(-1) %>% 
    select(-1) %>% 
    group_by_at(1) %>% 
    summarise(
      ID = unique(name),
      `raw value`         = sparkline::spk_chr(hist(value                                           ,plot=FALSE, breaks = nbreaks)$counts, type="bar"),
      `log(value)`        = sparkline::spk_chr(hist(log(value - min(value,na.rm = TRUE) + 1)        ,plot=FALSE, breaks = nbreaks)$counts, type="bar"),
      `scale(value)`      = sparkline::spk_chr(hist(scale(value)                                    ,plot=FALSE, breaks = nbreaks)$counts, type="bar"),
      `scale(log(value))` = sparkline::spk_chr(hist(scale(log(value - min(value,na.rm = TRUE) + 1)) ,plot=FALSE, breaks = nbreaks)$counts, type="bar"), 
      .groups = 'drop'
    ) %>% 
    select(-name) %>% 
    ungroup() %>% 
    DT::datatable(
      escape = FALSE,
      options = list(fnDrawCallback = htmlwidgets::JS('function(){HTMLWidgets.staticRender();}'))) %>%
    sparkline::spk_add_deps() 
}