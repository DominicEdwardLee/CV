function Label = Classifier

recObj = audiorecorder;

xDirec = 4;
yDirec = 4;
num = 6;

disp('Recording.');
recordblocking(recObj, 2);
disp('End Recording.');

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
    X(i) = x/size(spec,1);
    Y(i) = y;
end

% moving it to the bottom of the screen
[val,~] = min(Y);
Y = Y-val;

[X,I] = sort(X,2);
Y = Y(I);

[Y,I] = sort(Y,2);
X = X(I);


load('Means');
dist=zeros(4,1);
for i=1:4
   for j=1:num
       dist(i) = dist(i) + ...
           pdist([aveX(num,i),aveY(num,i);X(num),Y(num)]);
   end
end

[~,Label] = min(dist)

% switch Label
%     case 1;
%         fprintf('--- UP --- at dist of %.3f\n',distance(1));
%     case 2;
%         fprintf('--- DOWN --- at dist of %.3f\n',distance(2));
%     case 3;
%         fprintf('--- LEFT --- at dist of %.3f\n',distance(3));
%     case 4;
%         fprintf('--- RIGHT --- at dist of %.3f\n',distance(4));
% end

end
