# selected_samples = fread("../sample_data/color_tbl_1_df.csv") %>% 
#   mutate(codedSiteID = as.factor(codedSiteID ))
# 
# # Generate Table 1 like Summary Table 
# selected_samples_gt = 
#   selected_samples %>% 
#   select(-pid) %>% 
#   tbl_summary(by = "PlateID",
#               statistic = list(all_continuous() ~ "{mean} ({sd})",
#                                all_categorical() ~ "{n}",
#                                N_Samples ~ "{sum}",
#                                Gender ~ "{n} ({p}%)")   ) %>% 
#   add_overall()%>% 
#   as_flex_table() %>% 
#   flextable::theme_zebra() %>%   # Optional theme 
#   align(align = "center") 
# 
# ## Extract some info to setup heatmap 
# ### Get Unique codedSiteID
# site_id  = selected_samples$codedSiteID %>% unique() %>% as.character()
# ### Get Unique randomGroupCode
# group_id = selected_samples$randomGroupCode %>% unique() %>% as.character()
# ### Get data need to add color from gt object 
# data_range = selected_samples_gt$body$dataset %>% filter(label %in% c(site_id,group_id)) %>% select(starts_with("stat"),-stat_0) %>% mutate_all(as.numeric)
# ### Setup a function that map each columns value to heatmap color 
# setup_hm_color = 
#   function(col_name, n_color = 8 ) {
#     col_name_data = data_range[[col_name]]
#     rev(heat.colors(n_color))[cut(col_name_data, n_color)]
#   }
# 
# ## Color the table
# for (k in 1:ncol(data_range)) {
#   tgt_col_name = paste0("stat_", k)
#   selected_samples_gt = selected_samples_gt %>%
#     bg(
#       i = ~ label %in% c(site_id, group_id) ,
#       j = tgt_col_name  ,
#       bg = setup_hm_color(tgt_col_name)
#     )
# }
# 
# # Display the table 
# selected_samples_gt
# 
# #### 