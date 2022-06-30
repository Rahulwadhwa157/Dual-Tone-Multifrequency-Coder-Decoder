function [key,f1,f2] = freq2key(yn,freq)
 

  


   

  norm_low=zeros(1,4);
  norm_high=zeros(1,4);


  for i=1:4
      norm_low(i)=norm(yn(i,:));
      norm_high(i)=norm(yn(i+4,:));
  end

  [mx,f1]=max(norm_low);
  [mx2,f2]=max(norm_high);

  f1=freq(f1);
  f2=freq(4+f2);

  fr=[f1,f2];
          
          if mx==0
              key='Z'; %invalid key

          elseif f1==freq(1)&&f2==freq(5)
              key='1';
          elseif f1==freq(1)&&f2==freq(6)
                  key='2';
          elseif f1==freq(1)&&f2==freq(7)
                  key='3';
          elseif f1==freq(2)&&f2==freq(5)
                  key='4';
          elseif f1==freq(2)&&f2==freq(6)
                  key='5';
          elseif f1==freq(2)&&f2==freq(7)
                  key='6';
          elseif f1==freq(3)&&f2==freq(5)
                  key='7';
          elseif f1==freq(3)&&f2==freq(6)
                  key='8';
          elseif f1==freq(3)&&f2==freq(7)
                  key='9';
          elseif f1==freq(4)&&f2==freq(6)
                  key='0';
          elseif f1==freq(1)&&f2==freq(8)
                  key='A';
          elseif f1==freq(2)&&f2==freq(8)
                  key='B';
          elseif f1==freq(3)&&f2==freq(8)
                  key='C';
          elseif f1==freq(4)&&f2==freq(8)
                  key='D';
          elseif f1==freq(4)&&f2==freq(5)
                  key='*';
          elseif f1==freq(4)&&f2==freq(7)
                  key='#';
          
 
          else
              key='Z'; 
          end

  









end