library(ggplot2)
library(reshape2)
library(tidyverse)
library(stringr)
library(patchwork)


#' Presence-abscence dataframe for cut area
#'
#' @param x empty
#'
#' @return random dataframe
#' @export
#'
#' @examples ind_siega
ind_siega <- function(x) {
  points_ind <- data.frame(replicate(30, sample(0:11, 10, rep = TRUE)))
  dt_ind <- points_ind
  data_ind <- do.call(cbind, dt_ind)
  ind_melt <- melt(data_ind)
  ind_melt$Var2 <- str_extract(ind_melt$Var2, "\\d+")
  ind_melt <- ind_melt %>%
    rename(y = Var1,
           x = Var2,
           presence = value)
  return(ind_melt)
}
