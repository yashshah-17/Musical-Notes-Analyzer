[y,fs]=audioread('C:\Users\admin\Desktop\dsp\a4.wav');
y = y(:,1);

t=linspace(0,length(y)/fs,length(y));
Nfft=128;
f=linspace(0,fs,Nfft);
G=abs(fft(y,Nfft));
figure; plot(f(1:Nfft/2),G(1:Nfft/2))

figure;
spectrogram(y)
colormap summer
view(-45,65)
set(gca,'xlim',[0 0.05])

figure;
pwelch(y,[],[],[],fs);
set(gca,'xlim',[0 1]);

tone=y;
%find max value
[psor,lsor] = findpeaks(tone,'SortStr','descend');

notes=lsor;
 for i=1:261
  if notes(i)<500&&notes(i)>250
      Tonic=notes(i);
      break;
  end  
 end
 
 
 %normalizing notes
 while Tonic>500
      Tonic=Tonic/2;
 end
 
 while Tonic<250
     Tonic=Tonic*2;
 end
 
 %allocating notes 
 if Tonic<400&&Tonic>380
     Note='C';
 elseif Tonic>349&&Tonic<369
     Note='C#';
 elseif Tonic>329&&Tonic<344
     Note='D';
 elseif Tonic>440&&Tonic<466
     Note='D#'; 
 elseif Tonic>293&&Tonic<311
     Note='E';   
 elseif Tonic>277&&Tonic<292
     Note='F';
 elseif Tonic>261&&Tonic<277
     Note='F#';
 elseif Tonic>466&&Tonic<493
     Note='G';
 elseif Tonic>345&&Tonic<350
     Note='G#';
 elseif Tonic>415&&Tonic<440
     Note='A';
elseif Tonic>392&&Tonic<415
     Note='A#'; 
elseif Tonic>369&&Tonic<392
     Note='B';
     
     
 end