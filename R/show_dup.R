vec <- c("a", "b", "c","c","c") 
vec[duplicated(vec) | duplicated(vec, fromLast=TRUE)]

df <- data.frame(rbind(c("a","a"),c("b","b"),c("c","c"),c("c","c")))
df[duplicated(df) | duplicated(df, fromLast=TRUE), ]