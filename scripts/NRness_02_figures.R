## READ IN DATA ####
source('scripts/NRness_01_cleaning.R')

## LOAD PACKAGES ####
library(ggplot2)

## ORGANIZE DATA ####
data_figs = data_clean

## SET THEME ####
my_theme = theme(
  axis.title.x = element_text(size = 30),
  axis.text.x = element_text(size = 26),
  axis.title.y = element_text(size = 30),
  axis.text.y = element_text(size = 26),
  title = element_text(size = 32, color = "gray20"))

## MAKE FIGURES ####
## BOX PLOT ####

box.plot = ggplot(data_figs, aes(x = condition, y = rating)) +
  geom_boxplot(fill="dodgerblue") +
  scale_x_discrete(labels=c("cd1","cd2","cd3","cd4")) +
  my_theme
box.plot

pdf('figures/boxplot.pdf')
box.plot
dev.off()

## BOX PLOT Z_TRANS####
box.plot_ztrans = ggplot(data_figs, aes(x = condition, y = NormScore)) +
  geom_boxplot(fill="dodgerblue") +
  scale_x_discrete(labels=c("cd1","cd2","cd3","cd4")) +
  my_theme
box.plot_ztrans

pdf('figures/boxplot_ztrans.pdf')
box.plot_ztrans
dev.off()

## HISTOGRAMS FOR 4 CONDITIONS ####
cd1_hg.plot = ggplot(cd1, aes(x = rating)) +
  geom_histogram(fill="dodgerblue") +
  labs(title="cd1", x="cd1-ass_+n ratings", y="count") +
#   labs(title="Histogram cd1", x="cd1 ratings", y="count") +
  ylim(c(0,125)) + my_theme

pdf("figures/cd1_hg.pdf")
cd1_hg.plot
dev.off()

cd2_hg.plot = ggplot(cd2, aes(x = rating)) +
  geom_histogram(fill="dodgerblue") +
  labs(title="cd2", x="cd2-ass_-n ratings", y="count") +
  # labs(title="Histogram cd2", x="cd2 ratings", y="count") +
  ylim(c(0,125)) + my_theme

pdf("figures/cd2_hg.pdf")
cd2_hg.plot
dev.off()

cd3_hg.plot = ggplot(cd3, aes(x = rating)) +
  geom_histogram(fill="dodgerblue") +
  labs(title="cd3", x="cd3-com_+n ratings", y="count") +
  # labs(title="Histogram cd3", x="cd3 ratings", y="count") +
  ylim(c(0,125)) + my_theme

pdf("figures/cd3_hg.pdf")
cd3_hg.plot
dev.off()

cd4_hg.plot = ggplot(cd4, aes(x = rating)) +
  geom_histogram(fill="dodgerblue") +
  labs(title="cd4", x="cd4-com_-n ratings", y="count") +
  # labs(title="Histogram cd4", x="cd4 ratings", y="count") +
  ylim(c(0,125)) + my_theme

pdf("figures/cd4_hg.pdf")
cd4_hg.plot
dev.off()

## HISTOGRAMS FOR Z-TRANSFORMS CONDITIONS ####
cd1_ztrans_hg.plot = ggplot(cd1, aes(x = NormScore)) +
  geom_histogram(fill="dodgerblue") +
  labs(title="Histogram cd1", x="cd1-ass_+n ratings_ztrans", y="count") +
  ylim(c(0,125)) + my_theme

pdf("figures/cd1_ztrans_hg.pdf")
cd1_ztrans_hg.plot
dev.off()

cd2_ztrans_hg.plot = ggplot(cd2, aes(x = NormScore)) +
  geom_histogram(fill="dodgerblue") +
  labs(title="Histogram cd2", x="cd2-ass_-n ratings_ztrans", y="count") +
  ylim(c(0,125)) + my_theme

pdf("figures/cd2_ztrans_hg.pdf")
cd2_ztrans_hg.plot
dev.off()

cd3_ztrans_hg.plot = ggplot(cd3, aes(x = NormScore)) +
  geom_histogram(fill="dodgerblue") +
  labs(title="Histogram cd3", x="cd3-com_+n ratings_ztrans", y="count") +
  ylim(c(0,125)) + my_theme

pdf("figures/cd3_ztrans_hg.pdf")
cd3_ztrans_hg.plot
dev.off()

cd4_ztrans_hg.plot = ggplot(cd4, aes(x = NormScore)) +
  geom_histogram(fill="dodgerblue") +
  labs(title="Histogram cd4", x="cd4-com_-n ratings_ztrans", y="count") +
  ylim(c(0,125)) + my_theme

pdf("figures/cd4_ztrans_hg.pdf")
cd4_ztrans_hg.plot
dev.off()
