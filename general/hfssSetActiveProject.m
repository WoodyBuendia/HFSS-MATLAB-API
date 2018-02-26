% -------------------------------------------------------------------------- %
% function    hfssSetActiveProject(fid,fileName,DesignName)
%
% Description:
% ------------
% SetActiveProject with a opened porject in HFSS. 
%
% You should have received a copy of the GNU General Public License along with
% Foobar; if not, write to the Free Software Foundation, Inc., 59 Temple 
% Place, Suite 330, ShangHai, CN  20180208
% Copyright 2018, WoodyBuendia (woodybuendia@gmail.com)
function hfssSetActiveProject(fid, hfssProjectFile, DesignName)
[Path, projectName, Ext] = fileparts(hfssProjectFile);

% Check extension.
if (~strcmp(Ext, '.hfss'))
	warning('File Extension is not .hfss !');
end;

% Preamble.
fprintf(fid, 'Dim oHfssApp\n');
fprintf(fid, 'Dim oDesktop\n');
fprintf(fid, 'Dim oProject\n');
fprintf(fid, 'Dim oDesign\n');
fprintf(fid, 'Dim oEditor\n');
fprintf(fid, 'Dim oModule\n');
fprintf(fid, '\n');
fprintf(fid, 'Set oHfssApp  = CreateObject("AnsoftHfss.HfssScriptInterface")\n');
fprintf(fid, 'Set oDesktop = oHfssApp.GetAppDesktop()\n');
fprintf(fid, 'oDesktop.RestoreWindow\n');
fprintf(fid, 'Set oProject = oDesktop.SetActiveProject("%s")\n', projectName);
fprintf(fid, 'Set oDesign = oProject.SetActiveDesign("%s")\n', DesignName);