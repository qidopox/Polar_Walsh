function polarwalsh_ = GeneratePolarWalsh(pupilactuator,actuatormask,m,p)

polarwalsh_ = zeros(pupilactuator);


Middle = (pupilactuator/2) + 0.5;

for i = 1:pupilactuator
    for ii = 1:pupilactuator
        
        if actuatormask(i,ii) ~= 0
            polarwalsh_(i,ii) = 1;
            
polarwalsh_(i,ii) = PolarWalshradial(m,i,ii,Middle);

            
if p == 0
    polarwalsh_(i,ii) = polarwalsh_(i,ii)*PolarWalshAngular(p,i,ii,Middle);
else
            if rem(log(p)/log(2),1)==0
        
polarwalsh_(i,ii) = polarwalsh_(i,ii)*PolarWalshAngular(p,i,ii,Middle);
            elseif 2^(ceil(log(p)/log(2)))-p == 1

                polarwalsh_(i,ii) = polarwalsh_(i,ii)*PolarWalshAngular(p,i,ii,Middle);
            else
                
                p0 = [];

                remorder0 = p;
                
                while rem(log(remorder0)/log(2),1)~=0 && 2^(ceil(log(remorder0)/log(2)))-remorder0 ~= 1
                                
                    currentorder = 2^(floor(log(p)/log(2)));

                    p0 = [p0,currentorder];
                
                    remorder0 = remorder0-currentorder;
                end
                p0 = [p0,remorder0];
               
                for v = 1:length(p0)
                               
                    polarwalsh_(i,ii) = polarwalsh_(i,ii)*PolarWalshAngular(p0(v),i,ii,Middle);
                end
  
            end

            
end
        end
        
        
        
    end
end

polarwalsh_ = (polarwalsh_-sum(sum(polarwalsh_))./nnz(actuatormask)).*actuatormask;
polarwalsh_ = polarwalsh_./sqrt(sum(sum(polarwalsh_.^2))./nnz(actuatormask));


