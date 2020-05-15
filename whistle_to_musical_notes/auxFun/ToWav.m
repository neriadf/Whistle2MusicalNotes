function [] = ToWav(audio)
%TOWAV converts "audio" file to .WAV extension and saves it in audio folder.

audioName = audio(1:strfind(audio,'.')-1);
[data, fs] = audioread(audio);
audiowrite(fullfile('audio', [audioName '.WAV']), data, fs);

end

