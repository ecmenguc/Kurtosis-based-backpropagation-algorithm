clear all
clc           
%% Spambase
% load('matlab/spambase')
% shuffle = randperm(length(spambase));% Data Shuffling
% spambase = spambase(shuffle,:);
% X = spambase(:,1:57);
% Y = spambase(:,58);
% alpha = 0.00002;
% beta = 0.999;
% class_num = 2;
% for ii=1:4601
% if Y(ii)==0
%    d(ii,1)= 1;
%    d(ii,2)= 0;
% else
%    d(ii,1)= 0;
%    d(ii,2)= 1;
% end
% end

%% biodeg
% load('matlab/biodeg')
% shuffle = randperm(length(biodeg));% Data Shuffling
% biodeg = biodeg(shuffle,:);
% X = biodeg(:,1:41);
% Y = biodeg(:,42);
% alpha = 0.00002;
% beta = 0.999;
% class_num = 2;
% 
% for ii=1:1055
% if Y(ii)==0
%    d(ii,1)= 1;
%    d(ii,2)= 0;
% else
%    d(ii,1)= 0;
%    d(ii,2)= 1;
% end
% end

%% waveform
% load('matlab/waveform')
% X = waveform(:,1:21);
% Y = waveform(:,22);
% alpha = 0.00002;
% beta = 0.999;
% class_num = 3;
% for ii=1:5000
% if Y(ii)==0
%    d(ii,1)= 1;
%    d(ii,2)= 0;
%    d(ii,3)= 0;
% elseif Y(ii)==1
%    d(ii,1)= 0;
%    d(ii,2)= 1;
%    d(ii,3)= 0;
% else
%    d(ii,1)= 0;
%    d(ii,2)= 0;
%    d(ii,3)= 1;
% end
% end

%% pageblocks
% load('matlab/pageblocks')
% X = pageblocks(:,1:10);
% Y = pageblocks(:,11);
% % shuffle = randperm(length(pageblocks));% Data Shuffling
% % pageblocks = pageblocks(shuffle,:);
% alpha = 0.00002;
% beta = 0.999;
% class_num = 5;
% for ii=1:5473
% if Y(ii)==1
%    d(ii,1)= 1;
%    d(ii,2)= 0;
%    d(ii,3)= 0;
%    d(ii,4)= 0;
%    d(ii,5)= 0;
% elseif Y(ii)==2
%    d(ii,1)= 0;
%    d(ii,2)= 1;
%    d(ii,3)= 0;
%    d(ii,4)= 0;
%    d(ii,5)= 0;
% elseif Y(ii)==3
%    d(ii,1)= 0;
%    d(ii,2)= 0;
%    d(ii,3)= 1;
%    d(ii,4)= 0;
%    d(ii,5)= 0;
% elseif Y(ii)==4
%    d(ii,1)= 0;
%    d(ii,2)= 0;
%    d(ii,3)= 0;
%    d(ii,4)= 1;
%    d(ii,5)= 0;
% else 
%    d(ii,1)= 0;
%    d(ii,2)= 0;
%    d(ii,3)= 0;
%    d(ii,4)= 0;
%    d(ii,5)= 1;
% end
% end

%% glass
load('matlab/glass')
shuffle = randperm(length(glass));% Data Shuffling
glass = glass(shuffle,:);
X = glass(:,1:9);
Y = glass(:,10);
alpha = 0.00002;
beta = 0.999;
class_num = 6;
 for ii=1:214
if Y(ii)==1
   d(ii,1)= 1;
   d(ii,2)= 0;
   d(ii,3)= 0;
   d(ii,4)= 0;
   d(ii,5)= 0;
   d(ii,6)= 0;
   % d(ii,7)= 0;
elseif Y(ii)==2
   d(ii,1)= 0;
   d(ii,2)= 1;
   d(ii,3)= 0;
   d(ii,4)= 0;
   d(ii,5)= 0;
   d(ii,6)= 0;
   % d(ii,7)= 0;
elseif Y(ii)==3
   d(ii,1)= 0;
   d(ii,2)= 0;
   d(ii,3)= 1;
   d(ii,4)= 0;
   d(ii,5)= 0;
   d(ii,6)= 0;
   % d(ii,7)= 0;
% elseif Y(ii)==4
%    d(ii,1)= 0;
%    d(ii,2)= 0;
%    d(ii,3)= 0;
%    d(ii,4)= 1;
%    d(ii,5)= 0;
%    d(ii,6)= 0;
%    d(ii,7)= 0;
elseif Y(ii)==5
   d(ii,1)= 0;
   d(ii,2)= 0;
   d(ii,3)= 0;
   d(ii,4)= 1;
   d(ii,5)= 0;
   d(ii,6)= 0;
   % d(ii,7)= 0;
 elseif Y(ii)==6
   d(ii,1)= 0;
   d(ii,2)= 0;
   d(ii,3)= 0;
   d(ii,4)= 0;
   d(ii,5)= 1;
   d(ii,6)= 0;
   % d(ii,7)= 0;
else
   d(ii,1)= 0;
   d(ii,2)= 0;
   d(ii,3)= 0;
   d(ii,4)= 0;
   d(ii,5)= 0;
   d(ii,6)= 1;
   % d(ii,7)= 1;
end
end


% x = normalize(X,"norm",Inf);%
% d = normalize(d,"norm",Inf);%
% targets = d;%
% inputs  = X;%

b=1;
a=0;



targets = a+((d-min(d))*(b-a))./(max(d)-min(d));%
inputs  = a+((X - min(X))*(b-a))./(max(X)-min(X));%





KK = floor(0.9*length(targets));% %70 training set %30 testing set
[LL ,MM] = size(inputs);




X  = inputs(1:KK,:);
D  = targets(1:KK,:);
ni = MM; %+1 
nh1 = 32;
nh2 = 32;
nh3 = 32;
no = class_num;



X_test = inputs(KK+1:LL,:);
D_test = targets(KK+1:LL,:);



max_epoch = 1000;
ensemble=2;

E1 = zeros(max_epoch, ensemble);
E2 = zeros(max_epoch, ensemble);

for ii=1:ensemble
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


N = length(D);
var_n = 0;
epoch = 0;

while 1 
   %Training
   epoch=epoch+1;
   shuffle = randperm(length(X));% Data Shuffling
   X = X(shuffle,:);
   D = D(shuffle,:);
   [W11, W12, W13, W14, b11, b12, b13, b14]               = DeepReLU_BP_online(W11, W12, W13, W14, b11, b12, b13, b14, X, D, N, alpha);
   [W21, W22, W23, W24, b21, b22, b23, b24, var_n]        = DeepReLU_KBP_online(W21, W22, W23, W24, b21, b22, b23, b24, X, D, N, 0.005*alpha, beta, var_n);
   
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
figure
plot(mean(E1'), 'b')
hold on
plot(mean(E2'), 'r')
hold on
xlabel('Epoch')
ylabel('Average of Training error')
legend('DeepBP','DeepKBP')
title('e')


figure
plot(mean(E1_test'), 'b')
hold on
plot(mean(E2_test'), 'r')
hold on
xlabel('Epoch')
ylabel('Average of Testing error')
legend('DeepBP','DeepKBP')
title('e test')

figure,
plot(D_test(:,1))
hold on
plot(y2_test(1,:),'black')

