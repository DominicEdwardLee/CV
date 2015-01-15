clear all
close all
clc

% up    : 4,4,6
% down  :
% left  : 4,4,6
% right :

xDirec = 4;
yDirec = 4;
num = 6;

load('recordings.mat')
rec(1,1:size(rec1,1)) = rec1;
rec(2,1:size(rec2,1)) = rec2;
rec(3,1:size(rec3,1)) = rec3;
rec(4,1:size(rec4,1)) = rec4;
rec(5,1:size(rec5,1)) = rec5;
rec(6,1:size(rec6,1)) = rec6;
rec(7,1:size(rec7,1)) = rec7;
rec(8,1:size(rec8,1)) = rec8;

for j=1:8
    
    word = rec(j,:);
%     figure
%     spectrogram(word,128,120,128);
%     axis square
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
        X(i,j) = x/size(spec,1);
        Y(i,j) = y;
    end
    
    [val,~] = min(Y(:,j));
    Y(:,j) = Y(:,j)-val;
    
    figure
    hold on
    plot(X(:,j),Y(:,j),'kx')
    axis([0 1 0 200])
    axis square
    
end

[X,I] = sort(X,1);
for j = 1:8
    Y(:,j) = Y(I(:,j),j);
end

[Y,I] = sort(Y,1);
for j = 1:8
    X(:,j) = X(I(:,j),j);
end

aveX = mean(X,2);
aveY = mean(Y,2);

figure
plot(aveX,aveY,'rx')
axis([0 1 0 200])
axis square

