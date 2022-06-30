function [x] = key2freq(key,start_time,end_time,wc,nsig)

temp=(end_time-start_time)/nsig;
t=start_time:temp:end_time-temp; 

switch key
    case '1'
        x=sin(wc(1)*t)+sin(wc(5)*t);
    case '2'
        x=sin(wc(1)*t)+sin(wc(6)*t);
    case '3'
        x=sin(wc(1)*t)+sin(wc(7)*t);
    case '4'
        x=sin(wc(2)*t)+sin(wc(5)*t);
    case '5'
        x=sin(wc(2)*t)+sin(wc(6)*t);
    case '6'
        x=sin(wc(2)*t)+sin(wc(7)*t);
    case '7'
        x=sin(wc(3)*t)+sin(wc(5)*t);
    case '8'
        x=sin(wc(3)*t)+sin(wc(6)*t);
    case '9'
        x=sin(wc(3)*t)+sin(wc(7)*t);
    case '0'
        x=sin(wc(4)*t)+sin(wc(6)*t);
    case 'A'
        x=sin(wc(1)*t)+sin(wc(8)*t);
    case 'B'
        x=sin(wc(2)*t)+sin(wc(8)*t);
    case 'C'
        x=sin(wc(3)*t)+sin(wc(8)*t);
    case 'D'
        x=sin(wc(4)*t)+sin(wc(8)*t);
    case '*'
        x=sin(wc(4)*t)+sin(wc(5)*t);
    case '#'
        x=sin(wc(4)*t)+sin(wc(7)*t);
    
    otherwise
        x=sin(0*t);
end



end