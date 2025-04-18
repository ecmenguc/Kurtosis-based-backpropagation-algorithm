%% Mini-batch Learning
clear all
clc           
%% Spambase
% load('matlab/spambase')
% shuffle = randperm(length(spambase));% Data Shuffling
% spambase = spambase(shuffle,:);
% X = spambase(:,1:57);
% Y = spambase(:,58);
% alpha = 0.5;
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

%% heart statlog
load('matlab/heart_statlog')
shuffle = randperm(length(heart_statlog));% Data Shuffling
% heart_statlog = heart_statlog(shuffle,:);
X = heart_statlog(:,1:13);
Y = heart_statlog(:,14);
alpha = 0.5;
beta = 0.9985;
class_num = 2;
for ii=1:270
if Y(ii)==1
   d(ii,1)= 1;
   d(ii,2)= 0;
else
   d(ii,1)= 0;
   d(ii,2)= 1;
end
end

%% biodeg
% load('matlab/biodeg')
% shuffle = randperm(length(biodeg));% Data Shuffling
% biodeg = biodeg(shuffle,:);
% X = biodeg(:,1:41);
% Y = biodeg(:,42);
% alpha = 0.5;
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
% alpha = 0.5;
% beta = 0.9995;
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
% alpha = 0.5;
% beta = 0.9995;
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
% load('matlab/glass')
% shuffle = randperm(length(glass));% Data Shuffling
% glass = glass(shuffle,:);
% X = glass(:,1:9);
% Y = glass(:,10);
% alpha = 0.5;
% beta = 0.997;
% class_num = 6;
%  for ii=1:214
% if Y(ii)==1
%    d(ii,1)= 1;
%    d(ii,2)= 0;
%    d(ii,3)= 0;
%    d(ii,4)= 0;
%    d(ii,5)= 0;
%    d(ii,6)= 0;
%    % d(ii,7)= 0;
% elseif Y(ii)==2
%    d(ii,1)= 0;
%    d(ii,2)= 1;
%    d(ii,3)= 0;
%    d(ii,4)= 0;
%    d(ii,5)= 0;
%    d(ii,6)= 0;
%    % d(ii,7)= 0;
% elseif Y(ii)==3
%    d(ii,1)= 0;
%    d(ii,2)= 0;
%    d(ii,3)= 1;
%    d(ii,4)= 0;
%    d(ii,5)= 0;
%    d(ii,6)= 0;
%    % d(ii,7)= 0;
% % elseif Y(ii)==4
% %    d(ii,1)= 0;
% %    d(ii,2)= 0;
% %    d(ii,3)= 0;
% %    d(ii,4)= 1;
% %    d(ii,5)= 0;
% %    d(ii,6)= 0;
% %    d(ii,7)= 0;
% elseif Y(ii)==5
%    d(ii,1)= 0;
%    d(ii,2)= 0;
%    d(ii,3)= 0;
%    d(ii,4)= 1;
%    d(ii,5)= 0;
%    d(ii,6)= 0;
%    % d(ii,7)= 0;
%  elseif Y(ii)==6
%    d(ii,1)= 0;
%    d(ii,2)= 0;
%    d(ii,3)= 0;
%    d(ii,4)= 0;
%    d(ii,5)= 1;
%    d(ii,6)= 0;
%    % d(ii,7)= 0;
% else
%    d(ii,1)= 0;
%    d(ii,2)= 0;
%    d(ii,3)= 0;
%    d(ii,4)= 0;
%    d(ii,5)= 0;
%    d(ii,6)= 1;
%    % d(ii,7)= 1;
% end
% end






b=1;
a=0;



targets = a+((d-min(d))*(b-a))./(max(d)-min(d));%
inputs  = a+((X - min(X))*(b-a))./(max(X)-min(X));%





KK = floor(0.7*length(targets));% %70 training set %30 testing set
[LL ,MM] = size(inputs);




X  = inputs(1:KK,:);
D  = targets(1:KK,:);
ni = MM; %+1 
nh = 20;
no = class_num;


batch_size = 32;
X_test = inputs(KK+1:LL,:);
D_test = targets(KK+1:LL,:);



max_epoch = 1000;
ensemble = 10;

E1 = zeros(max_epoch, ensemble);
E2 = zeros(max_epoch, ensemble);

for ii=1:ensemble
    ii
W11 = 0.1*rand(nh, ni) - 0.5;      % Cross entropy       
W12 = 0.1*rand(no, nh)- 0.5;      % 
W21 = W11;                   % Sum of squared error
W22 = W12; 
b11 = 0.1*rand(nh,1) - 0.5; 
b12 = 0.1*rand(no,1) - 0.5;
b21 = b11;
b22 = b12;
p     = 0;
p1    = 0;

N = length(D);
var_n = 0;

epoch = 0;
while 1 
   %Training
   epoch=epoch+1;
   shuffle = randperm(length(X));% Data Shuffling
   X = X(shuffle,:);
   D = D(shuffle,:);
   [W11, W12, b11, b12]              = Backprop_minibatch(W11, W12, b11, b12, X, D, N, alpha,batch_size);
   [W21, W22, b21, b22,var_n]        = BackpropK_minibatch(W21, W22, b21, b22, X, D, N, 0.005*alpha,beta,var_n,batch_size);

   [es1,y1] = test_nn(W11, W12, b11, b12, X, D, N);
   E1(epoch,ii) = 10*log10(mean(es1) / N);

   [es2,y2] = test_nn(W21, W22, b21, b22, X, D, N);
   E2(epoch,ii) = 10*log10(mean(es2) / N);
  

  %Testing
  [es1_test,y1_test] = test_nn(W11, W12, b11, b12, X_test, D_test, LL-KK);
  E1_test(epoch,ii) = 10*log10(mean(es1_test) / (LL-KK));

  [es2_test,y2_test] = test_nn(W21, W22, b21, b22, X_test, D_test, LL-KK);
  E2_test(epoch,ii) = 10*log10(mean(es2_test) / (LL-KK));

  
  if epoch == max_epoch
     break
  end
end

acc1(ii) = acc_measure(y1_test',D_test);
acc2(ii) = acc_measure(y2_test',D_test);
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

%% Accuracies
acc_BP      = mean(acc1)
acc_BP_std  = std(acc1)
acc_KBP     = mean(acc2)
acc_KBP_std = std(acc2)

