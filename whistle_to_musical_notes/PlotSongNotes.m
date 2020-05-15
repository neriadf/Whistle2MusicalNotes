function [] = PlotSongNotes(audioFile, segmentTime, powerThresh)
%PLOTSONGNOTES Plots musical notes of an audio file in time domain.
%The function assumes that the audio file contains a single tone like a
%whislte, and that musicalNotesDb.mat file exists.
%It is recommended to run Whistle2MusicalNotes.m script once before using
%this function.

%% check arguments
if nargin < 2
    segmentTime = 0.13; % [sec] default value
    powerThresh = 20; % default value
elseif nargin < 3
    powerThresh = 20; % default value
end

%% generate whistle struct
[x, fs] = audioread(audioFile);
whistle = GnrtSigStruct(x, fs);

%% time separation
segmentsArr = GnrtSegments(whistle, segmentTime);

%% extract most significant frequency from each segment
notes = Segments2Notes(segmentsArr, fs, powerThresh);

%% plot musical notes in time domain
PlotMusicalNotes(notes, segmentsArr, whistle);

end

