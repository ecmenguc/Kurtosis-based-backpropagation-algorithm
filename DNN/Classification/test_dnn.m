function [e, y] = test_dnn(W1, W2, W3, W4, b1, b2, b3, b4, X, D, N) 
e = 0;
for k = 1:N
  x      = X(k, :)';
  d      = D(k,:)';

  v1     = W1*x+b1;
  y1     = ReLU(v1);
  
  v2     = W2*y1+b2;
  y2     = ReLU(v2);
  
  v3     = W3*y2+b3;
  y3     = ReLU(v3);
  
  v      = W4*y3+b4;
  y(:,k) = Softmax(v);
  e      = e + (d - y(:,k)).^2;
end