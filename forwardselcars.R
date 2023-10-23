#################################
## FORWARD SELECTION ALGORITHM ##
#################################

# Load mtcars dataset
data(mtcars)

# Prepare data
X = as.matrix(mtcars[, -1])  # Remove the mpg column to use as predictors
y = mtcars$mpg               # Use mpg as the dependent variable
n = nrow(X)                  # Number of observations
p = ncol(X)                  # Number of predictors

# Initialize tracking variables
used = rep(FALSE, p)  # Track which predictors are used
var = rep(0, p)       # Track which predictor to add next
bestsse = rep(Inf, p) # Track the best SSE for each predictor, initialize with Inf

# Perform forward selection
for (j in 1:p) {  
  for (i in which(used == FALSE)) {
    used[i] = TRUE
    XX = X[, used, drop = FALSE]  # Select the columns that are marked as 'used'
    
    # Check for rank deficiency
    rank_X = qr(XX)$rank
    if (!is.null(rank_X) && rank_X == ncol(XX)) {
      # Calculate coefficients 'a' using normal equations
      a = solve(t(XX) %*% XX, t(XX) %*% y)
      
      # Compute the fitted values and the error
      yhat = XX %*% a
      error = y - yhat
      sse = sum(error * error)
      
      # Update the best SSE and corresponding predictor if this SSE is smaller
      if (sse < bestsse[j]) {  
        bestsse[j] = sse
        var[j] = i
      }
    }
    used[i] = FALSE  # Reset for the next iteration
  }
  used[var[j]] = TRUE  # Include the best predictor in the model
}

# Plot the best SSE values across iterations
plot(bestsse, main = "Forward Selection on mtcars", xlab = "Iteration", ylab = "SSE")



