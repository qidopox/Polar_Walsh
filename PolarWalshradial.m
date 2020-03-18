function polarwalsh_ = PolarWalshradial(m,i,ii,Middle)

if m == 0
    polarwalsh_ = 1;
elseif rem(m,2) == 1
    polarwalsh_ = sign(sin(1/(1-Middle)^2*2^((m+1)/2)*pi*((i-Middle)^2+(ii-Middle)^2)));
else
    polarwalsh_ = sign(cos(1/(1-Middle)^2*2^(m/2)*pi*((i-Middle)^2+(ii-Middle)^2)));
end