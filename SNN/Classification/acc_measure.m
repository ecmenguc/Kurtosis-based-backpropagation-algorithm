function dogruluk = acc_measure(tahminler, etiketler)
    % tahminler: yapay sinir ağı tarafından yapılan sınıf tahminleri
    % etiketler: gerçek sınıf etiketleri
    
    % Tahminler ve etiketlerin boyutlarını kontrol et
    assert(all(size(tahminler) == size(etiketler)), 'Tahminler ve etiketlerin boyutları eşleşmiyor.');
    
    % Tahminleri sıkı bir şekilde 0 veya 1'e yuvarla
    tahminler(tahminler >= 0.5) = 1;
    tahminler(tahminler < 0.5) = 0;

    % Doğru tahmin sayısını bul
    dogru_tahminler = sum(all(tahminler == etiketler, 2));
    
    % Toplam veri sayısını bul
    toplam_veri = size(etiketler, 1);
    
    % Doğruluk oranını hesapla
    dogruluk = dogru_tahminler / toplam_veri;
end