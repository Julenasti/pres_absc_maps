library(ggplot2)
library(reshape2)
library(tidyverse)
library(stringr)
library(patchwork)

#' Presence-abscence dataframe for no cut area
#'
#' @param x empty
#'
#' @return random dataframe
#' @export
#'
#' @examples ind_nosiega()
ind_nosiega <- function(x) {
  points_indr <- data.frame(replicate(30, sample(0:14, 10, rep = TRUE)))
  dt_indr <- points_indr
  data_indr <- do.call(cbind, dt_indr)
  indr_melt <- melt(data_indr)
  indr_melt$Var2 <- str_extract(indr_melt$Var2, "\\d+")
  indr_melt <- indr_melt %>%
    rename(y = Var1,
           x = Var2,
           presence = value)
  return(indr_melt)
}
