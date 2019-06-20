data{
  int N;         // number of voters
  int vote[N];   // vote: 0 (Clinton), 1 (Bush)
  int income[N]; // 1-5 income scale
}
parameters{
  real alpha;    // intercept
  real beta;     // income coefficient
}
model{
  for (n in 1:N){
     // vote[n] ~ bernoulli_logit(alpha + income[n] * beta);
     // target += bernoulli_lpmf(vote[n] | inv_logit(alpha + income[n] * beta));
     target += bernoulli_logit_lpmf(vote[n] | alpha + income[n] * beta);
  }
  
  alpha ~ normal(0, 10); // intercept weakly-inf prior
  beta ~ normal(0, 2.5); // income weakly-inf prior
}
