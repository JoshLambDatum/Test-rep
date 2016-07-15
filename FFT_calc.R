#Copy data and run to create FFT
#change sps as needed

sps = 4;

data_table = read.delim("clipboard",sep = "\t", header = FALSE,na.strings = "NA", skipNul= TRUE); #transposed table in clipboard
data = melt(data_table,na.rm = TRUE);

samples = length(data[,2]);

fft_data = fft(data[,2]);
FFT_data_mag = sqrt(Re(fft_data)^2+Im(fft_data)^2)*2/(samples);
axis_freq = seq(0,sps,sps/(samples));
plot(axis_freq[2:(samples/2)],
     FFT_data_mag[2:(samples/2)],
     type="l",
     xaxp = c(0, sps/2, 20),
     main="FFT",
     xlab="Frequency (Hz)", 
     ylab="magnitude");