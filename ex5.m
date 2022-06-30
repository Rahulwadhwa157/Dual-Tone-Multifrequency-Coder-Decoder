%1e4 1024 1e4 0.01 input data points

%{
Fs=input("Enter Sampling freq ");
eps=1/Fs;

N=input("Enter filter width ");
t=0:1:(N-1);
%}

prompt = {'Sampling Freq','Filter width'};
 dlgtitle = 'Parameters';
 definput = {'10000','1024'};
 answer = inputdlg(prompt,dlgtitle,1,definput);
 Fs = str2double(answer{1});
 N = str2double(answer{2});

 eps=1/Fs;
 t=0:1:(N-1);


freq=zeros(1,8);
freq(1)=697;
freq(2)=770;
freq(3)=852;
freq(4)=941;
freq(5)=1209;
freq(6)=1336;
freq(7)=1477;
freq(8)=1633;

wc=(2*pi)*freq/Fs;% normalized freq

h=zeros(8,N);

prompt = {'No. of points in key genearted sig','Gain of Filter'};
 dlgtitle = 'Parameters';
 definput = {'10000','0.01'};
 answer = inputdlg(prompt,dlgtitle,1,definput);
 nsig= str2double(answer{1});
 A= str2double(answer{2});
%nsig=input('Enter no. of points in key genearted sig ');
yn=zeros(8,nsig);
yn_noise=zeros(8,nsig);

%A=input("Gain of filter ");
beta=A*ones(1,8);

p_cnt=0;


for i=1:8
    
        h(i,:)=beta(i)*cos(wc(i)*t);
    
end

start_time=0;


prompt = {'No. of times keys should be pressed '};
 dlgtitle = 'Parameters';
 definput = {'10'};
 answer = inputdlg(prompt,dlgtitle,1,definput);
 cnt= str2double(answer{1});
%cnt=input('No. of times keys should be pressed ');

key_arr=char(zeros(1,cnt));
key_arr_noise=char(zeros(1,cnt));



prompt = {'Noise Mean ','Noise Variance'};
 dlgtitle = 'Parameters';
 definput = {'0','10'};
 answer = inputdlg(prompt,dlgtitle,1,definput);
 mu= str2double(answer{1});
 sigma= str2double(answer{2});


keys=[];
dict = ['0','1', '2', '3', '4', '5', '6', '7', '8', '9', '*','#','A', 'B','C', 'D'];
for j=1:cnt
key= menu("Dial the number : " + keys,'0','1', '2', '3', '4','5', '6', '7', '8', '9', '*', '#','A', 'B','C', 'D');

keys=[keys,dict(key)];
xsig= key2freq(dict(key),start_time,start_time+1,2*pi*freq,nsig);
tsig=start_time:1/nsig:start_time+1-1/nsig;

for i=1:8
    yn(i,:)=filtfilt(h(i,:),1,xsig);
    xn_noise=noise_add(xsig,mu,sigma);% Gaussian noise
    yn_noise(i,:)=filtfilt(h(i,:),1,xn_noise);
    
end

[key_arr(j),f1,f2]=freq2key(yn,freq);

[key_arr_noise(j),f3,f4]=freq2key(yn_noise,freq);



%{
figure(p_cnt+1)
p_cnt=p_cnt+1;
plot(tsig,yn(1,:))
title('yn1')


figure(p_cnt+1)
p_cnt=p_cnt+1;
plot(tsig,yn(2,:))
title('yn2')


figure(p_cnt+1)
p_cnt=p_cnt+1;
plot(tsig,yn(3,:))
title('yn3')


figure(p_cnt+1)
p_cnt=p_cnt+1;
plot(tsig,yn(4,:))
title('yn4')


figure(p_cnt+1)
p_cnt=p_cnt+1;
plot(tsig,yn(5,:))
title('yn5')


figure(p_cnt+1)
p_cnt=p_cnt+1;
plot(tsig,yn(6,:))
title('yn6')


figure(p_cnt+1)
p_cnt=p_cnt+1;
plot(tsig,yn(7,:))
title('yn7')


figure(p_cnt+1)
p_cnt=p_cnt+1;
plot(tsig,yn(8,:))
title('yn8')
%}


start_time=start_time+1;


end

msgbox({"The dialled sequence is "+keys+newline+"Detected Sequence in absence of noise is "+key_arr+ newline+ "Detected Sequence in presence of noise is "+key_arr_noise},'success');







