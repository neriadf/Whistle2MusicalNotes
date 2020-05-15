function [segmentsArr] = GnrtSegments(whistle, segmentTime)
%GNRTSEGMENTS divides the time signal to equal intervals, 
%each interval has segmentTime length. segmentTime is given in [sec].

segmentsArr = whistle.x(:, 1);
samplesInSegment = floor(segmentTime / whistle.dt);
N = length(segmentsArr) - mod(length(segmentsArr), samplesInSegment);
segmentsArr = reshape(segmentsArr(1:N), samplesInSegment, []);

end

