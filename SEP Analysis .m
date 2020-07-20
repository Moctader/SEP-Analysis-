load('datasample.mat')
raw_data=data_samples.raw_data
fs=data_samples(1).Fs
Amplitude_unit=data_samples.amplitude_unit
 %%
 t=linspace(0,100,489)
 v=1000000*Amplitude_unit*raw_data;
 
 %%
 ensamble=mean(v)
 
 %%
 figure
 plot(t,v')
 hold on 
 plot(t,ensamble,'linewidth',5)
 
 N=489
 M=100
 var_sig=zeros(N,1)
for i=1:1:N
var_sig(i)=1/M*sum(((v(:,i))-ensamble(i)).^2)   
end

Avg_var=mean(var_sig)
Es=mean( ensamble.^2 )
 
% 
% variance=sum((v-ensamble).^2)./100
%  Avg_var=variance./489
% Es=(sum(ensamble.*ensamble).^2)./489
 SNR=10*log10(Es./Avg_var)
  estimate_avg_SNR=20*log10(sqrt(100))
 mean_varianc=SNR+estimate_avg_SNR+mean(Avg_var)


 %%
 x=chirp_features(data_samples)
 delay=1000*(x.fit_delay) 
 figure()
  plot(t,v')
 hold on 
 plot(t,ensamble,'linewidth',5)
 hold on
plot([delay delay],[-80 100])
hold on
plot([x.fit_first_peak_amplitude x.fit_first_peak_amplitude],[-80 100])
hold on
plot([x.fit_second_peak_amplitude x.fit_second_peak_amplitude],[-80 100]) 
hold on
plot([x.fit_first_peak_location x.fit_first_peak_location],[-80 100])
hold on
plot([x.fit_second_peak_location x.fit_second_peak_location],[-80 100]) 
 