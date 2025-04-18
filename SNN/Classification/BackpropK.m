
function [W1, W2, b1, b2,var_n] = BackpropK(W1, W2, b1, b2, X, D, N, alpha,beta,var_n)
for k = 1:N
    x = X(k, :)';
    d = D(k, :)';
    v1 = W1*x+b1;
    y1 = Sigmoid(v1);
    v  = W2*y1+b2;
    y  = Sigmoid(v);
    
    e     = d - y;
    var_n = beta.*var_n + e'*e;

  
    
    delta  = y.*(1-y).*e.*(3.*var_n-e'*e);

    e1     = W2'*delta;
    delta1 = y1.*(1-y1).*e1; 
    
    dW1 = alpha*delta1*x';
    W1  = W1 + dW1;
    
    dW2 = alpha*delta*y1';    
    W2  = W2 + dW2;
    
    db1 = alpha*delta1;
    db2 =  alpha*delta;
    b1  = b1 + db1;
    b2  = b2 + db2;

end
