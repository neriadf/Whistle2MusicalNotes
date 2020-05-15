function [notes] = GnrtNotes()
%GNRTNOTES Summary of this function goes here
%   Detailed explanation goes here

FREQ_LOW_THRESH = 500;  % [Hz]
FREQ_HIGH_THRESH = 4000; % [Hz]
load('musicNotesDb.mat', 'musicNotesDb');
notes = musicNotesDb(:, 1);
notes = notes(notes > FREQ_LOW_THRESH);
notes = notes(notes < FREQ_HIGH_THRESH);

end

