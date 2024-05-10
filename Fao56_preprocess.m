% Fao56_preprocess
% this was developed to try to fix issues related to my fao56 CRONOS
% implementation


%% file nav
clear all
clc

cd('E:\My Drive\GitHub\CRONOS_Fao56_adjustment');
data_raw = readtable("OK004.txt","Delimiter",',');
%% ranged data

start_date = datetime(2021,10,15);
end_date = datetime(2022,03,15);

i = isbetween(data_raw.TIMESTAMP,start_date,end_date);
ranged_data = data_raw(i,:);

%% QC

% solar flux
k = ranged_data.solar_flux_density_Avg < 0;
ranged_data.solar_flux_density_Avg(k) = nan;

% precip
k = ranged_data.precipitation_Tot < 0;
ranged_data.precipitation_Tot(k) = nan;

% wind speed
k = ranged_data.wind_speed_Avg < 0;
ranged_data.wind_speed_Avg(k)  = nan;

%air_temp
k = ranged_data.air_temperature_Avg  < -30 | ranged_data.air_temperature  >50;
ranged_data.air_temperature_Avg(k) = nan;

%vap
k = ranged_data.vapor_pressure_Avg < 0;
ranged_data.vapor_pressure_Avg(k) = nan;

%realative humidity
k = ranged_data.relative_humidity_Avg < 0;
ranged_data.relative_humidity_Avg(k) = nan;

table_needed = ranged_data(:,["TIMESTAMP","solar_flux_density_Avg","precipitation_Tot","wind_speed_Avg","air_temperature_Avg","vapor_pressure_Avg","relative_humidity_Avg"]);
%table_needed.Properties.VariableNames = {"Year-DOY" ,  "Srad" ,  "Tmax"  , "Tmin"  , "Vapr"  , "Tdew" , "RHmax" , "RHmin"  ,"Wndsp" ,  "Rain" }

%% groups

max = groupsummary(table_needed, "TIMESTAMP",["day"],"max");
min = groupsummary(table_needed, "TIMESTAMP",["day"],"min");
avg = groupsummary(table_needed, "TIMESTAMP",["day"],"mean");
sum = groupsummary(table_needed, "TIMESTAMP",["day"],"sum");

%% ET (Pankaj Dey, 2018)
lat = 	35.05;
for i = 1:height(max)
    jd = juliandate(datetime(string(max.day_TIMESTAMP(i)),'InputFormat','dd-MMM-yyyy'));
    phi=(pi/180)*lat; % lat is input
    % Computation of Relative earth-sun distance
    dr=1+0.033*cos((2*pi/365)*(jd));
    % Compuatation of Solar declination in radians
    delta=0.4093*sin((2*pi/365)*(jd)-1.405); % jd is julian day
    % Computation of Sunset hour angle
    ws=acos(-tan(phi)*tan(delta));  % in radians
    % Computation of extra terrestrial radiation in MJ/mm2.day
    S0=37.62*(dr)*(ws*sin(phi)*sin(delta)+cos(delta)*cos(phi)*sin(ws));
    % Computation of Mean daily temperature
    t_mean=(max.max_air_temperature_Avg + min.min_air_temperature_Avg )/2;  % t_max and t_min are input data
    % lambda: latent heat of vaporisation
    lambda=2.501 - (2.361*10^-3)*t_mean; % MJ/kg
    % Potential Evapotranspiration in mm/day
    pet(i)=(1/lambda)*(S0)*((t_mean+5)/-68);
end
%% wth weather data
wth = table;
%wth.year_DOY = datetime(string(max.day_TIMESTAMP),'InputFormat','dd-MMM-yyyy','Format','yyyy-DDD'); 
wth.Srad = sum.sum_solar_flux_density_Avg;
wth.Tmax = max.max_air_temperature_Avg;
wt.Tmin = min.min_air_temperature_Avg;
wth.Vapr = avg.mean_vapor_pressure_Avg;
wth.Tdew = avg.mean_air_temperature_Avg-((100-avg.mean_relative_humidity_Avg)/5);
wth.RHmax = max.max_relative_humidity_Avg;
wth.RHmin = min.min_relative_humidity_Avg;
wth.Wndsp = avg.mean_wind_speed_Avg;
wht.Rain = sum.sum_precipitation_Tot;
wth.ETref = pet';
wth.MorP = repmat('M',height(wth),1);

writetable(wth,'wth_data.txt','Delimiter',' ');

