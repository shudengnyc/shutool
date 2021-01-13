peek = function(df, row = 4, col = 10) {
  column_range = ifelse(ncol(df) > col, col, ncol(df))
  df[c(1:row, (nrow(df) - row + 1):nrow(df)), 1:column_range]
}




