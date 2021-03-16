//
// This Stan program defines a simple model, with a
// vector of values 'y' modeled as normally distributed
// with mean 'mu' and standard deviation 'sigma'.
//
// Learn more about model development with Stan at:
//
//    http://mc-stan.org/users/interfaces/rstan.html
//    https://github.com/stan-dev/rstan/wiki/RStan-Getting-Started
//

// The input data is a vector 'y' of length 'N'.
data { 
  int<lower=0> n;           // items 
  int<lower=0> N[n];        // initial trials 
  int<lower=0> y[n];        // initial successes 
  real<lower = 0> a;        // beta param1
  real<lower = 0> b;        // beta param2
} 
parameters { 
  vector<lower=0, upper=1>[n] theta;  // chance of success (unpooled) 
} 
model { 
  y ~ binomial(N, theta);  // likelihood 
  theta ~ beta(a,b);
}

