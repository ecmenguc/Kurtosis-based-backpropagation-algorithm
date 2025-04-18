% Veri kümesini yükle
data = readtable('letter-recognition.csv');

% Özellikler ve etiketler arasında ayır
features = table2array(data(:, 2:end));
labels = table2cell(data(:, 1));

% Etiketleri karakter dizisi formatına dönüştür
labels = cellfun(@char, labels, 'UniformOutput', false);

% Etiketleri 26 bitlik vektörlere dönüştür
num_labels = size(labels, 1);
output = zeros(num_labels, 26);
for i = 1:num_labels
    label_index = double(labels{i}) - 64; % 'A' harfi için 1, 'B' harfi için 2, ...
    output(i, label_index) = 1; % İlgili harfin sınıfını 1 olarak işaretler
end

% Eğitim ve test setlerini böl
cv = cvpartition(output,'HoldOut',0.2);
idxTrain = training(cv); 
idxTest = test(cv);

XTrain = features(idxTrain,:);
YTrain = output(idxTrain,:);
XTest = features(idxTest,:);
YTest = output(idxTest,:);

% SVM modelini eğit
SVMModel = fitcsvm(XTrain,YTrain);

% Test verilerini kullanarak modelin doğruluğunu değerlendir
[label,score] = predict(SVMModel,XTest);
correctPredictions = sum(all(label == YTest, 2));
accuracy = correctPredictions / size(YTest, 1);
fprintf('Doğruluk: %.2f%%\n', accuracy * 100);