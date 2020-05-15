function [notes] = Segments2Notes(segmentsArr, fs, powerThresh)
%SEGMENTS2NOTES extracts most significant frequency from each segment, and
%rounds it to the nearest musical note frequency. The function ignores
%frequencies with power below powerThresh.

notesDb = GnrtNotes();
[nSamples, nSegments] = size(segmentsArr);
notes = zeros(nSegments, 1);
for iSeg = 1:nSegments
    segment = GnrtSigStruct(segmentsArr(:, iSeg), fs);
    power = abs(segment.X(1:floor(nSamples/2))).^2;
    if max(power) > powerThresh
        freq = segment.f(power == max(power));
        if freq > notesDb(1)
            notes(iSeg) = notesDb(abs(notesDb - freq) == min(abs(notesDb - freq)));
        else
            notes(iSeg) = NaN;
        end
    else
        notes(iSeg) = NaN;
    end
end

end

