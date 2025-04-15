clc; clear all; close all;
addpath('./image');
flag =1;
switch flag
    case 1
        I = imread('2disk.png');
        I = double(I(:,:,1));
        P = I;
        [I,~] = HeatConv(0.003,I,I);
        M = size(I,1);
        N = size(I,2);
        iterNum =400;
        lambda1 = 1.0;
        lambda2 = 1.0;
        initialLSF = ones(size(I(:,:,1)))-0.01;
        initialLSF(100:M-100,100:N-100) = 0.01;
        tau =50;
        mu = 500;
        sigma=50;

    case 2
        I = imread('16.png');
        I = double(I(:,:,1));
        P = I;
        [I,~] = HeatConv(0.003,I,I);
        M = size(I,1);
        N = size(I,2);
        iterNum =400;
        lambda1 = 1.0;
        lambda2 = 1.0;
        initialLSF = ones(size(I(:,:,1)))-0.01;
        initialLSF(238:365,348:407) = 0.01;
        tau =50;
        mu = 500;
        sigma=50;

    case 3
        I = imread('15.png');
        I = double(I(:,:,1));
        P = I;
        [I,~] = HeatConv(0.003,I,I);
        M = size(I,1);
        N = size(I,2);
        iterNum =400;
        lambda1 = 1.0;
        lambda2 = 1.0;
        initialLSF = ones(size(I(:,:,1)))-0.01;
        initialLSF(203:298,150:279) = 0.01;
        tau =50;
        mu = 1000;
        sigma=50;

    case 4
        I = imread('07.png');
        I = double(I(:,:,1));
        P = I;
        [I,~] = HeatConv(0.003,I,I);
        M = size(I,1);
        N = size(I,2);
        iterNum =400;
        lambda1 = 1.0;
        lambda2 = 1.0;
        initialLSF = ones(size(I(:,:,1)))-0.01;
        initialLSF(100:300,100:300) = 0.01;
        tau =50;
        mu = 500;
        sigma=50;

    case 5
        I = imread('17.jpg');
        I = double(I(:,:,1));
        P = I;
        % [I,~] = HeatConv(0.003,I,I);
        M = size(I,1);
        N = size(I,2);
        iterNum =400;
        lambda1 = 1.0;
        lambda2 = 1.0;
        initialLSF = ones(size(I(:,:,1)))-0.01;
        initialLSF(100:300,100:400) = 0.01;
        tau =50;
        mu = 500;
        sigma=50;

    case 6
        I = imread('5.jpg');
        I = double(I(:,:,1));
        P = I;
        [I,~] = HeatConv(0.003,I,I);
        M = size(I,1);
        N = size(I,2);
        iterNum =400;
        lambda1 = 1.0;
        lambda2 = 1.0;
        initialLSF = ones(size(I(:,:,1)))-0.01;
        initialLSF(70:160,50:200) = 0.01;
        tau =50;
        mu = 500;
        sigma=50;


    case 7
        I = imread('hand.png');
        I = double(I(:,:,1));
        P = I;
        % [I,~] = HeatConv(0.003,I,I);
        M = size(I,1);
        N = size(I,2);
        iterNum =400;
        lambda1 = 1.0;
        lambda2 = 1.0;
        initialLSF = ones(size(I(:,:,1)))-0.01;
        initialLSF(320:471,128:486) = 0.01;
        tau =50;
        mu = 1000;
        sigma=50;


    case 8
        I = imread('lung.png');
        I = double(I(:,:,1));
        P = I;
        % [I,~] = HeatConv(0.003,I,I);
        M = size(I,1);
        N = size(I,2);
        iterNum =400;
        lambda1 = 1.0;
        lambda2 = 1.0;
        initialLSF = ones(size(I(:,:,1)))-0.01;
        initialLSF(355:394,166:223) = 0.01;
        initialLSF(200:275,360:420) = 0.01;
        tau =50;
        mu = 1000;
        sigma=50;

    case 9
        I = imread('brain.png');
        I = double(I(:,:,1));
        P = I;
        [I,~] = HeatConv(0.003,I,I);
        M = size(I,1);
        N = size(I,2);
        iterNum =400;
        lambda1 = 1.0;
        lambda2 = 1.0;
        initialLSF = ones(size(I(:,:,1)))-0.01;
        initialLSF(355:394,166:223) = 0.01;
        initialLSF(200:275,360:420) = 0.01;
        tau =50;
        mu = 1000;
        sigma=50;

    case 10
        I = imread('23.png');
        I = double(I(:,:,1));
        P = I;
        % [I,~] = HeatConv(0.001,I,I);
        M = size(I,1);
        N = size(I,2);
        iterNum =400;
        lambda1 = 1.0;
        lambda2 = 1.0;
        initialLSF = ones(size(I(:,:,1)))-0.01;
        initialLSF(80:300,70:425) = 0.01;
        tau =10;
        mu = 800;
        sigma=10;
        
    case 11
        I = imread('50.png');
        I = double(I(:,:,1));
        P = I;
        [I,~] = HeatConv(0.004,I,I);
        M = size(I,1);
        N = size(I,2);
        iterNum =400;
        lambda1 = 1.0;
        lambda2 = 1.0;
        initialLSF = ones(size(I(:,:,1)))-0.99;
        initialLSF(350:579,235:336) = 0.99;
        initialLSF(350:850,780:934) = 0.99;
        tau =10;
        mu = 1000;
        sigma=30;

    case 12
        I = imread('56.png');
        I = double(I(:,:,1));
        P = I;
        [I,~] = HeatConv(0.001,I,I);
        M = size(I,1);
        N = size(I,2);
        iterNum =400;
        lambda1 = 1.0;
        lambda2 = 1.0;
        initialLSF = ones(size(I(:,:,1)))-0.99;
        initialLSF(419:494,752:794) = 0.99;
        tau =10;
        mu = 1000;
        sigma=10;

    case 13
        I = imread('2.bmp');
        I = double(I(:,:,1));
        P = I;
        [I,~] = HeatConv(0.001,I,I);
        M = size(I,1);
        N = size(I,2);
        iterNum =400;
        lambda1 = 1.0;
        lambda2 = 1.0;
        initialLSF = ones(size(I(:,:,1)))-0.99;
        initialLSF(10:43,20:30) = 0.99;
        initialLSF(14:32,50:70) = 0.99;
        initialLSF(53:60,50:65) = 0.99;
        tau =5;
        mu = 300;
        sigma=3;

    case 14
        I = imread('4.bmp');
        I = double(I(:,:,1));
        P = I;
        [I,~] = HeatConv(0.001,I,I);
        M = size(I,1);
        N = size(I,2);
        iterNum =400;
        lambda1 = 1.0;
        lambda2 = 1.0;
        initialLSF = ones(size(I(:,:,1)))-0.99;
        initialLSF(92:107,73:75) = 0.99;
        tau =2;
        mu = 50;
        sigma=2;

    case 15
        I = imread('57.png');
        I = double(I(:,:,1));
        P = I;
        [I,~] = HeatConv(0.003,I,I);
        M = size(I,1);
        N = size(I,2);
        iterNum =400;
        lambda1 = 1.0;
        lambda2 = 1.0;
        initialLSF = ones(size(I(:,:,1)))-0.99;
        initialLSF(283:353,364:460) = 0.99;
        tau =10;
        mu = 1500;
        sigma=10;

end

u = initialLSF;

%---------------------------------
Wanttosaveamovie = 1; % Decide to make a video
if Wanttosaveamovie
    filename = ['example-',num2str(flag)];
    Ve = VideoWriter(filename,'MPEG-4');
    FrameRate = max(floor(iterNum/10),1);
    open(Ve);
end
%---------------------------------

%--------------------------------------------------------------------------
if Wanttosaveamovie
    figure;imagesc(P, [0, 255]);colormap(gray);hold on;
    title('Initial contour');
    [c,h] = contour(u,[0.5 0.5],'r','LineWidth',2);
    axis off; axis equal
    hold off;
    currentFrame = getframe(gcf);
    writeVideo(Ve,currentFrame);
end
%--------------------------------------------------------------------------



K=fspecial('gaussian',round(2*sigma)*2+1,sigma);  
K2 = fspecial('gaussian',round(2*tau)*2+1,tau); 
KI=conv2(I,K,'same');                                           
KONE=conv2(ones(size(I)),K,'same');  
                         
                                       

for n=1:iterNum
    n
    Ik=I.*u;
    c1=conv2(u,K,'same');
    c2=conv2(Ik,K,'same');
    f1=(c2)./(c1);
    f2=(KI-c2)./(KONE-c1);
    phi1 = lambda1*conv2(f1.^2,K,'same')-lambda1*2*I.*conv2(f1,K,'same')+mu*conv2(1-u,K2,'same');
    phi2 = lambda2*conv2(f2.^2,K,'same')-lambda2*2*I.*conv2(f2,K,'same')+mu*conv2(u,K2,'same');
    u_af = double(phi1-phi2<0)*0.98+0.01;
    u_t = topolgy_LIF(u,u_af,phi1-phi2,M,N);
    change = sum(abs(u_t(:)-u(:)));
    u = u_t;
  
    if change==0
        break;
    end 
    
    
    if Wanttosaveamovie
        imagesc(P, [0, 255]);colormap(gray);hold on;
        [c,h] = contour(u_t,[0.5 0.5],'r','LineWidth',2);
        iterNum=[num2str(n), ' iterations'];
        title(iterNum);hold off;
        axis off; axis equal
        hold off;
        currentFrame = getframe(gcf);
        writeVideo(Ve,currentFrame);
        pause(0.1)
    end   
    
end




if Wanttosaveamovie
    close(Ve)
end
