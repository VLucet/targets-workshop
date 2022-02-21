#!/bin/sh

Rscript 2_1_clean_data.R 'data/penguins.csv' 'data/penguins_clean.csv'
Rscript 2_2_fit_and_plot.R 'data/penguins_clean.csv' 'fig1.png'
