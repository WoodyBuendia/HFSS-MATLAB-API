HFSS-MATLAB-SCRIPTING-API
=========================
HFSS-MATLAB-API 使用教程 By WoodyBuendia
http://woodybuendia.site/?p=155
根据HFSS 15版本帮助文件介绍，HFSS软件使用Microsoft®Visual Basic® Scripting Edition (VBScript)脚本语言记录宏指令。

一方面，在打开HFSS软件进行一些造作时，如果选择Tools——Record Script to file，新建一个.vbs后缀的脚本文件，可以将所有的操作记录在新建的脚本中；另一方面可以编写符合格式的脚本文件，通过Tools——Run Script来让HFSS软件运行编写好的脚本。

在一些特定的场景，事先编写脚本让HFSS执行相关操作，是非常高效和准确的，可以节省大量的重复性造作；不仅如此，在有些情况下，由于建模过于复杂或者模型变量需要通过第三方优化算法相互调用，那么只能使用编写脚本的方法才能完成。

在这个最简单的脚本中，可以看到即使是新建一个圆面的操作，需要的脚本也是比较多和复杂的，如果手动一行行敲入这些脚本代码，一方面过于冗长难免出现各种错误，另一方面也无法实现提高效率的初衷。

好在前辈们给出了一些简便的方法，可以将重复性的操作变成可以调用的函数，将需要指定的相关参数作为输入，通过相关编程语言自动完成vbs脚本文件。这些操作可以通过MATLAB或者Python完成，本文介绍的HFSS-MATLAB API就是通过MATLAB编写一套可调用的程序库，通过编写MATLAB代码来生成所需的vbs脚本。
Introdution
-----------

HFSS-MATLAB-API is a library toolbox to control Ansoft HFSS from MATLAB using 
the HFSS Scripting Interface. This tool provides a set of MATLAB functions to 
create 3D objects in HFSS by generating the required HFSS Scripts. Basically, 
anything that can be done in HFSS user interface and the 3D Modeler can be 
done with this library of functions. Once a script is generated in this 
manner, it can be run in HFSS to generate the 3D model, solve it and export 
the data. You create your entire design in MATLAB and basically use HFSS to 
solve it.

Files:
------
All the files are organized in the following directories.

3dmodeler/ - contains m-files that generate VBScripts for the 3D-Modeler.
analysis/ - contains m-files for Analysis (Setup/Solve/Export).
boundary/ - contains m-files for setting up boundaries.
doc/ - contains the HTML documentation.
examples/ - contains example usage m-files.
general/ - contains files for operations such as File Open/Save/Close, and 
           Project Create/Save/Make Active etc.,

For questions and comments, please contact me.

Author:
-------
Vijay Ramasami,
RSL, Univ. of Kansas,
Lawrence, KS, 66046.
E-Mail: rvijayc@gmail.com, rvc@ieee.org

Author:
-------
Wu Di,
CN, ShangHai,
E-Mail: woodybuendia@gmail.com, tinywoody@126.com
