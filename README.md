# Forward Selection in R

## Overview

This repository contains an R script demonstrating the Forward Selection algorithm for feature selection. The script utilizes the built-in `mtcars` dataset in R, but can be adapted for any dataset.

### Data Preparation

- The `mtcars` dataset is loaded, and the `mpg` column is used as the dependent variable (`y`).
- The rest of the columns serve as predictors and are stored in a matrix `X`.

### Forward Selection Algorithm

- The algorithm starts with an empty model and iteratively adds the predictor that has the smallest sum of squared errors (SSE).
- The SSE for each model is stored for later analysis.

### Plot

- The SSE for each iteration is plotted, providing a view of how model complexity affects performance.

## Future Work

- Implement backward elimination and stepwise selection methods.
- Add performance evaluation metrics (e.g., R-squared, AIC, BIC).




