data {
  int<lower=1> N;
  vector[N] x; // Rainfall in cm
  vector[N] y; // Income in k$
  int<lower = 0> k; // degrees of freedom
}

parameters {
  real alpha;          // k$
  real beta;           // k$ / cm
  real<lower=0> sigma; // k$
}

model {
  alpha ~ student_t(k, 0, 1);
  beta ~ student_t(k, 0, 1);
  sigma ~ cauchy(0, 1);
  y ~ normal(beta * x + alpha, sigma);
}
