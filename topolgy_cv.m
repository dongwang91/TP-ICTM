function [u_t] = topolgy_cv(u,u_af,z,M,N)
% Point-by-point verification of global topological property transformation
% u： before transformation
% u_af： solution after one iteration
% u_t is the result after topological verification
% z is the level set information，the function for thresholding
% M = size('image', 1); N = size('image', 2);
% u=0 foreground, u=1 background

u1 = u;
u2 = 1-u1;
u1_af  = u_af;
u2_af = 1-u1_af;
X = find(u1-u1_af==1);
s = zeros(length(X),1);
XX = zeros(length(X),1);
for i=1:length(X(:))
    h = X(i);
    s(i) = z(h);
end
[~,b] = sort(s,'descend'); 
for i=1:length(X(:))
    h = b(i);
    XX(i) = X(h);
end


G = find(u1-u1_af==-1);
d = zeros(length(G),1);
GG = zeros(length(G),1);
for i=1:length(G(:))
    h = G(i);
    d(i) = z(h);
end
[~,b2] = sort(d); 
for i=1:length(G(:))
    h = b2(i);
    GG(i) = G(h);
end



% %[row,col] = ind2sub(size(u1),X);
for i=1:length(XX(:))
    k = XX(i);  
    %k = X(i);
    l = [k-1,k+1,k-M,k+M];
    l8 = [k-M-1,k-M,k-M+1,k-1,k,k+1,k+M-1,k+M,k+M+1];
    N1_4=zeros(2,2);
    N1_8=zeros(3,3);
    N1_8_bar=zeros(3,3); %for background
    N2=zeros(3,3);

    for t = 1:4
        a = l(t);
        if a>0 && a<M*N
            if u1(a)>0
                N1_4(t) = 1;
            end
        else
            N1_4(t) = 0;
        end
    end

    for m = 1:9
        a = l8(m);
        if a>0 && a<M*N
            if u1(a)>0
                N1_8(m)=1;
            end
        else
            N1_8(m)=0;
        end

        if a>0 && a<M*N
            if u1(a)==0
                N1_8_bar(m)=1;
            end
        else
            N1_8_bar(m)=0;
        end

    end
    N1_8(5)=0;
    N1_8_bar(5)=0;


    % %to find N2: given x=Img(i,j)
    if N1_4(1)==1
        N2(4)=1; %up
        if N1_8(1)==1
            N2(1)=1;
        end
        if N1_8(7)==1
            N2(7)=1;
        end
    end

    if N1_4(2)==1
        N2(6)=1; %down
        if N1_8(3)==1
            N2(3)=1;
        end
        if N1_8(9)==1
            N2(9)=1;
        end
    end

    if N1_4(3)==1
        N2(2)=1; %left
        if N1_8(1)==1
            N2(1)=1;
        end
        if N1_8(3)==1
            N2(3)=1;
        end
    end

    if N1_4(4)==1
        N2(8)=1; %right
        if N1_8(7)==1
            N2(7)=1;
        end
        if N1_8(9)==1
            N2(9)=1;
        end
    end
    N2(5)=0;


    [~,T4] = bwlabel(N2,4); 
    %[L1,T4] = bwlabel(N1_8,8);
    [~,T8] = bwlabel(N1_8_bar,8);
    %[L2,T8] = bwlabel(N2_bar,8);
    [~,TT8] = bwlabel(N1_8,4);
    if T4~=1 || T8~=1      
        u1_af(k)=u1(k);
        u2_af(k)=1-u1_af(k);
    else 
        u1(k) = u1_af(k);
        u2(k) = u2_af(k);
    end
    if TT8==0
        u1_af(k)=0;
        u2_af(k)=1-u1_af(k);
    end
end

for i=1:length(GG(:))
    k = GG(i);  
    %k = X(i);
    l = [k-1,k+1,k-M,k+M];
    l8 = [k-M-1,k-M,k-M+1,k-1,k,k+1,k+M-1,k+M,k+M+1];
    N1_4=zeros(2,2);
    N1_8=zeros(3,3);
    N1_8_bar=zeros(3,3); %for background
    N2=zeros(3,3);

    for t = 1:4
        a = l(t);
        if a>0 && a<M*N
            if u2(a)>0
                N1_4(t) = 1;
            end
        else 
            N1_4(t) = 0;
        end
    end

    for m = 1:9
        a = l8(m);
        if a>0 && a<M*N
            if u2(a)>0
                N1_8(m)=1;
            end
        else
            N1_8(m)=0;
        end

        if a>0 && a<M*N
            if u2(a)==0
                N1_8_bar(m)=1;
            end
        else
            N1_8_bar(m)=0;
        end

    end
    N1_8(5)=0;
    N1_8_bar(5)=0;


    % %to find N2: given x=Img(i,j)
    if N1_4(1)==1
        N2(4)=1; %up
        if N1_8(1)==1
            N2(1)=1;
        end
        if N1_8(7)==1
            N2(7)=1;
        end
    end

    if N1_4(2)==1
        N2(6)=1; %down
        if N1_8(3)==1
            N2(3)=1;
        end
        if N1_8(9)==1
            N2(9)=1;
        end
    end

    if N1_4(3)==1
        N2(2)=1; %left
        if N1_8(1)==1
            N2(1)=1;
        end
        if N1_8(3)==1
            N2(3)=1;
        end
    end

    if N1_4(4)==1
        N2(8)=1; %right
        if N1_8(7)==1
            N2(7)=1;
        end
        if N1_8(9)==1
            N2(9)=1;
        end
    end
    N2(5)=0;


    [~,T4] = bwlabel(N2,4); 
    [~,T8] = bwlabel(N1_8_bar,8);
    [~,TT8] = bwlabel(N1_8,4);
    if T4~=1 || T8~=1      
        u1_af(k)=u1(k);
        u2_af(k)=1-u1_af(k);
    else 
        u1(k) = u1_af(k);
        u2(k) = u2_af(k);
    end
    if TT8==0
        u1_af(k)=0;
        u2_af(k)=1-u1_af(k);
    end
end
u_t = u1;

end