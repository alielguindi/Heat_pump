%% This function is used to arrange the data to a structure format.
%
%--------------------------------------------------------------------------
% In:    filename0           input *.csv file
%
% Out:   pac_data            final data list
%--------------------------------------------------------------------------
% Ali                                            18/12/20
%--------------------------------------------------------------------------
%       
%--------------------------------------------------------------------------
% Notes: none
%--------------------------------------------------------------------------
function pac_data=read_pac_data(filename0)

%% check nargin
if nargin~=1
    error('This function expect the name of the file to be read as argument');
end

%% open filename
fid=fopen(filename0,'r');

%% If the file does not exist
if fid==-1
    error(['File does not exist : ' filename0]);
end

%% read header
Header_line=fgetl(fid);
outHeader=regexp(Header_line,',','split');
for ii=2:8
    outHeader1{ii+1}=outHeader{ii};
end
outHeader1{1}=[outHeader{1} '_1'];
outHeader1{2}=[outHeader{1} '_2'];

%% read data
i=1;
while feof(fid)~=1
    current_line=fgetl(fid);
    Filelines{i}=current_line;
    out=regexp(current_line,',','split');
    Dateout=out{1};
    Dateout=regexp(Dateout,' ','split');
    Data{i,1}=Dateout{1,1};
    Data{i,2}=Dateout{1,2};
    
    for ii=3:9
        Data{i,ii}=out{1,ii-1};
        if i==1
            Data{i,ii}=sscanf(Data{i,ii},'%f');
        end
        
        if i>1 && isempty(Data{i,ii})==1
            Data{i,ii}=Data{i-1,ii};
        elseif i>1 && isempty(Data{i,ii})~=1
            Data{i,ii}=sscanf(Data{i,ii},'%f');
        end
        
    end
    i=i+1;
end

fclose('all');

%% Final results
pac_data=cell2struct(Data,outHeader1,2);
end
