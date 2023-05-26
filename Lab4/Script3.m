load eye
approx = zeros(size(I(:,:,1)));
figure;imshow(I(:,:,1))
for counter = 1 : 100
    approx = approx + I(:, :, counter);
end
approx = approx/100;
figure
imshow(approx/max(approx(:)));

%for a single image
noise = I(:,:,1) - approx;
histogram(noise, 100);

m = mean(noise(:));
s = std(noise(:));

I2 = zeros(size(I(:,:,1)));
for counter = 1 : 100
    I2 =  I2 + I(:, :, counter) -  approx;
end
I2 = I2/(10*s);
%divide by sigma


m=mean(I(:)); %flatten I to a vector by I(:)
s = std(I(:));
figure

samples = (I(:)-m)/(s*sqrt(100^3));
histogram(samples, 100); %should be gaussian N(0,1)
