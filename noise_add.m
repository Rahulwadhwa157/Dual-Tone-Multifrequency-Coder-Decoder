function [xc] = noise_add(x,mu,sigma)
  

  q=size(x);
  n=q(2);
  
  noise=randn(1,n)*sigma+mu;
  xc=x+noise;

  

  
end