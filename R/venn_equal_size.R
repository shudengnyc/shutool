
# genes <- paste("gene",1:1000,sep="")
# x <- list(
#   A = sample(genes,300),
#   # B = sample(genes,525),
#   C = sample(genes,440),
#   D = sample(genes,350)
# )



function(tgt_list){
  ggvenn::ggvenn(
    tgt_list, 
    fill_color = c("#0073C2FF", "#EFC000FF", "#868686FF", "#CD534CFF"),
    stroke_size = 0.5, set_name_size = 4
  )
}


# 
# else if (is.list(data)) {
#   if (is.null(columns)) {
#     columns <- names(data) %>% head(4)
#   }
#   a2 <- unique(unlist(data[columns]))
#   if (length(columns) == 2) {
#     d <- gen_circle_2()
#     d1 <- gen_text_pos_2() %>% mutate(n = 0, text = "")
#     stopifnot((d1 %>% count(A, B, wt = 1) %>% with(n)) == 
#                 1)
#     for (i in 1:nrow(d1)) {
#       idx <- ((!xor(d1$A[[i]], a2 %in% data[[columns[[1]]]])) & 
#                 (!xor(d1$B[[i]], a2 %in% data[[columns[[2]]]])))
#       d1$n[[i]] <- sum(idx)
#       d1$text[[i]] <- paste(a2[idx], collapse = label_sep)
#     }
#     d2 <- gen_label_pos_2()
#   }
#   else if (length(columns) == 3) {
#     d <- gen_circle_3()
#     d1 <- gen_text_pos_3() %>% mutate(n = 0, text = "")
#     stopifnot((d1 %>% count(A, B, C, wt = 1) %>% with(n)) == 
#                 1)
#     for (i in 1:nrow(d1)) {
#       idx <- ((!xor(d1$A[[i]], a2 %in% data[[columns[[1]]]])) & 
#                 (!xor(d1$B[[i]], a2 %in% data[[columns[[2]]]])) & 
#                 (!xor(d1$C[[i]], a2 %in% data[[columns[[3]]]])))
#       d1$n[[i]] <- sum(idx)
#       d1$text[[i]] <- paste(a2[idx], collapse = label_sep)
#     }
#     d2 <- gen_label_pos_3()
#   }
#   else if (length(columns) == 4) {
#     d <- gen_circle_4()
#     d1 <- gen_text_pos_4() %>% mutate(n = 0, text = "")
#     stopifnot((d1 %>% count(A, B, C, D, wt = 1) %>% 
#                  with(n)) == 1)
#     for (i in 1:nrow(d1)) {
#       idx <- ((!xor(d1$A[[i]], a2 %in% data[[columns[[1]]]])) & 
#                 (!xor(d1$B[[i]], a2 %in% data[[columns[[2]]]])) & 
#                 (!xor(d1$C[[i]], a2 %in% data[[columns[[3]]]])) & 
#                 (!xor(d1$D[[i]], a2 %in% data[[columns[[4]]]])))
#       d1$n[[i]] <- sum(idx)
#       d1$text[[i]] <- paste(a2[idx], collapse = label_sep)
#     }
#     d2 <- gen_label_pos_4()
#   }
#   else {
#     stop("list `data` or vector `column` should be length between 2 and 4")
#   }
