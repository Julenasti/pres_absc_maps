library(ggplot2)
library(reshape2)
library(tidyverse)
library(stringr)
library(patchwork)

lab_y <- rep(1:10)
lab_x <- c("1i", "1c", "1d", "2i", "2c", "2d", "3i", "3c", "3d", "4i", "4c", "4d", "5i", "5c", "5d", "6i", "6c", "6d", "7i", "7c", "7d", "8i", "8c", "8d", "9i", "9c", "9d", "10i", "10c", "10d")

#' Presence-abscence ggplot for no cut area
#'
#' @param dat dataframe created with ind_nosiega()
#'
#' @return ggplot de ind_nosiega()
#' @export
#'
#' @examples gg_nosiega(dat = ind_nosiega1)
gg_nosiega <- function(dat) {
  ggplot(data = dat, aes(x = x, y = as.numeric(y))) +
    geom_point(aes(color = presence > 13)) +
    scale_x_discrete(labels = lab_x) +
    scale_y_continuous(labels = lab_y, breaks = lab_y) +
    scale_color_discrete(name = "", labels = c("Ausencia", "Presencia")) +
    geom_vline(xintercept = c(3.5, 6.5, 9.5, 12.5, 15.5, 18.5, 21.5, 24.5, 27.5),
               color = "black", alpha = 0.4, linetype = "solid", size = 0.5) +
    geom_hline(yintercept = c(1.5, 2.5, 3.5, 4.5, 5.5, 6.5, 7.5, 8.5, 9.5),
               color = "black", alpha = 0.4, linetype = "solid", size = 0.5) +
    theme(
      legend.position = "right",
      legend.text = element_text(size = 10),
      axis.text = element_text(colour = "black", size = 10),
      axis.title = element_blank(),
      panel.grid.major = element_line(size = 0.25, linetype = 'solid',
                                      colour = "white")
    )
}
