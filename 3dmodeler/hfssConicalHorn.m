function hfssConicalHorn(fid, Name, Center, Waveguide, Horn, Wall_T, Units)
% Creates the VB Script necessary to create a Conical Horn wiht Circle Waveguide in HFSS.
%Waveguide=[Waveguide_Radius,
%Waveguide_length];Horn=[Horn_R,Horn_L];Wall_T is Wall_Thickness
Waveguide_R = Waveguide(1);
Waveguide_L = Waveguide(2);
Horn_R = Horn(1);
Horn_L = Horn(2);

hfssaddVar(fid,'Waveguide_R',Waveguide_R,Units)
hfssaddVar(fid,'Waveguide_L',Waveguide_L,Units)
hfssaddVar(fid,'Horn_R',Horn_R,Units)
hfssaddVar(fid,'Horn_L',Horn_L,Units)
hfssaddVar(fid,'Wall_T',Wall_T,Units)
%% Waveguide

Name_1 = 'Waveguide_in';

Axis = 'Z';
Radius = 'Waveguide_R';
Height = 'Waveguide_L';
hfssCylinder(fid, Name_1, Axis, Center, Radius, Height, Units)

Name_2 = 'Waveguide';
Radius = 'Waveguide_R + Wall_T';
hfssCylinder(fid, Name_2, Axis, Center, Radius, Height, Units)

hfssSubtract(fid, Name_2, Name_1)
%% Horn
%
Name_1 = 'Horn_in';

Center = reshape(Center, length(Center), 1);
if iscell(Center)
    1;
else
    Center = mat2cell(Center,[1,1,1],1);
end

Center_Horn = Center;
Center_Horn{3,1} = strcat(num2str(Center{3,1}),Units,'+Waveguide_L');
Axis = 'Z';
Radius = 'Waveguide_R';
hfssCircle(fid, Name_1, Axis, Center_Horn, Radius, Units)

Name_2 = 'Horn_In_up';
Center_Horn_up = Center;
Center_Horn_up{3,1} = strcat(num2str(Center{3,1}),Units,'+Waveguide_L+Horn_L');
Axis = 'Z';
Radius = 'Horn_R';
hfssCircle(fid, Name_2, Axis, Center_Horn_up, Radius, Units)

hfssConnect(fid, {Name_1, Name_2})

%
Name_1 = Name;
Axis = 'Z';
Radius = 'Waveguide_R + Wall_T';
hfssCircle(fid, Name_1, Axis, Center_Horn, Radius, Units)

Name_2 = 'Horn_up';
Axis = 'Z';
Radius = 'Horn_R + Wall_T';
hfssCircle(fid, Name_2, Axis, Center_Horn_up, Radius, Units)

hfssConnect(fid, {Name_1, Name_2})

hfssSubtract(fid, Name, 'Horn_in')
%% Unit waveguide and horn
hfssUnite(fid, Name, 'Waveguide')
hfssAssignMaterial(fid, Name, 'pec')
