clear all
close all
clc

recObj = audiorecorder;
recTime = 1.5;

xDirec = 4;
yDirec = 4;
num = 6;

lables(1,1:50)=1;
lables(1,51:100)=2;
lables(1,101:150)=3;
lables(1,151:200)=4;

for z = 1:200
    if (z <= 50)
        disp('UP'); disp(z);
    elseif (z <= 100)
        disp('DOWN'); disp(z);
    elseif (z <= 150)
        disp('LEFT'); disp(z);
    else
        disp('RIGHT'); disp(z);
    end
    recordblocking(recObj, recTime);
    disp('End.');
    
    myRecording = getaudiodata(recObj);
    word = sound_extract_features(myRecording);
    
    spec = spectrogram(word,128,120,128);
    
    for i=1:num
        [C,I] = max(spec,[],1);
        [~,y] = max(C);
        x = I(y);
        for xClear=-xDirec:xDirec
            for yClear=-round((xDirec-sqrt(xClear^2))*yDirec):round((xDirec-sqrt(xClear^2))*yDirec)
                if ~(x+xClear<=0 || y+yClear<=0)
                    spec(x+xClear,y+yClear) = 0;
                end
            end
        end
        X(i,z) = x/size(spec,1);
        Y(i,z) = y;
    end
    
    [val,~] = min(Y(:,z));
    Y(:,z) = Y(:,z)-val;
end

save('Data', 'X', 'Y', 'lables');