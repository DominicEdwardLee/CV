clear all
close all
clc

load('Data.mat')

% nearest mean classifier
% data = array of size (Nxn) with N being the recording and
%    n beint the data
% labels = array (Nx1) with the labels 1,2,3,...

c = max(lables); % number of classes
aveX = zeros(size(X,1),c); % pre-set for speed of exicution
aveY = zeros(size(Y,1),c);

for i = 1:c
    % calculate the means for the classes
    %m(i,:) = mean(Y(labels == i,:),1);
    
    [X,I] = sort(X,1);
    for j = 1:size(X,2)
        Y(:,j) = Y(I(:,j),j);
    end
    
    [Y,I] = sort(Y,1);
    for j = 1:size(Y,2)
        X(:,j) = X(I(:,j),j);
    end
    
    aveX(:,i) = mean(X(:,lables==i),2);
    aveY(:,i) = mean(Y(:,lables==i),2);
end

for i=1:c
    figure
    plot(aveX(:,i),aveY(:,i),'rx')
    axis([0 1 0 200])
    axis square
end

save('Means', 'aveX', 'aveY');