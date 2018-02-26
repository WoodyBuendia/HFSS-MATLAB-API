% -------------------------------------------------------------------------- %
% function    hfssSetWCS(fid, Name)
%
% Description:
% ------------
% Create a hfss SetWCS in HFSS. This function also provides 
% an option to punch a bunch of (circular) holes into the polygon object (so
% as to make way for cables, wires, etc.,).
%

% You should have received a copy of the GNU General Public License along with
% Foobar; if not, write to the Free Software Foundation, Inc., 59 Temple 
% Place, Suite 330, ShangHai, CN  20171222
% Copyright 2018, WoodyBuendia (woodybuendia@gmail.com)
function hfssSetWCS(fid, Name)
%oEditor.SetWCS Array("NAME:SetWCS Parameter", "Working Coordinate System:=", "RelativeCS1")
fprintf(fid, '\n');
fprintf(fid, 'Set oEditor = oDesign.SetActiveEditor("3D Modeler") \n');
fprintf(fid, 'oEditor.SetWCS Array("NAME:SetWCS Parameter", _\n');
fprintf(fid, '"Working Coordinate System:=", "%s")', Name);
fprintf(fid, '\n');
end