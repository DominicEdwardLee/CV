clear all
close all
clc

recObj = audiorecorder;
recTime = 2;

% --- UP ---

disp('UP.');
recordblocking(recObj, recTime);
disp('End.');
myRecording = getaudiodata(recObj);
rec1 = sound_extract_features(myRecording);

disp('UP.');
recordblocking(recObj, recTime);
disp('End.');
myRecording = getaudiodata(recObj);
rec2 = sound_extract_features(myRecording);

% --- DOWN ---

disp('DOWN.');
recordblocking(recObj, recTime);
disp('End.');
myRecording = getaudiodata(recObj);
rec3 = sound_extract_features(myRecording);

disp('DOWN.');
recordblocking(recObj, recTime);
disp('End.');
myRecording = getaudiodata(recObj);
rec4 = sound_extract_features(myRecording);

% --- LEFT ---

disp('LEFT.');
recordblocking(recObj, recTime);
disp('End.');
myRecording = getaudiodata(recObj);
rec5 = sound_extract_features(myRecording);

disp('LEFT.');
recordblocking(recObj, recTime);
disp('End.');
myRecording = getaudiodata(recObj);
rec6 = sound_extract_features(myRecording);

% --- RIGHT ---

disp('RIGHT.');
recordblocking(recObj, recTime);
disp('End.');
myRecording = getaudiodata(recObj);
rec7 = sound_extract_features(myRecording);

disp('RIGHT.');
recordblocking(recObj, recTime);
disp('End.');
myRecording = getaudiodata(recObj);
rec8 = sound_extract_features(myRecording);

save('recordings', 'rec1','rec2','rec3','rec4','rec5','rec6','rec7','rec8');