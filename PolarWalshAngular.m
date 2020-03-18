function polarwalsh_ = PolarWalshAngular(p,i,ii,Middle)

if p == 0
    polarwalsh_ = 1;
    
else
    if rem(log(p)/log(2),1)==0
        
        polarwalsh_ = sign(cos(2^(log(p)/log(2)-1)*(atan2((ii-Middle),(i-Middle))+pi)));
    elseif 2^(ceil(log(p)/log(2)))-p == 1
        
        polarwalsh_ = sign(sin(2^(log((p+1))/log(2)-1)*(atan2((ii-Middle),(i-Middle))+pi)));
    end
end