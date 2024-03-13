# Initialization

set.seed (1)
m <- 20000
n <-  5000
A <- matrix (runif (m*n),m,n)

# Matrix multiply
MM <- system.time (B <- crossprod(A))

# Cholesky Factorization
Chol <- system.time (C <- chol(B))

# Singular Value Deomposition
SVD <- system.time (S <- svd (A,nu=0,nv=0))

# Principal Components Analysis
PCA <- system.time (P <- prcomp(A))

# Linear Discriminant Analysis
library('MASS')
g <- 5
k <- round (m/2)
A <- data.frame (A, fac=sample (LETTERS[1:g],m,replace=TRUE))
train <- sample(1:m, k)
LDA <- system.time (L <- lda(fac ~., data=A, prior=rep(1,g)/g, subset=train))

output <- rbind(MM, Chol, SVD, PCA, LDA)
# get the number of cpus
cpus <- as.numeric(Sys.getenv("SLURM_CPUS_PER_TASK"))

write.table(output, file =paste0("time_",cpus,".txt"), quote = F, sep=",")

