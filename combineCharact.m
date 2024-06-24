function [out] = combineCharact(in)
out(1,:)=mean(in);          % mean
temp=in.^2;
out(2,:)=mean(temp);        % mean square value
out(3,:)=sqrt(out(2,:));    % root mean square
a1=max(in(:));
a2=min(in(:));
out(4,:) = a1-a2; % peak-to-peak value
out=[out;var(in)];           % variance
out=[out;std(in)];           % standard deviation
out=[out;kurtosis(in)];      % kurtosis
out=[out;findpsd(in,30)];   %PSD
out=[out;findbp(in)];   %bandpower
end
