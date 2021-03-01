volcano_plot = function(df_raw_target){
  targeted_df =
    df_raw_target %>%
    filter(Targeted == 1) %>%
    select(Name, hr.1, p.1,fdr.1,fdr.2) %>%
    mutate(sig = ifelse(fdr.1 < 0.05 & fdr.2 < 0.05, "Mod 1&2 Significant",
                 ifelse(fdr.2 < 0.05,"Mod.2 Significant",
                 ifelse(fdr.1 < 0.05,"Mod.1 Significant", "Not Significant"))))
  
  fdr_line <- targeted_df %>% filter(fdr.1 < 0.05) %>% pull(p.1) %>% max()
  
targeted_df %>%
    arrange(desc(sig),desc(p.1)) %>%
    ggplot(aes(x=hr.1 , y=-log10(p.1), color = sig)) +
    geom_point(size = rel(4)) +
    geom_hline(yintercept = -log10(fdr_line),color = '#C7C7C7', size = 1 , alpha = 0.8) +
    geom_text(x=2.0, y=2.2, label="P = 0.0117 | P(fdr) = 0.05",color = '#C7C7C7' , alpha = 0.8) +
    scale_color_manual(
      name = "Legend",
      values = c("#B07AA1", '#1f77b4', '#D62728', '#C7C7C7'),
      breaks = c("Mod 1&2 Significant","Mod.1 Significant","Mod.2 Significant"),
      labels = c(
        "FDR < 0.05 in model 1 and 2",
        "FDR < 0.05 in model 1 only",
        "FDR < 0.05 in model 2 only"
      )
    ) +
    theme_minimal() +
    scale_y_continuous(breaks = scales::pretty_breaks(n = 20)) + # ,limits = c(0, 18)
    scale_x_continuous(breaks = scales::pretty_breaks(n = 10)) + # ,limits = c(0.5, 3.1)
    theme(panel.grid.major = element_blank()) +
    theme(
      legend.position = c(.75, .35),
      legend.background  = element_rect(colour = "transparent", fill = "transparent"),
      axis.text=element_text(size=rel(2)),
      axis.title=element_text(size=rel(1.5),face="bold"),
      legend.text=element_text(size=rel(1.7))
    ) +
    labs(x = "Hazards ratio", y = "-log10(P)") +
    guides(colour = guide_legend(override.aes = list(shape = 15, size = 6))) +
    # geom_text_repel(data = filter(targeted_df, fdr.1 <= 9.427710e-07), 
    #                 size = 8,
    #                 aes(label = Name)) +
    coord_cartesian(clip = "off")
}

# df_raw_target = readxl::read_excel("/Volumes/Shu/Other/ZsuZsu\ Volcano/JHS_Volcano\ Plot_12.21.2020.xlsx")
# volcano_plot(df_raw_target)
