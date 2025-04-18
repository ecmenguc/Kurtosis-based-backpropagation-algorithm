function [e, y] = test_nn(W1, W2, b1, b2, X, D, N) 
e = 0;
for k = 1:N
    x = X(k, :)';
    d = D(k,:)';

    v1     = W1*x+b1;
    y1     = Sigmoid(v1);
    v2     = W2*y1+b2;
    y(:,k) = Sigmoid(v2);
    e      = e + (d - y(:,k)).^2;
end