function [] = PlotMusicalNotes(notes, segmentsArr, whistle)
%PLOTMUSICALNOTES converts the array of frequencies to musical notes and
%plots them in the time domain.

charNotes = {
    'DO', 'DO#', 'RE', 'MIb', 'MI', 'FA', 'FA#', 'SOL', 'LAb', 'LA', 'SIb', 'SI' ...
    'DO', 'DO#', 'RE', 'MIb', 'MI', 'FA', 'FA#', 'SOL', 'LAb', 'LA', 'SIb', 'SI' ...
    'DO', 'DO#', 'RE', 'MIb', 'MI', 'FA', 'FA#', 'SOL', 'LAb', 'LA', 'SIb', 'SI' ...
    };
notesDb = GnrtNotes();
[nSamples, nSegments] = size(segmentsArr);
Notes = zeros(nSamples, nSegments);
for iSeg = 1:nSegments
    Notes(:, iSeg) = ones(nSamples, 1) * notes(iSeg);
end
Notes = reshape(Notes, 1, []);
figure;
t = whistle.t(1:length(Notes));
plot(t, Notes, '.');
grid on
title('Song Musical Notes');
xlabel('time [s]');
ylabel('Notes');
yVals = unique(Notes(~isnan(Notes)));
yticks(yVals);
yLabels = cell(1, length(yVals));
for iNote = 1:length(yVals)
    yLabels{iNote} = charNotes{notesDb == yVals(iNote)};
end
yticklabels(yLabels);

end

