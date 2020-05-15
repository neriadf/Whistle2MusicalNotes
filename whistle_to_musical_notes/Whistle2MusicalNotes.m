%% This script contains all the steps required to convert a whistle audio
%file to musical notes and plot it in time domain.

%% add sub folders to path
addpath('audio', 'auxFun');

%% convert audio to WAV
ToWav('Melody.m4a');

%% read Excel file and save Musical Notes DataBase as .mat
musicNotesDb = xlsread('music_notes_db.xlsx');
save('musicNotesDb.mat', 'musicNotesDb');

%% generate whistle struct
[x, fs] = audioread('Melody.WAV');
whistle = GnrtSigStruct(x, fs);

%% {OPTIONAL}: plot whistle spectrum
PlotSpec(whistle.f(1:floor(whistle.N/2)), whistle.X(1:floor(whistle.N/2), 1));

%% time separation
segmentTime = 0.13; % [sec] CAN BE ADJUSTED BY THE USER
segmentsArr = GnrtSegments(whistle, segmentTime);

%% {OPTIONAL}: generate segment struct for plotting
segNum = 5; % CAN BE EDITED BY USER
segment = GnrtSigStruct(segmentsArr(:, segNum), fs);

%% {OPTIONAL}: plot segment spectrum
PlotSpec(segment.f(1:floor(segment.N/2)), segment.X(1:floor(segment.N/2), 1));

%% extract most significant frequency from each segment
powerThresh = 20; % CAN BE ADJUSTED BY USER
notes = Segments2Notes(segmentsArr, fs, powerThresh);

%% plot musical notes in time domain
PlotMusicalNotes(notes, segmentsArr, whistle);

