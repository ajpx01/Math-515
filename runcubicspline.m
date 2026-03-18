%% Exercise 5
molality=[0.005 0.010 0.020 0.050 0.100 0.200 0.500 1.000 2.000]';
coefficient=[0.924 0.896 0.859 0.794 0.732 0.656 0.536 0.430 0.316]';
xstar1=0.032;
ystar1=cubic_spline(molality,coefficient,xstar1)

%% Exercise 6
% a)
days=[0 6 10 13 17 20 28]';
day=3;
smoothday=linspace(min(days),max(days),100);

average_weightml=[7 16 19 15 12 10.5 10]';
average_weightyl=[7 18 45 49 32 30.5 30]';

average_weight_thirddayml=cubic_spline(days,average_weightml,day) % average weight on third day for mature leaves using interpolator
spline_average_weightml=cubic_spline(days,average_weightml,smoothday); % calculate all average weights for mature leaves using interpolator
splineml_thirdday=spline(days,average_weightml,day) % use built-in spline function for dataset to find average weight on third day for mature leaves
splineml=spline(days,average_weightml,smoothday); % use built-in spline function for dataset to find average weight for all days of mature leaves

average_weight_thirddayyl=cubic_spline(days,average_weightyl,day) % average weight on third day for young leaves using interpolator
spline_average_weightyl=cubic_spline(days,average_weightyl,smoothday); % calculate all average weights for young leaves using interpolator
splineyl_thirdday=spline(days,average_weightyl,day) % use built-in spline function for dataset to find average weight on third day for young leaves
splineyl=spline(days,average_weightyl,smoothday); % use built-in spline function for dataset to find average weight for all days of young leaves

figure;
subplot(2,1,1)
plot(day,average_weight_thirddayml,'o',days,average_weightml,'b-',smoothday,splineml,'r-');
title("Mature Leaves with Spline")
ylabel("Average Weight in mg")
xlabel("Days")
legend('Mean weight after 3 days','Data Set','Spline') % Method for building Legend is from Google Gemini
subplot(2,1,2)
plot(day,average_weight_thirddayyl,'o',days,average_weightyl,'b-',smoothday,splineyl,'r-');
title("Young Leaves with Spline")
ylabel("Average Weight in mg")
xlabel("Days")
legend('Mean weight after 3 days','Data Set','Spline') % Method for building Legend is from Google Gemini

figure;
subplot(2,1,1)
plot(day,average_weight_thirddayml,'o',days,average_weightml,'b-',smoothday,spline_average_weightml,'r-');
title("Mature Leaves with Interpolator")
ylabel("Average Weight in mg")
xlabel("Days")
legend('Mean weight after 3 days','Data Set','Interpolator') % Method for building Legend is from Google Gemini
subplot(2,1,2)
plot(day,average_weight_thirddayyl,'o',days,average_weightyl,'b-',smoothday,spline_average_weightyl,'r-');
title("Young Leaves with Interpolator")
ylabel("Average Weight in mg")
xlabel("Days")
legend('Mean weight after 3 days','Data Set','Interpolator') % Method for building Legend is from Google Gemini

[maxValue1,index1]=max(spline_average_weightml) % Method for finding the apex of plot was found on Google Gemini
maxX1=smoothday(index1) % Method for finding the day coordinate of the apex was found on Google Gemini

[maxValue2,index2]=max(spline_average_weightyl) % Method for finding the apex of plot was found on Google Gemini
maxX2=smoothday(index2) % Method for finding the day coordinate of the apex was found on Google Gemini

%% Exercise 7
years1=[2016 2017 2018 2019 2020 2021 2022 2023 2024 2025 2026]'; % Years 2016-2026
sap5001=[1918.60 2275.12 2789.80 2607.39 3278.20 3793.75 4573.82 3960.66 4804.49 5979.52 6929.12]'; 
% S&P 500 price at each year from 2016-2026, from https://www.multpl.com/s-p-500-historical-prices/table/by-year
smoothprice1=linspace(min(years1),max(years1),100);

interpolator_sap_price1=cubic_spline(years1,sap5001,smoothprice1);
spline_sap_price1=spline(years1,sap5001,smoothprice1);

figure;
subplot(3,1,1)
plot(years1,sap5001,'o',smoothprice1,spline_sap_price1,'r-',smoothprice1,interpolator_sap_price1,'b-');
title("S&P 500 from 2016-2026")
xlabel("Year")
ylabel("S&P 500")
legend('Data Set','Spline','Interpolator')

%% Exercise 8
years2=[2016 2018 2020 2022 2024 2026]'; % Years 2016-2026
sap5002=[1918.60 2789.80 3278.20 4573.82 4804.49 6929.12]'; 
% S&P 500 price at each year from 2016-2026, from https://www.multpl.com/s-p-500-historical-prices/table/by-year
smoothprice2=linspace(min(years2),max(years2),100);

interpolator_sap_price2=cubic_spline(years2,sap5002,smoothprice2);
spline_sap_price2=spline(years2,sap5002,smoothprice2);

subplot(3,1,2)
plot(years2,sap5002,'o',smoothprice2,spline_sap_price2,'r-',smoothprice2,interpolator_sap_price2,'b-');
title("S&P 500 from 2016-2026, Every Other Year")
xlabel("Year")
ylabel("S&P 500")
legend('Data Set','Spline','Interpolator')

years3=[2016 2019 2022 2025]';
sap5003=[1918.60 2607.39 4573.82 5979.52]';
smoothprice3=linspace(min(years3),max(years3),100);

interpolator_sap_price3=cubic_spline(years3,sap5003,smoothprice3);
spline_sap_price3=spline(years3,sap5003,smoothprice3);

subplot(3,1,3)
plot(years3,sap5003,'o',smoothprice3,spline_sap_price3,'r-',smoothprice3,interpolator_sap_price3,'b-');
title("S&P 500 from 2016-2026, Every 3rd Year")
xlabel("Year")
ylabel("S&P 500")
legend('Data Set','Spline','Interpolator')






