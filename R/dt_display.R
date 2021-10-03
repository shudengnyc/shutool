dt_display = 
  function(df, file_name = "Downloaded Report",...){
    df %>% 
      DT::datatable(
        rownames = FALSE,
        ...,
        extensions = 'Buttons',
        options = list(
          paging = TRUE,searching = TRUE,fixedColumns = TRUE,autoWidth = TRUE,ordering = TRUE,
          dom = 'ftBip', #Bfrtip
          buttons = list(
            'copy',
            list(
              extend = 'collection',
              buttons = list(extend = 'csv', filename = paste(file_name,Sys.Date())),
              text = 'Download'
            )
          )
        )
      )
  }