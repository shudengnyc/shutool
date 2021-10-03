calc_pca_var = function(pca_obj){
  eigs = (pca_obj$sdev)^2
  rbind(
    SD = sqrt(eigs),
    Proportion = eigs/sum(eigs),
    Cumulative = cumsum(eigs)/sum(eigs)) 
}