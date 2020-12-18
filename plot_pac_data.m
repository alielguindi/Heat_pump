%% This function is used to draw the data from the previous step.
%
%--------------------------------------------------------------------------
% In:    pac_data           input structure file
%        MyDate             required date
%
% Out:   pac_data            final plot
%--------------------------------------------------------------------------
% Ali                                            18/12/20
%--------------------------------------------------------------------------


%--------------------------------------------------------------------------
function plot_pac_data(pac_data,MyDate)

%% check nargin
if nargin~=2
    error('This fonction expect 2 arguments : 1. the data 2. the date to graph');
end

%% read filed names
fields=fieldnames(pac_data);

%% convert structure to cell
Data=(struct2cell(pac_data))';

%% search the required date
Data_Dates=datetime(Data(:,1));
minDate=min(Data_Dates);
maxDate=max(Data_Dates);

rows=find(strcmp(Data,MyDate));

if isempty(rows)
    error(['You have to choose a date between ' datestr(minDate) ' and ' datestr(maxDate)]);
end

%% extract data
y_values=cell2mat(Data(rows,3:end));
x_values=datetime(cell2mat(Data(rows,2)),'Format', 'HH:mm:ss');

%% used colors
colors=[0.07, 0.62, 1.00;...
        0.78, 0.53, 0.30;...
        0.07, 0.62, 1.00;...
        0.33, 0.49, 0.69;...
        0.39, 0.83, 0.07;...
        0.64, 0.08, 0.18;...
        1.00, 0.00, 0.00];
    
%% Drawing
plot(x_values,y_values(:,1)*70,'Color',colors(1,:),'LineWidth',3);alpha(0.3);hold on;
plot(x_values,y_values(:,2)*70,'Color',colors(2,:),'LineWidth',3);alpha(0.3);hold on;
plot(x_values,y_values(:,3),'Color',colors(3,:),'LineStyle','--');hold on;
plot(x_values,y_values(:,4),'Color',colors(4,:));hold on;
plot(x_values,y_values(:,5),'Color',colors(5,:));hold on;
plot(x_values,y_values(:,6),'Color',colors(6,:));hold on;
plot(x_values,y_values(:,7),'Color',colors(7,:));

%% Adjust the graph
ylim([0 70]);

datetick('x','HH:MM');


N1=['Pompe a chaleur, le ' datestr(MyDate)];
title(N1,'FontSize',16);
xlabel('Heure','FontSize',12,'FontWeight','bold');
ylabel(['Temperature [' char(176) 'C]'],'FontSize',12,'FontWeight','bold');
legend('mode eau chaude sanitaire','mode chauffage','temperature eau chaude sanitaire',...
    'temperature air exterieur','consigne chauffage retour','temperature chauffage entrÈe','temperature chauffage retour');
grid on;

hold off;


end