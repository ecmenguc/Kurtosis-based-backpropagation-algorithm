clear all
clc           
% X = [ 0 0;
%       0 1;
%       1 0;
%       1 1;
%  0 0;
%       0 1;
%       1 0;
%       1 1;
%  0 0;
%       0 1;
%     ];
% 
% Y = [ 0
%       1
%       1
%       0
% 0
%       1
%       1
%       0
% 0
%       1
%     ];

%% BatteryRUL
% load('matlab/BatteryRUL')
% X=BatteryRUL(:,2:8);
% Y=BatteryRUL(:,9);


%% carbig
load carbig.mat
X = [Acceleration Cylinders Displacement Weight Horsepower];
Y = MPG;
R = rmmissing([X Y]);
X = R(:,1:end-1);
Y = R(:,end);


%% fifa 2018
% load('matlab/X')
% load('matlab/Y')


%% Music
% load('matlab/music')
% X = video(:,[1:17,19:end]);
% Y = video(:,18);

%% Blog
% load('matlab/X_blog')
% load('matlab/Y_blog')

%% SuperCond
% load('matlab/supercond')
% X = supercond(:,1:81);
% Y = supercond(:,82);

%% Boston
% load('matlab/boston')
% X = boston(:,1:13);
% Y = boston(:,14);


%% Winequalityred
% load('matlab/winequalityred')
% X = winequalityred(:,1:11);
% Y = winequalityred(:,12);



b=1;
a=0;
eps=10^(-5);


targets = a+((Y-min(Y))*(b-a))/(max(Y)-min(Y)+eps);%
inputs  = a+((X - min(X))*(b-a))./(max(X)-min(X)+eps);%



KK = floor(0.7*length(targets));% %70 training set %30 testing set
[LL ,MM] = size(inputs);




X  = inputs(1:KK,:);
D  = targets(1:KK);
ni = MM; %+1 
nh = 32;
no = 1;



X_test = inputs(KK+1:LL,:);
D_test = targets(KK+1:LL);



max_epoch = 2000;
ensemble=1;

E1 = zeros(max_epoch, ensemble);
E2 = zeros(max_epoch, ensemble);

for ii=1:ensemble
    ii
W11 = 1*rand(nh, ni) - 0.5;      % Cross entropy       
W12 = 1*rand(no, nh)- 0.5;      % 
W21 = W11;                   % Sum of squared error
W22 = W12; 
b11 = 1*rand(nh,1) - 0.5; 
b12 = 1*rand(no,1) - 0.5;
b21 = b11;
b22 = b12;
alpha = 0.1;
mu    = 0.1;
p     = 0;
p1    = 0;

N = length(D);
Pup = 0.30;
qinv=qfuncinv(Pup/2);
var_n=0;
beta = 0.9;
epoch = 0;
while 1 
   %Training
   epoch=epoch+1;
   shuffle = randperm(length(X));% Data Shuffling
   X = X(shuffle,:);
   D = D(shuffle);
   
   [W11, W12, b11, b12]              = Backprop(W11, W12, b11, b12, X, D, N, alpha);
   [W21, W22, b21, b22,kk,var_n]     = BackpropOC(W21, W22, b21, b22, X, D, N, alpha,beta,qinv,var_n);

   [es1,y1]     = test_nn(W11, W12, b11, b12, X, D, N);
   E1(epoch,ii) = 10*log10(es1 / N);

   [es2,y2]     = test_nn(W21, W22, b21, b22, X, D, N);
   E2(epoch,ii) = 10*log10(es2 / N);
  
  %Testing
  [es1_test,y1_test] = test_nn(W11, W12, b11, b12, X_test, D_test, LL-KK);
  E1_test(epoch,ii)  = 10*log10(es1_test / (LL-KK));

  [es2_test,y2_test] = test_nn(W21, W22, b21, b22, X_test, D_test, LL-KK);
  E2_test(epoch,ii)  = 10*log10(es2_test / (LL-KK));
  Pup_iter(epoch,ii) = KK-kk;
  var_n              = Pup*var_n;
  
  if epoch == max_epoch
     break
  end
end
end
figure
plot(mean(E1'), 'b')
hold on
plot(mean(E2'), 'r')
hold on
xlabel('Epoch')
ylabel('Average of Training error')
legend('BP','BP-OC')
title('e')


figure
plot(mean(E1_test'), 'b')
hold on
plot(mean(E2_test'), 'r')
hold on
xlabel('Epoch')
ylabel('Average of Testing error')
legend('BP','BP-OC')
title('e test')

% figure,
% plot(D_test)
% hold on
% plot(y2_test,'black')
estPup=mean((mean(Pup_iter)/KK)*100)
