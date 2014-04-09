function vel = computeVelEngbert(pos,timestamp)

% for va patient exp. 
% according to Otero-millan 2014 JOV paper: 
% samplingrate ~= 1000hz, thus, avg neighboring 6 samples
% vi: [pos(i+3)+pos(i+2)+pos(i+1)+pos(i-1)+pos(i-2)+pos(i-3)]/12t 

numSamples = length(pos); 
vel = zeros(numSamples,1); 
for ss = (1+3):numSamples-3 % sample by sample 
    
    distance = (pos(ss+3)+pos(ss+2)+pos(ss+1)+pos(ss-1)+pos(ss-2)+pos(ss-3));
    
    deltaTime = mean(diff(timestamp(ss-3:ss+3)));  % avg deltaTIme
    
    vel(ss) = distance/(12*deltaTime); 

end


end