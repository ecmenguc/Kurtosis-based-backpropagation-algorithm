
function [W1, W2, b1, b2,var_n] = BackpropK_minibatch(W1, W2, b1, b2, X, D, N, alpha,beta,var_n,bsize)

blist = 1:bsize:(N-bsize+1);

for batch = 1:length(blist)
    dW1sum = 0;
    dW2sum = 0;
    db1sum = 0;
    db2sum = 0;
    begin  = blist(batch);

for k = begin:begin+bsize-1
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
    dW2 = alpha*delta*y1';
    
    dW1sum = dW1sum + dW1; 
    dW2sum = dW2sum + dW2; 
    
    db1    = alpha*delta1;
    db2    = alpha*delta;
    db1sum = db1sum + db1; 
    db2sum = db2sum + db2; 

end
     dW1avg = dW1sum / bsize;
     dW2avg = dW2sum / bsize;
     db1avg = db1sum / bsize;
     db2avg = db2sum / bsize;
     W1     = W1 + dW1avg;
     W2     = W2 + dW2avg;
     b1     = b1 + db1avg;
     b2     = b2 + db2avg; 
end
end
