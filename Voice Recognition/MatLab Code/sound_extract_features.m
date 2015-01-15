function a = sound_extract_features(y)

zzz = smooth(abs(y-mean(y)),round(numel(y)/100));
zzz = smooth(zzz,round(numel(y)/100));

zzz(1:1000) = 0;
cutoff_index1 = find(zzz > 0.15 * max(zzz));

a = y(cutoff_index1(1):cutoff_index1(end)); % cut off the tails

end