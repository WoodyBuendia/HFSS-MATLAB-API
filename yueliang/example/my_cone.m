% 利用软件包创建一个圆台

clear all;

false = 0;
true = 1;

% 圆台尺寸
br = 0.5; % 底半径
tr = 1.0; % 顶半径
h = 2.0; % 高度

% 临时文件路径
tmpPrjFile = 'E:\ansoft\temp\my_cone.hfss';
% tmpDataFile = 'E:\ansoft\temp\tmpData.m';
tmpScriptFile = 'E:\ansoft\temp\my_cone.vbs';

% HFSS执行路径
hfssExePath = 'D:\"Program Files"\Ansoft\HFSS11\hfss.exe';

    % 创建一个新的HFSS临时脚本文件
    fid = fopen(tmpScriptFile, 'wt'); % 'wt'表示以文本模式打开文件，可写，覆盖原有内容 

	% 创建一个新的工程并插入一个新的设计
	hfssNewProject(fid);
	hfssInsertDesign(fid, 'cone_test');

	% 创建圆台
	hfssCone(fid, 'Cone', 'Z', [0, 0, 0], br, tr, h, 'mm');

	% 保存工程到临时文件夹
	hfssSaveProject(fid, tmpPrjFile, true);

	% 关闭HFSS脚本文件
	fclose(fid);