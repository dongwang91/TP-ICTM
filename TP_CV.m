clc; clear all; close all;
addpath('./image');
flag =15;
switch flag
    case 1
        I = imread('2disk.png');
        [row,col]=size(I);
        P = rgb2gray(uint8(I));
        P = double(P);
        [P,~] = HeatConv(0.001,P,P);
        M = size(I,1);
        N = size(I,2);
        P = P./max(max(abs(P)));
        iterNum =4000;
        dt = 0.001;  % time step,0.03
        lambda = 0.01; %0.1,0.065
        lamda = lambda * sqrt(pi)/sqrt(dt);
        u1 = zeros(M,N); 
        u1(100:M-100,100:N-100) = ones(M-200+1,N-200+1);
        u2 = ones(M,N)-u1;
        NS = 2; % number of segments
        NC = 1; % number of channels

    case 2
        I = imread('16.png');
        P = rgb2gray(uint8(I));
        P = double(P);
        [P,~] = HeatConv(0.003,P,P);
        M = size(I,1);
        N = size(I,2);
        P = P./max(max(abs(P)));
        iterNum =300;
        dt = 0.03;  % time step
        lambda = 0.01;
        lamda = lambda * sqrt(pi)/sqrt(dt);
        u1 = zeros(M,N);
        u1(100:503,280:529) = 1;
        u2 = ones(M,N)-u1;
        NS = 2; % number of segments
        NC = 1; % number of channels

    case 3
        I = imread('15.png');
        P = rgb2gray(uint8(I));
        P = double(P);
        [P,~] = HeatConv(0.001,P,P);
        M = size(I,1);
        N = size(I,2);
        P = P./max(max(abs(P)));
        iterNum =13;
        dt = 0.03;  % time step
        lambda = 0.01;
        lamda = lambda * sqrt(pi)/sqrt(dt);
        u1 = zeros(M,N);
        u1(203:298,28:279) = 1;
        u2 = ones(M,N)-u1;
        NS = 2; % number of segments
        NC = 1; % number of channels
    case 4
        I = imread('07.png');
        P = rgb2gray(uint8(I));
        P = double(P);
        [P,~] = HeatConv(0.005,P,P);
        M = size(I,1);
        N = size(I,2);
        P = P./max(max(abs(P)));
        iterNum =400;
        dt = 0.01;  % time step
        lambda = 0.01;
        lamda = lambda * sqrt(pi)/sqrt(dt);
        u1 = zeros(M,N);
        u1(100:300,100:300)=1;
        u2 = ones(M,N)-u1;
        NS = 2; % number of segments
        NC = 1; % number of channels
    case 5
        I = imread('17.jpg');
        P = rgb2gray(uint8(I));
        P = double(P);
        [P,~] = HeatConv(0.001,P,P);
        M = size(I,1);
        N = size(I,2);
        P = P./max(max(abs(P)));
        iterNum =400;
        dt = 0.1; % time step
        lambda = 0.01;
        lamda = lambda * sqrt(pi)/sqrt(dt);
        u1 = zeros(M,N);
        u1(50:400,66:419) = 1;
        u2 = ones(M,N)-u1;
        NS = 2; % number of segments
        NC = 1; % number of channels

    case 6
        I = imread('5.jpg');
        P = rgb2gray(uint8(I));
        P = double(P);
        [P,~] = HeatConv(0.001,P,P);
        M = size(I,1);
        N = size(I,2);
        P = P./max(max(abs(P)));
        iterNum =400;
        dt = 0.01;  % time step
        lambda = 0.001;
        lamda = lambda * sqrt(pi)/sqrt(dt);
        u1 = zeros(M,N);
        u1(70:160,50:200)=1;
        u2 = ones(M,N)-u1;
        NS = 2; % number of segments
        NC = 1; % number of channels

    case 7
        I = imread('hand.png');
        P = rgb2gray(uint8(I));
        P = double(P);
        [P,~] = HeatConv(0.001,P,P);
        M = size(I,1);
        N = size(I,2);
        P = P./max(max(abs(P)));
        iterNum =400;
        dt = 0.05;  % time step
        lambda = 0.001;
        lamda = lambda * sqrt(pi)/sqrt(dt);
        u1 = zeros(M,N);
        u1(320:471,128:486)=1;
        u2 = ones(M,N)-u1;
        NS = 2; % number of segments
        NC = 1; % number of channels

    case 8
        I = imread('lung.png');
        P = rgb2gray(uint8(I));
        P = double(P);
        [P,~] = HeatConv(0.0001,P,P);
        M = size(I,1);
        N = size(I,2);
        P = P./max(max(abs(P)));
        iterNum =400;
        dt = 0.001;  % time step
        lambda = 0.02;
        lamda = lambda * sqrt(pi)/sqrt(dt);
        u1 = zeros(M,N);
        u1(355:394,166:223)=1;
        u1(200:275,360:420)=1;
        u2 = ones(M,N)-u1;
        NS = 2; % number of segments
        NC = 1; % number of channels

    case 9
        I = imread('23.png');
        P = rgb2gray(uint8(I));
        P = double(P);
        [P,~] = HeatConv(0.0001,P,P);
        M = size(I,1);
        N = size(I,2);
        P = P./max(max(abs(P)));
        iterNum =400;
        dt = 0.01;  % time step
        lambda = 0.015;
        lamda = lambda * sqrt(pi)/sqrt(dt);
        u1 = zeros(M,N);
        u1(80:430,70:425)=1;
        u2 = ones(M,N)-u1;
        NS = 2; % number of segments
        NC = 1; % number of channels

    case 10
        I = imread('38.png');
        M = size(I,1);
        N = size(I,2);
        P = double(I);
        for i = 1:3
            P(:,:,i) = P(:,:,i)./max(max(abs(P(:,:,i))));
            [P(:,:,i),~] = HeatConv(0.0001,P(:,:,i),P(:,:,i));
        end
        f1 = P(:,:,1); % first color channel
        f2 = P(:,:,2); % second
        f3 = P(:,:,3); % third
        iterNum =400;
        dt = 0.005;  % time step
        lambda = 0.045;
        lamda = lambda * sqrt(pi)/sqrt(dt);
        u1 = zeros(M,N);
        u1(49:607,320:940)=1;
        u2 = ones(M,N)-u1;
        NS = 2; % number of segments
        NC = 3; % number of channels

    case 11
        I = imread('43.png');
        M = size(I,1);
        N = size(I,2);
        P = double(I);
        for i = 1:3
            P(:,:,i) = P(:,:,i)./max(max(abs(P(:,:,i))));
            [P(:,:,i),~] = HeatConv(0.0001,P(:,:,i),P(:,:,i));
        end
        f1 = P(:,:,1); % first color channel
        f2 = P(:,:,2); % second
        f3 = P(:,:,3); % third
        iterNum =400;
        dt = 0.001;  % time step
        lambda = 0.004;
        lamda = lambda * sqrt(pi)/sqrt(dt);
        u1 = zeros(M,N);
        u1(167:557,114:950)=1;
        u2 = ones(M,N)-u1;
        NS = 2; % number of segments
        NC = 3; % number of channels

    case 12
        I = imread('42.png');
        M = size(I,1);
        N = size(I,2);
        P = double(I);
        for i = 1:3
            P(:,:,i) = P(:,:,i)./max(max(abs(P(:,:,i))));
            [P(:,:,i),~] = HeatConv(0.0001,P(:,:,i),P(:,:,i));
        end
        f1 = P(:,:,1); % first color channel
        f2 = P(:,:,2); % second
        f3 = P(:,:,3); % third
        iterNum =400;
         dt = 0.01;  % time step
        lambda = 0.008;
        lamda = lambda * sqrt(pi)/sqrt(dt);
        u1 = zeros(M,N);
        u1(122:368,82:409)=1;
        u2 = ones(M,N)-u1;
        NS = 2; % number of segments
        NC = 3; % number of channels

    case 13
        I = imread('45.png');
        M = size(I,1);
        N = size(I,2);
        P = double(I);
        for i = 1:3
            P(:,:,i) = P(:,:,i)./max(max(abs(P(:,:,i))));
            [P(:,:,i),~] = HeatConv(0.0001,P(:,:,i),P(:,:,i));
        end
        f1 = P(:,:,1); % first color channel
        f2 = P(:,:,2); % second
        f3 = P(:,:,3); % third
        iterNum =400;
        dt = 0.001;  % time step
        lambda = 0.01;
        lamda = lambda * sqrt(pi)/sqrt(dt);
        u1 = zeros(M,N);
        u1(248:550,439:1150)=1;
        u2 = ones(M,N)-u1;
        NS = 2; % number of segments
        NC = 3; % number of channels

    case 14
        I = imread('brain.png');
        P = rgb2gray(uint8(I));
        P = double(P);
        [P,~] = HeatConv(0.0001,P,P);
        M = size(I,1);
        N = size(I,2);
        P = P./max(max(abs(P)));
        iterNum =400;
        dt = 0.05;  % time step
        lambda = 0.001;
        lamda = lambda * sqrt(pi)/sqrt(dt);
        u1 = zeros(M,N);
        u1(407:446,270:323)=1;
        u1(209:254,197:249)=1;
        u2 = ones(M,N)-u1;
        NS = 2; % number of segments
        NC = 1; % number of channels

    case 15
        I = imread('46.jpg');
        M = size(I,1);
        N = size(I,2);
        P = double(I);
        for i = 1:3
            P(:,:,i) = P(:,:,i)./max(max(abs(P(:,:,i))));
            [P(:,:,i),~] = HeatConv(0.0001,P(:,:,i),P(:,:,i));
        end
        f1 = P(:,:,1); % first color channel
        f2 = P(:,:,2); % second
        f3 = P(:,:,3); % third
        iterNum =400;
        dt = 0.001;  % time step
        lambda = 0.008148;
        lamda = lambda * sqrt(pi)/sqrt(dt);
        u1 = zeros(M,N);
        u1(137:300,30:155)=1;
        u1(154:305,220:336)=1;
        u2 = ones(M,N)-u1;
        NS = 2; % number of segments
        NC = 3; % number of channels



    case 16
        I = imread('49.jpg');
        M = size(I,1);
        N = size(I,2);
        P = double(I);
        for i = 1:3
            P(:,:,i) = P(:,:,i)./max(max(abs(P(:,:,i))));
            % [P(:,:,i),~] = HeatConv(0.00001,P(:,:,i),P(:,:,i));
        end
        f1 = P(:,:,1); % first color channel
        f2 = P(:,:,2); % second
        f3 = P(:,:,3); % third
        iterNum =1000;
        dt = 0.001;  % time step
        lambda = 0.12;
        lamda = lambda * sqrt(pi)/sqrt(dt);
        u1 = zeros(M,N);
        u1(380:745,60:294)=1;
        u1(385:860,465:767)=1;
        u1(405:840,975:1295)=1;
        u2 = ones(M,N)-u1;
        NS = 2; % number of segments
        NC = 3; % number of channels


end

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
    imagesc(I, [0, 1]);hold on;
    title('Initial contour');
    if NS==2
    contour(u1,[0.5 0.5],'r','LineWidth',2);
    elseif NS == 3
        contour(u2,[0.5 0.5],'b','LineWidth',2);
    elseif NS == 4
        contour(u2,[0.5 0.5],'b','LineWidth',2);
        contour(u3,[0.5 0.5],'b','LineWidth',2);
    else
        disp('edit the plotting part to validate to your cases')
    end
    axis off; axis equal
    hold off;
    currentFrame = getframe(gcf);
    writeVideo(Ve,currentFrame);
end
%--------------------------------------------------------------------------
change = 1;
            
y_values = zeros(1, iterNum); 
for n=1:iterNum
   
    
    if NS == 2 && NC ==1
        %------------------------------------------------------------------   
        [f1,f2] = daterm(P,u1,u2);
        [uh1,uh2] = HeatConv(dt,u1,u2);
        index1 = f1+lamda*uh2;
        index2 = f2+lamda*uh1;
        u1_af = double(index1<=index2);
        M = size(I,1);
        u_t = topolgy_cv(u1,u1_af,index1-index2,M,N);
        change = sum(abs(u_t(:)-u1(:)));
        u1 = u_t;
        u2 = 1-u1;
        if Wanttosaveamovie
            imagesc(I, [0, 1]);hold on;
            title('Initial contour');
            contour(u_t,[0.5 0.5],'b','LineWidth',2);
            axis off; axis equal
            hold off;
            %pause;
            currentFrame = getframe(gcf);
            writeVideo(Ve,currentFrame);
        end
    end

    if NS == 2 && NC ==3
        %------------------------------------------------------------------
        % 2 segments for color images
        [f11,f21] = daterm(f1,u1,u2); % data term of first color channel
        [f12,f22] = daterm(f2,u1,u2); % data term of second color channel
        [f13,f23] = daterm(f3,u1,u2); % data term of third color channel
        [uh1,uh2] = HeatConv(dt,u1,u2); % heat kernel convolution
        index1 = f11+f12+f13-lamda*uh1;
        index2 = f21+f22+f23-lamda*uh2;
        u1_af = double(index1<=index2); % thresholding if u1>u2 then u1=1 vise versa
        u_t = topolgy_cv(u1,u1_af,index1-index2,M,N);
        change = sum(abs(u_t(:)-u1(:)));
        u1 = u_t;
        u2 = 1-u1;
        if Wanttosaveamovie
            imagesc(I, [0, 1]);hold on;
            title('Initial contour');
            contour(u1,[0.5 0.5],'r','LineWidth',2);
            axis off; axis equal
            hold off;
            currentFrame = getframe(gcf);
            writeVideo(Ve,currentFrame);
        end
    end


    if change==0
        it_num = n;
        break;
    end 


end

if Wanttosaveamovie
    close(Ve)
end