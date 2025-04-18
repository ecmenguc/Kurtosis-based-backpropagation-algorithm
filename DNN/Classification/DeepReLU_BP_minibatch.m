function [W1, W2, W3, W4, b1, b2, b3, b4] = DeepReLU_BP_minibatch(W1, W2, W3, W4, b1, b2, b3, b4, X, D, N, alpha, bsize)
blist = 1:bsize:(N-bsize+1);

for batch = 1:length(blist)
    dW1sum = 0;
    dW2sum = 0;
    dW3sum = 0;
    dW4sum = 0;
    db1sum = 0;
    db2sum = 0;
    db3sum = 0;
    db4sum = 0;
    begin  = blist(batch);
for k = begin:begin+bsize-1
      
    x = X(k, :)';
    d = D(k, :)';

    v1 = W1*x+b1;
    y1 = ReLU(v1);
    
    v2 = W2*y1+b2;
    y2 = ReLU(v2);
    
    v3 = W3*y2+b3;
    y3 = ReLU(v3);
    
    v  = W4*y3+b4;
    y  = Softmax(v);

    
    e     = d - y;
    delta = e;

    e3     = W4'*delta;
    delta3 = (v3 > 0).*e3;
    
    e2     = W3'*delta3;
    delta2 = (v2 > 0).*e2;
    
    e1     = W2'*delta2;
    delta1 = (v1 > 0).*e1;
    
    dW4 = alpha*delta*y3';
    
    
    dW3 = alpha*delta3*y2';
    
    
    dW2 = alpha*delta2*y1';
    
    
    dW1 = alpha*delta1*x';
    

    dW1sum = dW1sum + dW1; 
    dW2sum = dW2sum + dW2; 
    dW3sum = dW3sum + dW3; 
    dW4sum = dW4sum + dW4; 
 
    db1    = alpha*delta3;
    db2   =  alpha*delta2;
    db3    = alpha*delta1;
    db4   =  alpha*delta;

    db1sum = db1sum + db1; 
    db2sum = db2sum + db2; 
    db3sum = db3sum + db3; 
    db4sum = db4sum + db4; 
end

     dW1avg = dW1sum / bsize;
     dW2avg = dW2sum / bsize;
     dW3avg = dW3sum / bsize;
     dW4avg = dW4sum / bsize;

     db1avg = db1sum / bsize;
     db2avg = db2sum / bsize;
     db3avg = db3sum / bsize;
     db4avg = db4sum / bsize;

     W1     = W1 + dW1avg;
     W2     = W2 + dW2avg;
     W3     = W3 + dW3avg;
     W4     = W4 + dW4avg;

     b1     = b1 + db1avg;
     b2     = b2 + db2avg; 
     b3     = b3 + db3avg;
     b4     = b4 + db4avg; 
end
end