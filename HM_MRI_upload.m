%HM_MRI%

%Prepare data

S0=load_untouch_nii('TE80b0.nii');
S0=double(S0.img);
S1=load_untouch_nii('TE80b100.nii');
S1=double(S1.img);
S2=load_untouch_nii('TE80b200.nii');
S2=double(S2.img);
S3=load_untouch_nii('TE80b400.nii');
S3=double(S3.img);
S4=load_untouch_nii('TE80b800.nii');
S4=double(S4.img);
S5=load_untouch_nii('TE80b1500.nii');
S5=double(S5.img);
S6=load_untouch_nii('TE80b3000.nii');
S6=double(S6.img);
S7=load_untouch_nii('TE100b0.nii');
S7=double(S7.img);
S8=load_untouch_nii('TE100b100.nii');
S8=double(S8.img);
S9=load_untouch_nii('TE100b200.nii');
S9=double(S9.img);
S10=load_untouch_nii('TE100b400.nii');
S10=double(S10.img);
S11=load_untouch_nii('TE100b800.nii');
S11=double(S11.img);
S12=load_untouch_nii('TE100b1500.nii');
S12=double(S12.img);
S13=load_untouch_nii('TE100b3000.nii');
S13=double(S13.img);
S14=load_untouch_nii('TE120b0.nii');
S14=double(S14.img);
S15=load_untouch_nii('TE120b100.nii');
S15=double(S15.img);
S16=load_untouch_nii('TE120b200.nii');
S16=double(S16.img);
S17=load_untouch_nii('TE120b400.nii');
S17=double(S17.img);
S18=load_untouch_nii('TE120b800.nii');
S18=double(S18.img);
S19=load_untouch_nii('TE120b1500.nii');
S19=double(S19.img);
S20=load_untouch_nii('TE120b3000.nii');
S20=double(S20.img);
S21=load_untouch_nii('TE150b0.nii');
S21=double(S21.img);
S22=load_untouch_nii('TE150b100.nii');
S22=double(S22.img);
S23=load_untouch_nii('TE150b200.nii');
S23=double(S23.img);
S24=load_untouch_nii('TE150b400.nii');
S24=double(S24.img);
S25=load_untouch_nii('TE150b800.nii');
S25=double(S25.img);
S26=load_untouch_nii('TE150b1500.nii');
S26=double(S26.img);
S27=load_untouch_nii('TE150b3000.nii');
S27=double(S27.img);
S28=load_untouch_nii('TE200b0.nii');
S28=double(S28.img);
S29=load_untouch_nii('TE200b100.nii');
S29=double(S29.img);
S30=load_untouch_nii('TE200b200.nii');
S30=double(S30.img);
S31=load_untouch_nii('TE200b400.nii');
S31=double(S31.img);
S32=load_untouch_nii('TE200b800.nii');
S32=double(S32.img);
S33=load_untouch_nii('TE200b1500.nii');
S33=double(S33.img);
S34=load_untouch_nii('TE200b3000.nii');
S34=double(S34.img);


s0=reshape(S0(:,:,:),320*278,7);
s1=reshape(S1(: ,:,:),320*278,7);
s2=reshape(S2(:,:,:),320*278,7);
s3=reshape(S3(:,:,:),320*278,7);
s4=reshape(S4(:,:,:),320*278,7);
s5=reshape(S5(:,:,:),320*278,7);
s6=reshape(S6(:,:,:),320*278,7);
s7=reshape(S7(:,:,:),320*278,7);
s8=reshape(S8(:,:,:),320*278,7);
s9=reshape(S9(:,:,:),320*278,7);
s10=reshape(S10(:,:,:),320*278,7);
s11=reshape(S11(:,:,:),320*278,7);
s12=reshape(S12(:,:,:),320*278,7);
s13=reshape(S13(:,:,:),320*278,7);
s14=reshape(S14(:,:,:),320*278,7);
s15=reshape(S15(:,:,:),320*278,7);
s16=reshape(S16(:,:,:),320*278,7);
s17=reshape(S17(:,:,:),320*278,7);
s18=reshape(S18(:,:,:),320*278,7);
s19=reshape(S19(:,:,:),320*278,7);
s20=reshape(S20(:,:,:),320*278,7);
s21=reshape(S21(:,:,:),320*278,7);
s22=reshape(S22(:,:,:),320*278,7);
s23=reshape(S23(:,:,:),320*278,7);
s24=reshape(S24(:,:,:),320*278,7);
s25=reshape(S25(:,:,:),320*278,7);
s26=reshape(S26(:,:,:),320*278,7);
s27=reshape(S27(:,:,:),320*278,7);
s28=reshape(S28(:,:,:),320*278,7);
s29=reshape(S29(:,:,:),320*278,7);
s30=reshape(S30(:,:,:),320*278,7);
s31=reshape(S31(:,:,:),320*278,7);
s32=reshape(S32(:,:,:),320*278,7);
s33=reshape(S33(:,:,:),320*278,7);
s34=reshape(S34(:,:,:),320*278,7);


xdata = [0; 0.1; 0.2; 0.4; 0.8; 1.5 ;3.0]; % prepare b-values for fitting
TEdata=[80; 100; 120; 150; 200];% prepare TE values for fitting

%Step1 Fit s0 and T2 with mono-exponential model
T2m=zeros(size(s1)); % create zero matrix for saving T2 data
s0T2m=zeros(size(s1)); % create zero matrix for saving S0 data

parfor i=1:320*278*7
     obs_1=[s0(i);s7(i); s14(i); s21(i); s28(i)];
     if obs_1(1)>30 %Thread for the automask
        % S=S0*exp(-TE/T2)
       fun = @(x)x(1).*exp(-TEdata./x(2))-obs_1;
       x0 = [obs_1(1)+100 300]; %initial values
       lb=[0 0]; % lower limit, unit ms
       ub=[5000 2500]; % upper limit, unit ms
       options =optimoptions(@lsqnonlin,'Algorithm','levenberg-marquardt');
       a= lsqnonlin(fun,x0,lb,ub,options);
       T2m(i)=a(2);
       a(2);
       s0T2m(i)=a(1);
       a(1)
  else
     end
end
T2m_image=reshape(s0,320,278,7);
s0T2m_image=reshape(s0T2m,320,278,7);


%Step2 Fit ADC
ADC=zeros(size(s1));% create zero matrix for saving ADC data

parfor i=1:320*278*7
    obs_1=[s0(i) s1(i) s2(i) s3(i) s4(i) s5(i) s6(i)];
    obs_1=sort(obs_1,'descend');
    if obs_1(1)>30 %Thread for the automask
        % S=S0*exp(-b*ADC)
        fun = @(x)obs_1(1).*exp(-xdata.*x)-obs_1;
        x0 = 1.0; %initial value
        options =optimoptions(@lsqnonlin,'Algorithm','levenberg-marquardt');
        a= lsqnonlin(fun,x0);
        ADC(i)=a(1);
    else
    end
end
aa1_ADC=reshape(ADC,320,278,7);

%Step3 Fit HM-MRI metrics
% prepare b-values for HM-MRI fitting
xdata2 = [0; 0.1; 0.2; 0.4; 0.8; 1.5 ;3.0;0; 0.1; 0.2; 0.4; 0.8; 1.5 ;3.0;0; 0.1; 0.2; 0.4; 0.8; 1.5 ;3.0;0; 0.1; 0.2; 0.4; 0.8; 1.5 ;3.0;0; 0.1; 0.2; 0.4; 0.8; 1.5 ;3.0;];
% prepare TEs for HM-MRI fitting
TEdata2=[80;80;80;80;80;80;80; 100; 100;100;100;100;100;100;120; 120;120;120;120;120;120;150;150;150;150;150;150;150; 200;200;200;200;200;200;200];

p1=zeros(size(s1));% create zero matrix for saving F_Dvery-slow data
p2=zeros(size(s1));% create zero matrix for saving Dvery-slow data, always be zero in the modified three-compartment model
p3=zeros(size(s1));% create zero matrix for saving T2_Dvery-slow data
p4=zeros(size(s1));% create zero matrix for saving F_Dslow data
p5=zeros(size(s1));% create zero matrix for saving Dslow data
p6=zeros(size(s1));% create zero matrix for saving T2_Dslow data
p7=zeros(size(s1));% create zero matrix for saving F_Dfast data
p8=zeros(size(s1));% create zero matrix for saving Dfast data
p9=zeros(size(s1));% create zero matrix for saving T2_Dfast data

parfor i=1:320*278*7
    obs_p1=[ s0(i) s1(i) s2(i) s3(i) s4(i) s5(i) s6(i)];
    obs_p2=[s7(i) s8(i) s9(i) s10(i) s11(i) s12(i) s13(i)];
    obs_p3=[s14(i) s15(i) s16(i) s17(i) s18(i) s19(i) s20(i)];
    obs_p4=[s21(i) s22(i) s23(i) s24(i) s25(i) s26(i) s27(i)];
    obs_p5=[s28(i) s29(i) s30(i) s31(i) s32(i) s33(i) s34(i)];
    obs_1=[obs_p1,obs_p2 ,obs_p3 ,obs_p4 ,obs_p5]';

  if obs_1(1,1)>30 %Thread for the automask
       % S=S0*(F_Dvery-slow*exp(-TE/T2_Dvery-slow)+F_Dslow*exp(-b*Dslow-TE/T2_Dslow)+F_Dfast*exp(-b*Dfast-TE/T2_Dfast))
       fun=@(x)s0T2m(i).*(x(1).*exp(-TEdata2./x(2))+x(3).*exp(-xdata2.*x(4)-TEdata2./x(5))+x(6).*exp(-xdata2.*x(7)-TEdata2./x(8)))-obs_1;

       %set initial values and constraints
     x0 = [0.1; 50;  0.7; 1.0; 100; 0.2;5.0; 500]; %initial values for F_Dvery-slow, T2_Dvery-slow,F_Dslow,Dslow,T2_Dslow,F_Dfast,Dfast, and T2_Dfast
     lb = [0;   0;     0;   0.00001;  0; 0; 1.0; 0]; % lower limit for F_Dvery-slow, T2_Dvery-slow,F_Dslow,Dslow,T2_Dslow,F_Dfast,Dfast, and T2_Dfast
     ub = [0.33; 2500; 1;    3.0;   2500; 1; 20;   2500]; % upper limit for F_Dvery-slow, T2_Dvery-slow,F_Dslow,Dslow,T2_Dslow,F_Dfast,Dfast, and T2_Dfast

      [a, resnorm] = lsqnonlin(fun, x0, lb,ub,[],[],[1 0 1 0 0 1 0 0],[1]);%fitting with constraints that F_Dvery-slow + F_Dslow + F_Dfast=1
      p1(i)=a(1);
      p2(i)=0;
      p3(i)=a(2);
      p4(i)=a(3);
      p5(i)=a(4);
      p6(i)=a(5);
      p7(i)=a(6);
      p8(i)=a(7);
      p9(i)=a(8);
    else
    end
end

F_Dvery_slow=reshape(p1,320,278,7);
Dvery_slow=reshape(p2,320,278,7);%should be zero
T2_Dvery_slow=reshape(p3,320,278,7);
F_Dslow=reshape(p4,320,278,7);
Dslow=reshape(p5,320,278,7);
T2_Dslow=reshape(p6,320,278,7);
F_Dfast=reshape(p7,320,278,7);
Dfast=reshape(p8,320,278,7);
T2_Dfast=reshape(p9,320,278,7);