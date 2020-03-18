
foldername = 'polar_walsh';

mkdir(foldername)

pixelsize = 256;
xx = 1:pixelsize;
xx = xx-(pixelsize+1)/2;
xx = xx./max(xx);
xx = ones(pixelsize,1)*xx;
yy = xx';

rr = xx.^2+yy.^2<1;

m = 0;
p = 0;

polarwalsh = zeros(pixelsize);

for i = 1:25
    polarwalsh(:,:,i) = GeneratePolarWalsh(pixelsize,rr,m,p);
    
    if p<5
        p = p+1;
    elseif p == 5
        p = 0;
        m = m+1;
    end
    
    polarwalsh(:,:,i) = (polarwalsh(:,:,i)+1)./2;
    imwrite(polarwalsh(:,:,i),[foldername,'/polarWalsh',num2str(i),'.jpg'])
end

