function [acc,al] = NMC(data,labels)

% nearest mean classifier
% acc = resubstitution accuracy
% data = array of size (Nxn) with yher data
% labels = array (Nx1) with the labels 1,2,3,...

c = max(labels); % number of classes
N = size(data,1); % number of objects (data points)
m = zeros(c,size(data,2)); % pre-set for speed of exicution

for i = 1:c
    % calculate the means for the classes
    m(i,:) = mean(data(labels == i,:),1);
end

% NMC is now trained

al = zeros(N,1); % pre-set for speed of exicution

for i = 1:N
    % classifie every point in the data set
    x = data(i,:);
    d = sum((m - repmat(x,c,1)).^2,2);
    % d contains the squared euclidien distences
    % between x and the means. d has c elements.
    [~,al(i)] = min(d); % the label for x
end

% the accuracy of NMC
acc = mean(al(:) == labels(:));

end