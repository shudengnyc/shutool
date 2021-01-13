peek = function(df, row = 5, col = 10) {
  column_range = ifelse(ncol(df) > col, col, ncol(df))
  df[c(1:row, (nrow(df) - row):nrow(df)), 1:column_range]
}



