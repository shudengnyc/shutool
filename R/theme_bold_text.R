shu_theme = function() {
  theme(
    legend.text  = element_text(size = 30),
    axis.text.x  = element_text(size = 30),
    axis.text.y  = element_text(size = 30),
    plot.title   = element_text(size = 40, face = "bold"),
    axis.text    = element_text(size = 30),
    axis.title   = element_text(size = 30, face = "bold")
  ) + guides(color = guide_legend(override.aes = list(size = 2)))
  
}