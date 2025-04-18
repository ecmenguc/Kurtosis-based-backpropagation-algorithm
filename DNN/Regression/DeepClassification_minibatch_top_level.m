%% Mini-batch Learning
clear all
clc           
%% 
load('matlab/music')
X = video(:,[1:17,19:end]);

% images_train = x(1:55000,:)';
% images_test  = x(55001:end,:)';
d = video(:,18);
% y = (y - min(y))/(max(y) - min(y));
% y_one_hot_train = y(1:55000);
% y_one_hot_test  = y(55001:end);




class_num = 1;
alpha = 0.0005;
beta = 0.9997;


b=1;
a=0;



targets = a+((d-min(d))*(b-a))./(max(d)-min(d));%
inputs  = a+((X - min(X))*(b-a))./(max(X)-min(X));%





KK = floor(0.7*length(targets));% %70 training set %30 testing set
[LL ,MM] = size(inputs);




X  = inputs(1:KK,:);
D  = targets(1:KK,:);
ni = MM; %+1 
nh1 = 64;
nh2 = 64;
nh3 = 64;
no = class_num;



X_test = inputs(KK+1:LL,:);
D_test = targets(KK+1:LL,:);



max_epoch = 300;
ensemble=10;

E1 = zeros(max_epoch, ensemble);
E2 = zeros(max_epoch, ensemble);

for ii = 1:ensemble
    ii
W11 = 1*rand(nh1, ni) - 0.5;      % Cross entropy       
W12 = 1*rand(nh2, nh1)- 0.5;      % 
W13 = 1*rand(nh3, nh2) - 0.5;      % Cross entropy       
W14 = 1*rand(no, nh3)- 0.5;   
W21 = W11;                   % Sum of squared error
W22 = W12; 
W23 = W13;                   % Sum of squared error
W24 = W14; 
b11 = 1*rand(nh1,1) - 0.5; 
b12 = 1*rand(nh2,1) - 0.5;
b13 = 1*rand(nh3,1) - 0.5; 
b14 = 1*rand(no,1) - 0.5;
b21 = b11;
b22 = b12;
b23 = b13;
b24 = b14;

batchsize = 32;

N = length(D);
var_n = 0;
epoch = 0;

while 1 
   %Training
   epoch=epoch+1;
   shuffle = randperm(length(X));% Data Shuffling
   X = X(shuffle,:);
   D = D(shuffle,:);
   [W11, W12, W13, W14, b11, b12, b13, b14]               = DeepReLU_BP_minibatch(W11, W12, W13, W14, b11, b12, b13, b14, X, D, N, alpha, batchsize);
   [W21, W22, W23, W24, b21, b22, b23, b24, var_n]        = DeepReLU_KBP_minibatch(W21, W22, W23, W24, b21, b22, b23, b24, X, D, N, 0.005*alpha, beta, var_n, batchsize);
   
   [es1,y1]     = test_dnn(W11, W12, W13, W14, b11, b12, b13, b14, X, D, N);
   E1(epoch,ii) = 10*log10(mean(es1) / N);

   [es2,y2]     = test_dnn(W21, W22, W23, W24, b21, b22, b23, b24, X, D, N);
   E2(epoch,ii) = 10*log10(mean(es2) / N);
  

  %Testing
  [es1_test,y1_test] = test_dnn(W11, W12, W13, W14, b11, b12, b13, b14, X_test, D_test, LL-KK);
  E1_test(epoch,ii) = 10*log10(mean(es1_test) / (LL-KK));
  
  [es2_test,y2_test] = test_dnn(W21, W22, W23, W24, b21, b22, b23, b24, X_test, D_test, LL-KK);
  E2_test(epoch,ii) = 10*log10(mean(es2_test) / (LL-KK));

  
  if epoch == max_epoch
     break
  end
end
end
%% train and test curves
figure
plot(mean(E1'), 'b')
hold on
plot(mean(E2'), 'r')
hold on
xlabel('Epoch')
ylabel('Average of Training error')
legend('Conventional BP','Kurtosis-based BP')



figure
plot(mean(E1_test'), 'b')
hold on
plot(mean(E2_test'), 'r')
hold on
xlabel('Epoch')
ylabel('Average of Testing error')
legend('Conventional BP','Kurtosis-based BP')



