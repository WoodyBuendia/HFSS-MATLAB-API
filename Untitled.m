clear all;  
 clc;
false = 0;  
true = 1;  
 
% HFSS执行路径  
hfssExePath = '"D:\program\hfss\HFSS14.0\Win64\hfss.exe"';  
 
% 临时文件路径  
tmpPrjFile = 'E:my_conicalhorn_3.6GHz.hfss';  
%tmpDataFile = 'E:\ansoft\temp\tmpData.dat';  
tmpScriptFile = 'E:my_conicalhorn_3.6GHz.vbs';  
 
unit = 'mm'; % 单位设置  
freq = 3.6e9; % 工作频率  
lambda = 0.3e9/freq; % 工作波长  
 
% 圆柱波导尺寸  
wgr = 62.5; % 波导半径  
wgh = 125; % 波导长度  
 
% 小圆台尺寸  
sbr = wgr; % 底半径  
str = 100; % 顶半径  
sh = 150; % 高度  
 
% 过渡圆波导  
gwgr = str;  
gwgh = 100;  
 
% 大圆台尺寸  
bbr = gwgr; % 底半径  
btr = 300; % 顶半径  
bh = 1000; % 高度  
 
% 小圆片尺寸  
ssr = wgr; % 圆片半径  
ssh = -1; % 圆片高度  
 
% 创建一个新的HFSS临时脚本文件  
fid = fopen('D:\tmpScriptFile.vbs', 'wt'); % 'wt'表示以文本模式打开文件，可写，覆盖原有内容  
 
% 创建一个新的工程并插入一个新的设计  
hfssNewProject(fid);  
hfssInsertDesign(fid, 'conicalhorn_3.6GHz');  
 
% 创建圆柱波导  
hfssCylinder(fid, 'Cylinder1', 'Z', [0, 0, 0], wgr, wgh, unit);  
 
% 创建小圆台  
hfssCone(fid, 'Cone1', 'Z', [0, 0, wgh], sbr, str, sh, unit);  
 
% 创建过渡波导  
hfssCylinder(fid, 'Cylinder2', 'Z', [0, 0, (wgh+sh)], gwgr, gwgh, unit);  
 
% 创建大圆台  
hfssCone(fid, 'Cone2', 'Z', [0, 0, (wgh+sh+gwgh)], bbr, btr, bh, unit);  
 
% 组合圆柱和圆台  
hfssUnite(fid, {'Cylinder1','Cone1','Cylinder2','Cone2'});  
 
% 设置边界条件PE  
hfssAssignPE_face(fid, 'horn_pec', [7,16,25,34]);  
 
% 喇叭尾部小圆片  
hfssCylinder(fid, 'small_Cylinder', 'Z', [0, 0, 0], ssr, ssh, unit);  
 
% 设置圆片的材料为pec  
hfssAssignMaterial(fid, 'small_Cylinder', 'pec');  
 
% 创建辐射圆柱  
hfssCylinder(fid, 'Cylinder_Radiation', 'Z', [0, 0, ssh], (btr+lambda/4.0*1000), (wgh+sh+gwgh+bh+lambda/4.0*1000), unit);  
 
% 添加辐射边界条件  
hfssAssignRadiation(fid, 'Radiation', 'Cylinder_Radiation');  
 
% 添加激励waveport  
hfssAssignWaveport_face(fid, 'waveport', 8, 1, true, [0,-wgr,0], [0,wgr,0], unit);  
 
% 添加求解安装  
hfssInsertSolution(fid, 'horn_solve', freq/1e9);  
 
% 设置远场球坐标系  
hfssFarFieldSphere(fid, 'FFSphere', -180, 180, 2, 0, 360, 2);  
 
% 求解计算  
%hfssSolveSetup(fid, 'horn_3.6GHz');  
 
% 保存工程到临时文件夹  
hfssSaveProject(fid, tmpPrjFile, true);  
 
% 关闭HFSS脚本文件  
fclose(fid);  
 
% 利用HFSS执行脚本程序  
%disp('Solving using HFSS ...');  
%hfssExecuteScript(hfssExePath, tmpScriptFile);