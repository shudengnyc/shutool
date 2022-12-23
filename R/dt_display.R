dt_display = 
  function(df, file_name = "Downloaded Report",...){
    df %>% 
      dplyr::mutate_if(is.numeric, signif, 3) %>%
      DT::datatable(
        rownames = FALSE,
        ...,
        extensions = 'Buttons',
        options = list(
          paging = TRUE,searching = TRUE,fixedColumns = TRUE,autoWidth = TRUE,ordering = TRUE,
          dom = 'ftBip', #Bfrtip
          buttons = list(c('csv', 'excel'))
          # buttons = list('copy',list(extend = 'collection',buttons = list(extend = 'csv', filename = paste(file_name, Sys.Date()))))
        )
      )
  }
