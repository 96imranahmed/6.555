function varargout = Reg_Lab(varargin)
% REG_LAB M-file for Reg_Lab.fig
%      REG_LAB, by itself, creates a new REG_LAB or raises the existing
%      singleton*.
%
%      H = REG_LAB returns the handle to a new REG_LAB or the handle to
%      the existing singleton*.
%
%      REG_LAB('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in REG_LAB.M with the given input arguments.
%
%      REG_LAB('Property','Value',...) creates a new REG_LAB or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before reg2dgui2_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Reg_Lab_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Reg_Lab

% Last Modified by GUIDE v2.5 27-Jan-2016 09:29:27

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Begin initialization code - DO NOT EDIT
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Reg_Lab_OpeningFcn, ...
                   'gui_OutputFcn',  @Reg_Lab_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes just before Reg_Lab is made visible.
function Reg_Lab_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Reg_Lab (see VARARGIN)

% Choose default command line output for Reg_Lab
handles.output = hObject;

colormap gray
axes(handles.axes2);image(0);axis off;
axes(handles.axes3);image(0);axis off;
axes(handles.axes4);axis off;
axes(handles.axes5);axis off;
handles.contrnum = 0.5; % Old 0.01
handles.bGoing =0;
handles.nonlinx = zeros(4);
handles.nonliny = zeros(4);
handles.dxsource = 0;handles.dysource =0;handles.dytar=0;handles.dysource=0;
handles.of = 7; % For Matching score!;
set(handles.of_menu, 'Value', handles.of);
%contents = get(handles.of_menu,'String');
handles.of_string = '(Generic Cost)';
handles.limits_set = 0; % First time to set the limits!
% Select Enable options:
handles = enable_disable_buttons(handles);
set(handles.comment_text, 'String', 'Click on the Source and Target images to load them!');
handles.n_iter = 5;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Reg_Lab wait for user response (see UIRESUME)
%uiwait(handles.figure1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Outputs from this function are returned to the command line.
function varargout = Reg_Lab_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
%varargout{1} = handles.output;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on button press in ckx.
function ckx_Callback(hObject, eventdata, handles)
% hObject    handle to ckx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ckx

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on button press in cky.
function cky_Callback(hObject, eventdata, handles)
% hObject    handle to cky (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of cky

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% --- Executes on button press in ckr.
function ckr_Callback(hObject, eventdata, handles)
% hObject    handle to ckr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ckr

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on button press in cksx.
function cksx_Callback(hObject, eventdata, handles)
% hObject    handle to cksx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of cksx

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on button press in cksy.
function cksy_Callback(hObject, eventdata, handles)
% hObject    handle to cksy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of cksy

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on button press in ckshx.
function ckshx_Callback(hObject, eventdata, handles)
% hObject    handle to ckshx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ckshx

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on button press in ckshy.
function ckshy_Callback(hObject, eventdata, handles)
% hObject    handle to ckshy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ckshy

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% End of initialization code
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Registration optimisation: Can Edit
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on button press in pbstart.
function pbstart_Callback(hObject, eventdata, handles)
% hObject    handle to pbstart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

bSimplex = get(handles.simplex_button,'Value');

handles = redraw(handles); %update to reflect the values we currently have

%make the start button say 'Stop' if we're not running, otherwise stop
%running
set(handles.pbstart,'String','Stop');
guidata(hObject,handles);
if(handles.bGoing == 1) 
    handles.bGoing = 0;
    set(handles.pbstart,'String','Start');
    set(handles.comment_text, 'String', 'The automatic registration process stopped!');
    guidata(hObject, handles);
    return
else
    handles.bGoing = 1;
    guidata(hObject, handles);
end

try
    if ~bSimplex 
        handles = opt_alternation(handles);
    else
        for ii=1:1
            handles = simplex_downhill(handles);
        end
    end
    %set(handles.comment_text, 'String', 'The automatic registration process stopped!');
catch
    set(handles.comment_text, 'String', 'The automatic registration process has failed!');
end
handles = redraw(handles);

%change the button back as we've finished
set(handles.pbstart,'String','Start');
handles.bGoing = 0;
guidata(hObject, handles); 
return;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function psum = get_psum(p)

    psum=zeros(size(p,2),1);
    
    for j=1:size(p,2)
       psum(j) = sum(p(:,j));   
    end
return;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% End of optimisation code. Do not edit from here.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function edmanx_Callback(hObject, eventdata, handles)
% hObject    handle to edmanx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edmanx as text
%        str2double(get(hObject,'String')) returns contents of edmanx as a double

handles = redraw(handles);guidata(hObject,handles);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% --- Executes during object creation, after setting all properties.
function edmanx_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edmanx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function edmany_Callback(hObject, eventdata, handles)
% hObject    handle to edmany (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edmany as text
%        str2double(get(hObject,'String')) returns contents of edmany as a double

handles = redraw(handles);guidata(hObject,handles);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes during object creation, after setting all properties.
function edmany_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edmany (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function edmanscx_Callback(hObject, eventdata, handles)
% hObject    handle to edmanscx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edmanscx as text
%        str2double(get(hObject,'String')) returns contents of edmanscx as a double

handles = redraw(handles);guidata(hObject,handles);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes during object creation, after setting all properties.
function edmanscx_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edmanscx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function edmanscy_Callback(hObject, eventdata, handles)
% hObject    handle to edmanscy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edmanscy as text
%        str2double(get(hObject,'String')) returns contents of edmanscy as a double

handles = redraw(handles);guidata(hObject,handles);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes during object creation, after setting all properties.
function edmanscy_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edmanscy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function edmanrxy_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double

handles = redraw(handles);guidata(hObject,handles);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes during object creation, after setting all properties.
function edmanrxy_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function edmanshx_Callback(hObject, eventdata, handles)
% hObject    handle to edmanshx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edmanshx as text
%        str2double(get(hObject,'String')) returns contents of edmanshx as a double

handles = redraw(handles);guidata(hObject,handles);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes during object creation, after setting all properties.
function edmanshx_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edmanshx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function edmanshy_Callback(hObject, eventdata, handles)
% hObject    handle to edmanshy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edmanshy as text
%        str2double(get(hObject,'String')) returns contents of edmanshy as a double

handles = redraw(handles);guidata(hObject,handles);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes during object creation, after setting all properties.
function edmanshy_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edmanshy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on button press in reset_button.
function reset_button_Callback(hObject, eventdata, handles)
% hObject    handle to reset_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.edmanx, 'String', num2str(0));
set(handles.edmany, 'String', num2str(0));
set(handles.edmanrxy, 'String', num2str(0));
set(handles.edmanscx, 'String', num2str(1));
set(handles.edmanscy, 'String', num2str(1));
set(handles.edmanshx, 'String', num2str(0));
set(handles.edmanshy, 'String', num2str(0));
set(handles.comment_text, 'String', '');
handles = redraw(handles);
guidata(hObject,handles);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes during object creation, after setting all properties.
function edxlmax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edxlmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes during object creation, after setting all properties.
function edylmax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edylmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes during object creation, after setting all properties.
function edrlmin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edrlmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes during object creation, after setting all properties.
function edrlmax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edrlmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes during object creation, after setting all properties.
function edsxlmax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edsxlmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes during object creation, after setting all properties.
function edsylmin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edsylmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% --- Executes during object creation, after setting all properties.
function edsylmax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edsylmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes during object creation, after setting all properties.
function edshxlmin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edshxlmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% --- Executes during object creation, after setting all properties.
function edshxlmax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edshxlmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes during object creation, after setting all properties.
function edshylmin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edshylmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes during object creation, after setting all properties.
function edshylmax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edshylmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on button press in pbleft.
function pbleft_Callback(hObject, eventdata, handles)
% hObject    handle to pbleft (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val = str2num(get(handles.edmanx,'String'))-1;
set(handles.edmanx,'String',val);
handles = redraw(handles);guidata(hObject,handles);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on button press in pbright.
function pbright_Callback(hObject, eventdata, handles)
% hObject    handle to pbright (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val = str2num(get(handles.edmanx,'String'))+1;
set(handles.edmanx,'String',val);
handles = redraw(handles);guidata(hObject,handles);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on button press in pbup.
function pbup_Callback(hObject, eventdata, handles)
% hObject    handle to pbup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%h = findobj('Tag','edmanx');
val = str2num(get(handles.edmany,'String'))-1;
set(handles.edmany,'String',val);
handles = redraw(handles);guidata(hObject,handles);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on button press in pbdown.
function pbdown_Callback(hObject, eventdata, handles)
% hObject    handle to pbdown (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val = str2num(get(handles.edmany,'String'))+1;
set(handles.edmany,'String',val);
redraw(handles);guidata(hObject,handles);
return
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on button press in pbscalexup.
function pbscalexup_Callback(hObject, eventdata, handles)
% hObject    handle to pbscalexup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val = str2num(get(handles.edmanscx,'String'))+.05;
set(handles.edmanscx,'String',val);
handles = redraw(handles);guidata(hObject,handles);
return
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on button press in pbscaleyup.
function pbscaleyup_Callback(hObject, eventdata, handles)
% hObject    handle to pbscaleyup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val = str2num(get(handles.edmanscy,'String'))+.05;
set(handles.edmanscy,'String',val);
handles = redraw(handles);guidata(hObject,handles);
return
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on button press in pbscalexdown.
function pbscalexdown_Callback(hObject, eventdata, handles)
% hObject    handle to pbscalexdown (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val = str2num(get(handles.edmanscx,'String'))-.05;
set(handles.edmanscx,'String',val);
handles = redraw(handles);guidata(hObject,handles);
return
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on button press in pbscaleydown.
function pbscaleydown_Callback(hObject, eventdata, handles)
% hObject    handle to pbscaleydown (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val = str2num(get(handles.edmanscy,'String'))-.05;
set(handles.edmanscy,'String',val);
handles = redraw(handles);guidata(hObject,handles);
return
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on button press in pbrminus.
function pbrminus_Callback(hObject, eventdata, handles)
% hObject    handle to pbrminus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val = str2num(get(handles.edmanrxy,'String'))-1;
set(handles.edmanrxy,'String',val);
redraw(handles);guidata(hObject,handles);
return
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on button press in pbrplus.
function pbrplus_Callback(hObject, eventdata, handles)
% hObject    handle to pbrplus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val = str2num(get(handles.edmanrxy,'String'))+1;
set(handles.edmanrxy,'String',val);
handles = redraw(handles);guidata(hObject,handles);
return
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% --- Executes on mouse press over figure background, over a disabled or
% --- inactive control, or over an axes background.
function figure1_WindowButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    cp=get(hObject,'CurrentPoint');
    axessrc=get(handles.axes2,'Position');
    axestgt=get(handles.axes3,'Position');
    axescmb=get(handles.axes4,'Position');
    
    posfigure=get(hObject,'Position');
    
    if(testhit(cp,axessrc,posfigure) == 1)
        LoadImage('source',hObject,handles);
    elseif(testhit(cp,axestgt,posfigure)==1)
        LoadImage('target',hObject,handles);
    elseif(testhit(cp,axescmb,posfigure)==1)
        if(strcmp(get(hObject,'SelectionType'),'alt')==1) handles.contrnum = handles.contrnum - 0.002;else 
            handles.contrnum = handles.contrnum + 0.002;end;
        if(handles.contrnum <= 0) handles.contrnum = 0.001;end;
        %if(handles.contrnum > 0.2) handles.contrnum = 0.005; end
        %redraw(handles);
    end
%        [filename, pathname] = uigetfile('*.png; *.gif; *.bmp; *.jpg; *.tif', 'Choose the image you want to load');
%                             filename = strcat(pathname, filename);
% 
%                             img = double(imread(filename));
%                             img = img(:,:,1);
%                             handles.imgsrc = img;
%                         
%                             axes(hObject);imagesc(img);colormap(gray);
%                             guidata(hObject, handles);
return

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function out = testhit(point, position, windowposition)
    out = 0;

    %convert position = left,bottom,width,height
    % to left, bottom, right, top in windowposition coords
    pos2 = position;
    pos2(1) = position(1);%left
    pos2(2) = position(2); %bottom
    pos2(3) = position(1) + position(3); %right
    pos2(4) = pos2(2) + position(4); %top
    if( (point(1) >= pos2(1)) && (point(1) <= pos2(3)) && (point(2) >= pos2(2)) && (point(2) <= pos2(4)))
        out = 1;
    end
return

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function LoadImage(where,hObject,handles)
    
    [filename, pathname] = uigetfile('*.png; *.gif; *.bmp; *.jpg; *.tif; *.tiff', 'Choose the image you want to load');
    if ~ischar(filename) & (filename == 0)
        return
    end
    filename = fullfile(pathname, filename);

    %filename = spm_select(1, {'.png; .gif; .bmp; .jpg; .tif'}, 'Choose the image you want to load');
    
    img = double(imread(filename));
    img = img(:,:,1);img=img/max(img(:)); 
    
    if(strcmp(where,'source')==1)
        handles.imgsrc = img;
        handles.imgrawsrc = img;
        axes(handles.axes2);imagesc(img);colormap(gray);axis off;title('');
        handles.imgcur = img;
    end
    
    if(strcmp(where,'target')==1)
        handles.imgtar = img;
        handles.imgtarcur = img;
        axes(handles.axes3);imagesc(img);colormap(gray);axis off;title(''); 
    end
    
    if(isfield(handles,'imgsrc') && isfield(handles,'imgtar'))
        sizesrc = size(handles.imgrawsrc);
        sizetar = size(handles.imgtar);

        minsize(1) = max(sizesrc(1),sizetar(1));
        minsize(2) = max(sizesrc(2),sizetar(2));

        handles.imgsrc = handles.imgrawsrc;
        handles.imgtarcur = handles.imgtar;

        dxsource = 0;dysource =0;dytar=0;dxtar=0;
        %check source image
        if (sizesrc(1) < minsize(1))

            handles.imgsrc(sizesrc(1):minsize(1),:)=0;
            %handles.imgsrc = shift(handles.imgsrc,0,-(minsize(1)-sizesrc(1))/2);
            dysource = minsize(1) - sizesrc(1);
        end

        if (sizesrc(2) < minsize(2))
            handles.imgsrc(:,sizesrc(2):minsize(2))=0;
            dxsource = minsize(2) - sizesrc(2);
            %handles.imgsrc = shift(handles.imgsrc,-(minsize(2)-sizesrc(2))/2,0);
        end

        %check target image
        if (sizetar(1) < minsize(1))
            handles.imgtarcur(sizetar(1):minsize(1),:)=0;
            dytar = minsize(1) - sizetar(1);
            %handles.imgtarcur = shift(handles.imgtarcur,0,-(minsize(1)-sizetar(1))/2);
        end

        if (sizetar(2) < minsize(2))
            handles.imgtarcur(:,sizetar(2):minsize(2))=0;
            dxtar = minsize(2) - sizetar(2);
            %handles.imgtarcur = shift(handles.imgtarcur,-(minsize(2)-sizetar(2))/2,0);
        end

        if(dxsource > 0 || dysource > 0) 
            
            handles.imgsrc = afftrans_mit(handles.imgsrc,[dxsource, dysource, 0, 1, 1, 0, 0],0,0);
            
        end
        
        if(dytar > 0 || dxtar > 0)
            
            handles.imgtarcur = afftrans_mit(handles.imgtarcur,[dxtar, dytar, 0, 1, 1, 0, 0],0,0);
            
        end 
        
            handles.A(1) = str2double(get(handles.edmanx,'String'));
            handles.A(2) = str2double(get(handles.edmany,'String'));
            handles.A(3) = str2double(get(handles.edmanrxy,'String'));
            handles.A(4) = str2double(get(handles.edmanscx,'String'));
            handles.A(5) = str2double(get(handles.edmanscy,'String'));
            handles.A(6) = str2double(get(handles.edmanshx,'String'));
            handles.A(7) = str2double(get(handles.edmanshy,'String'));
            handles.imgcur = abs(afftrans_mit(handles.imgsrc, handles.A,handles.nonlinx,handles.nonliny));
            axes(handles.axes4)
            %image(abs(toverlay2(handles.imgtarcur,handles.imgcur,handles.contrnum,[0 255 0],jet)));
            image(cat(3, min(1,2*(1-handles.contrnum))*handles.imgtarcur, min(1,2*(handles.contrnum))*handles.imgcur, zeros(size(handles.imgcur))));
            axis image
            axis off
            set(handles.registration_panel, 'Visible', 'On');
            set(handles.of_panel, 'Visible', 'On');
            set(handles.transparency_panel, 'Visible', 'On');
            set(handles.pbsavecomb, 'Visible', 'On');
            set(handles.current_value_text, 'Visible', 'On');
            set(handles.off_button, 'Value', 1);
            map3d_visualization_panel_SelectionChangeFcn(handles.off_button, [], handles);
            reset_button_Callback(handles.reset_button, [], handles);
            handles = redraw(handles);
    end
      
 guidata(hObject,handles)
return

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function handles = redraw(handles)
if(isfield(handles,'imgsrc') && isfield(handles,'imgtarcur'))
    handles.A(1) = str2double(get(handles.edmanx,'String'));
    handles.A(2) = str2double(get(handles.edmany,'String'));
    handles.A(3) = str2double(get(handles.edmanrxy,'String'));
    handles.A(4) = str2double(get(handles.edmanscx,'String'));
    handles.A(5) = str2double(get(handles.edmanscy,'String'));
    handles.A(6) = str2double(get(handles.edmanshx,'String'));
    handles.A(7) = str2double(get(handles.edmanshy,'String'));
    
    %handles.imgcur = abs(afftrans_mit(handles.imgsrc, handles.A, handles.nonlinx,handles.nonliny));
    if get(handles.on_button, 'Value')
        handles.imgcur = abs(afftrans_mit(handles.imgsrc, handles.params));
    else
        handles.imgcur = abs(afftrans_mit(handles.imgsrc, handles.A));
    end
    handles.imgcur = abs(handles.imgcur)/max(handles.imgcur(:));
    
    axes(handles.axes4)
    %image(abs(toverlay2(handles.imgtarcur,handles.imgcur,handles.contrnum,[0 255 10],jet)));
    image(cat(3, min(1,2*(1-handles.contrnum))*handles.imgtarcur, min(1,2*(handles.contrnum))*handles.imgcur, zeros(size(handles.imgcur))));
    axis image
    axis off
    %currentm = mi3(handles.imgtarcur, handles.imgcur, 64, 64);
    currentm = of(handles.of, handles.imgtarcur, handles.imgcur);
    set(handles.textnmi,'String',sprintf('%.5f %s', currentm, handles.of_string));
    limits_menu_Callback(handles.limits_menu, [], handles);
    guidata(handles.axes2,handles);
end
return

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over pbup.
function pbup_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to pbup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val = str2double(get(handles.edmany,'String'))-2;
set(handles.edmany,'String',val);
handles = redraw(handles);guidata(hObject,handles);
return

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function minsize(hObject,handles)
    sizesrc = size(handles.imgrawsrc);
    sizetar = size(handles.imgtar);
    
    minsize(1) = max(sizesrc(1),sizetar(1));
    minsize(2) = max(sizesrc(2),sizetar(2));

    %check source image
    if (sizesrc(1) < minsize(1))
        handles.imgsrc(sizesrc(1):minsize(1),:)=0;

    end
    
    if (sizesrc(2) < minsize(2))
        handles.imgsrc(:,sizesrc(2):minsize(2))=0;

    end
    
    %check target image
    if (sizetar(1) < minsize(1))
        handles.imgtarcur(sizesrc(1):minsize(1),:)=0;

    end
    
    if (sizetar(2) < minsize(2))
        handles.imgtarcur(:,sizesrc(2):minsize(2))=0;
    end
    guidata(hObject,handles);
return

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on button press in pbsavecomb.
function pbsavecomb_Callback(hObject, eventdata, handles)
% hObject    handle to pbsavecomb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

aa = clock;
time_str = sprintf('%dh%dmin%dsec', fix(aa(4)), fix(aa(5)), fix(aa(6)));
fp = mfilename('fullpath');
[pd, fd, extd] = fileparts(fp);
fn = fullfile(pd, 'data', sprintf('coreg_results_%s_%s.mat', date, time_str));
combined_image = abs(toverlay2(handles.imgtarcur,handles.imgcur,handles.contrnum,[0 255 10],jet));
transparency = handles.contrnum;
Results.Tx = handles.A(1); Results.Ty = handles.A(2); Results.Rxy = handles.A(3);
Results.Scx = handles.A(4); Results.Scy = handles.A(5);
Results.Shx = handles.A(6); Results.Shy = handles.A(7);
contents = get(handles.transformation_menu, 'String');
Results.Transformation_type = contents{get(handles.transformation_menu, 'Value')};
contents = get(handles.of_menu, 'String');
Results.Objective_function = contents{get(handles.of_menu, 'Value')};
Results.Score = of(handles.of, handles.imgtarcur, handles.imgcur);
save(fn, 'combined_image', 'transparency', 'Results');
set(handles.comment_text, 'String', sprintf('Results saved in file: %s', fn));
imwrite(combined_image, fullfile(pd, 'data', sprintf('combined_image_%s_%s.jpg', date, time_str)));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on key press over figure1 with no controls selected.
function figure1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function edxlmin_Callback(hObject, eventdata, handles)
% hObject    handle to edxlmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edxlmin as text
%        str2double(get(hObject,'String')) returns contents of edxlmin as a double

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function edxlmax_Callback(hObject, eventdata, handles)
% hObject    handle to edxlmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edxlmax as text
%        str2double(get(hObject,'String')) returns contents of edxlmax as a double


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function edylmin_Callback(hObject, eventdata, handles)
% hObject    handle to edylmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edylmin as text
%        str2double(get(hObject,'String')) returns contents of edylmin as a double


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function edylmax_Callback(hObject, eventdata, handles)
% hObject    handle to edylmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edylmax as text
%        str2double(get(hObject,'String')) returns contents of edylmax as a double


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function edrlmin_Callback(hObject, eventdata, handles)
% hObject    handle to edrlmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edrlmin as text
%        str2double(get(hObject,'String')) returns contents of edrlmin as a double


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function edrlmax_Callback(hObject, eventdata, handles)
% hObject    handle to edrlmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edrlmax as text
%        str2double(get(hObject,'String')) returns contents of edrlmax as a double


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function edsxlmin_Callback(hObject, eventdata, handles)
% hObject    handle to edsxlmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edsxlmin as text
%        str2double(get(hObject,'String')) returns contents of edsxlmin as a double


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function edsxlmax_Callback(hObject, eventdata, handles)
% hObject    handle to edsxlmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edsxlmax as text
%        str2double(get(hObject,'String')) returns contents of edsxlmax as a double


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function edsylmin_Callback(hObject, eventdata, handles)
% hObject    handle to edsylmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edsylmin as text
%        str2double(get(hObject,'String')) returns contents of edsylmin as a double


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function edsylmax_Callback(hObject, eventdata, handles)
% hObject    handle to edsylmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edsylmax as text
%        str2double(get(hObject,'String')) returns contents of edsylmax as a double

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function edshxlmin_Callback(hObject, eventdata, handles)
% hObject    handle to edshxlmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edshxlmin as text
%        str2double(get(hObject,'String')) returns contents of edshxlmin as a double


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function edshxlmax_Callback(hObject, eventdata, handles)
% hObject    handle to edshxlmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edshxlmax as text
%        str2double(get(hObject,'String')) returns contents of edshxlmax as a double


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function edshylmin_Callback(hObject, eventdata, handles)
% hObject    handle to edshylmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edshylmin as text
%        str2double(get(hObject,'String')) returns contents of edshylmin as a double


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function edshylmax_Callback(hObject, eventdata, handles)
% hObject    handle to edshylmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edshylmax as text
%        str2double(get(hObject,'String')) returns contents of edshylmax as a double

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on slider movement.
function fusion_slider_Callback(hObject, eventdata, handles)
% hObject    handle to fusion_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

handles.contrnum = get(hObject,'Value');
set(handles.fusion_edit, 'String', num2str(handles.contrnum));
handles = redraw(handles);
guidata(hObject,handles);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes during object creation, after setting all properties.
function fusion_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fusion_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



function fusion_edit_Callback(hObject, eventdata, handles)
% hObject    handle to fusion_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fusion_edit as text
%        str2double(get(hObject,'String')) returns contents of fusion_edit as a double

val = str2double(get(hObject,'String'));
if isnan(val)
    val = handles.contrnum;
elseif val > 1
    val = 1;
elseif val < 0
    val = 0;
end

handles.contrnum = val;
set(handles.fusion_edit, 'String', num2str(handles.contrnum));
set(handles.fusion_slider, 'Value', val);
handles = redraw(handles);
guidata(hObject,handles);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes during object creation, after setting all properties.
function fusion_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fusion_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% --- Executes on selection change in of_menu.
function of_menu_Callback(hObject, eventdata, handles)
% hObject    handle to of_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns of_menu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from of_menu

handles.of = get(hObject,'Value');
contents = get(hObject,'String');
handles.of_string = sprintf('(%s)', contents{handles.of});
if handles.of == 7 % Matching Score:
    handles.of_string = sprintf('(Generic Cost)');
end
handles = redraw(handles);
set(handles.comment_text, 'String', '');
guidata(hObject,handles);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes during object creation, after setting all properties.
function of_menu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to of_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on button press in map_3d_of_button.
function map_3d_of_button_Callback(hObject, eventdata, handles)
% hObject    handle to map_3d_of_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

val1 = get(handles.param1_menu, 'Value');
val2 = get(handles.param2_menu, 'Value');

if val1 == val2
    warndlg('You must choose two different parameters!!');
    return
end

lowb = ones(2,1);highb = ones(2,1);
lowb(1)=str2num(get(handles.lowlim1_edit,'String'));
lowb(2)=str2num(get(handles.lowlim2_edit,'String'));
highb(1)=str2num(get(handles.uplim1_edit,'String'));
highb(2)=str2num(get(handles.uplim2_edit,'String'));
step1 = str2double(get(handles.step1_edit,'String'));
step2 = str2double(get(handles.step2_edit,'String'));

if sum(abs(lowb(:)) + abs(highb(:))) == 0
    warndlg('Param limits need to be defined first!');
    return;
end

if step1 ==0 | step2 == 0
    warndlg('Step sizes must be > 0!!');
    return;
end

set(handles.map_3d_of_button,'String','Stop');
guidata(hObject,handles);
if(handles.bGoing == 1) 
    handles.bGoing = 0;
    set(handles.map_3d_of_button,'String','Start');
    guidata(hObject, handles);
    return
else
    handles.bGoing = 1;
    guidata(hObject, handles);
end

% Insert here the code to map the 3D
[param1, param2] = meshgrid(lowb(1):step1:highb(1), lowb(2):step2:highb(2)); %Tx and Ty
map3D = zeros(size(param1));
params = handles.params;
%param1 = handles.params(val1) + param1; param2 =handles.params(val2) + param2;
hh = waitbar(0, 'Mapping the 3D surface!');
t1 = tic;
ii=1;
while ~strcmp(get(handles.map_3d_of_button,'String'), 'Start') & ii <= length(param1(:))
    params(val1) = param1(ii); params(val2) = param2(ii);
    curimg = afftrans_mit(handles.imgsrc, params, handles.nonlinx,handles.nonliny);
    curimg = abs(curimg)/max(curimg(:));
    map3D(ii) = of(handles.of, handles.imgtarcur, curimg);
    tm = toc(t1);
    waitbar(ii/length(param1(:)), hh, sprintf('Mapping the 3D surface: aprox %d secs remaining', round((length(param1(:))/ii - 1)*tm)));
    ii=ii+1;
end
close(hh);
Params_string = {'Tx', 'Ty', 'Rxy', 'Scx', 'Scy', 'Shx', 'Shy'};
if ~strcmp(get(handles.map_3d_of_button,'String'), 'Start')
    elapsed_time = toc(t1);
    eval([sprintf('%s = param1;', Params_string{val1})]);
    eval([sprintf('%s = param2;', Params_string{val2})]);
    aa = clock;
    time_str = sprintf('%dh%dmin%dsec', fix(aa(4)), fix(aa(5)), fix(aa(6)));
    fp = mfilename('fullpath');
    [pd, fd, extd] = fileparts(fp);
    fn = fullfile(pd, 'data', sprintf('map3D_%s_%s.mat', date, time_str));
    % eval([sprintf('save %s map3D elapsed_time %s %s', fn, Params_string{val1}, Params_string{val2})]);
    save(fn,'map3D','elapsed_time',Params_string{val1},Params_string{val2});
    set(handles.comment_text, 'String', sprintf('Elapsed time: %.2f sec\nResults saved on file: %s', elapsed_time, fn));
    %save map3D.mat map3D param1 param2 elapsed_time
    %disp('Finished!');
    set(handles.axes6, 'Visible', 'On');
    axes(handles.axes6), surf(param1,param2,map3D); xlabel(Params_string{val1}); ylabel(Params_string{val2}); zlabel('Matching Score');
    rotate3d(handles.axes6, 'On');
    pause(0.1);
end
handles.bGoing = 0;
set(handles.map_3d_of_button,'String','Start');
guidata(hObject, handles);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function val = of(selec, img1, img2, varargin)

bins1 = 64;
bins2 = 64;

if nargin > 3
    bins1 = varargin{1};
    bins2 = bins1;
end
if nargin > 4
    bins2 = varargin{2};
end

switch selec
    case {1, 7} % SSD & Matching Score
        val = sqrt(nansum((img1(:)-img2(:)).^2));
    case 2 % NCC
        val = -corr2(img1, img2);
    case 3 % JE
        [nmi, mutual, val]=mi4(img1, img2, bins1, bins2);
        val = val;
    case 4 % MI
        [nmi, val, jnt]=mi4(img1, img2, bins1, bins2);
        val = -val;
    case 5 % NMI
        [val, mutual, jnt]=mi4(img1, img2, bins1, bins2);
        val = -val;
    case 6 % Your own OF:
        val = my_own_objective_function(img1, img2);
    otherwise % Matching score = JE;
        [nmi, mutual, val]=mi4(img1, img2, bins1, bins2);
        val = val;
end
        

return

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% --- Executes on selection change in transformation_menu.
function transformation_menu_Callback(hObject, eventdata, handles)
% hObject    handle to transformation_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns transformation_menu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from transformation_menu

set(handles.ckx, 'Value', 1); set(handles.cky, 'Value', 1);
set(handles.ckr, 'Value', 1);
set(handles.cksx, 'Value', 1); set(handles.cksy, 'Value', 1);
set(handles.ckshx, 'Value', 1); set(handles.ckshy, 'Value', 1);
%reset_button_Callback(handles.reset_button, [], handles);
contents = cellstr(get(handles.transformation_menu,'String'));
option = contents{get(handles.transformation_menu,'Value')};
switch option
    case 'Rigid'
        set(handles.edmanscx, 'String', num2str(1));
        set(handles.edmanscy, 'String', num2str(1));
        set(handles.edmanshx, 'String', num2str(0));
        set(handles.edmanshy, 'String', num2str(0));
    case 'Rigid + Scale'
        set(handles.edmanshx, 'String', num2str(0));
        set(handles.edmanshy, 'String', num2str(0));
    case 'Affine'
    otherwise
end
handles = redraw(handles);
handles = enable_disable_buttons(handles);
set(handles.comment_text, 'String', '');
guidata(hObject,handles);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes during object creation, after setting all properties.
function transformation_menu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to transformation_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes when selected object is changed in registration_type_panel.
function registration_type_panel_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in registration_type_panel 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)

handles = enable_disable_buttons(handles);
set(handles.comment_text, 'String', '');
guidata(hObject,handles);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function handles = enable_disable_buttons(handles)
% Get the transformation type option: % Rigid, Rigid + Scale, Affine or Custom 
contents = cellstr(get(handles.transformation_menu,'String'));
option = contents{get(handles.transformation_menu,'Value')};
% Value of Manual Registration:
val_reg = get(handles.manual_reg_button, 'Value');
%Value of Simplex:
val_simplex = get(handles.simplex_button, 'Value');

switch option
    case 'Rigid'
        set(handles.pbscalexdown, 'Enable', 'Off'); set(handles.pbscalexup, 'Enable', 'Off');
        set(handles.pbscaleydown, 'Enable', 'Off'); set(handles.pbscaleyup, 'Enable', 'Off');
        set(handles.pbshearxminus, 'Enable', 'Off'); set(handles.pbshearxplus, 'Enable', 'Off');
        set(handles.pbshearyminus, 'Enable', 'Off'); set(handles.pbshearyplus, 'Enable', 'Off');
        set(handles.edmanscx, 'Enable', 'Off'); set(handles.edmanscy, 'Enable', 'Off');
        set(handles.edmanshx, 'Enable', 'Off'); set(handles.edmanshy, 'Enable', 'Off');
        set(handles.ckx, 'Enable', 'Off'); set(handles.cky, 'Enable', 'Off');
        set(handles.ckr, 'Enable', 'Off');
        set(handles.cksx, 'Enable', 'Off'); set(handles.cksy, 'Enable', 'Off');
        set(handles.ckshx, 'Enable', 'Off'); set(handles.ckshy, 'Enable', 'Off');
        set(handles.ckx, 'Value', 1); set(handles.cky, 'Value', 1);
        set(handles.ckr, 'Value', 1);
        set(handles.cksx, 'Value', 0); set(handles.cksy, 'Value', 0);
        set(handles.ckshx, 'Value', 0); set(handles.ckshy, 'Value', 0);
        set(handles.edsxlmin, 'Enable', 'Off'); set(handles.edsxlmax, 'Enable', 'Off');
        set(handles.edsylmin, 'Enable', 'Off'); set(handles.edsylmax, 'Enable', 'Off');
        set(handles.edshxlmin, 'Enable', 'Off'); set(handles.edshxlmax, 'Enable', 'Off');
        set(handles.edshylmin, 'Enable', 'Off'); set(handles.edshylmax, 'Enable', 'Off');
    case 'Rigid + Scale'
        set(handles.pbscalexdown, 'Enable', 'On'); set(handles.pbscalexup, 'Enable', 'On');
        set(handles.pbscaleydown, 'Enable', 'On'); set(handles.pbscaleyup, 'Enable', 'On');
        set(handles.edmanscx, 'Enable', 'On'); set(handles.edmanscy, 'Enable', 'On');
        
        set(handles.pbshearxminus, 'Enable', 'Off'); set(handles.pbshearxplus, 'Enable', 'Off');
        set(handles.pbshearyminus, 'Enable', 'Off'); set(handles.pbshearyplus, 'Enable', 'Off');
        set(handles.edmanshx, 'Enable', 'Off'); set(handles.edmanshy, 'Enable', 'Off');
        set(handles.ckx, 'Enable', 'Off'); set(handles.cky, 'Enable', 'Off');
        set(handles.ckr, 'Enable', 'Off');
        set(handles.cksx, 'Enable', 'Off'); set(handles.cksy, 'Enable', 'Off');
        set(handles.ckshx, 'Enable', 'Off'); set(handles.ckshy, 'Enable', 'Off');
        set(handles.ckx, 'Value', 1); set(handles.cky, 'Value', 1);
        set(handles.ckr, 'Value', 1);
        set(handles.cksx, 'Value', 1); set(handles.cksy, 'Value', 1);
        set(handles.ckshx, 'Value', 0); set(handles.ckshy, 'Value', 0);
        set(handles.edshxlmin, 'Enable', 'Off'); set(handles.edshxlmax, 'Enable', 'Off');
        set(handles.edshylmin, 'Enable', 'Off'); set(handles.edshylmax, 'Enable', 'Off');
    case 'Affine'
        set(handles.pbleft, 'Enable', 'On'); set(handles.pbright, 'Enable', 'On');
        set(handles.pbup, 'Enable', 'On'); set(handles.pbdown, 'Enable', 'On');
        set(handles.pbrminus, 'Enable', 'On'); set(handles.pbrplus, 'Enable', 'On');
        set(handles.pbscalexdown, 'Enable', 'On'); set(handles.pbscalexup, 'Enable', 'On');
        set(handles.pbscaleydown, 'Enable', 'On'); set(handles.pbscaleyup, 'Enable', 'On');
        set(handles.pbshearxminus, 'Enable', 'On'); set(handles.pbshearxplus, 'Enable', 'On');
        set(handles.pbshearyminus, 'Enable', 'On'); set(handles.pbshearyplus, 'Enable', 'On');
        set(handles.edmanx, 'Enable', 'On'); set(handles.edmany, 'Enable', 'On');
        set(handles.edmanrxy, 'Enable', 'On');
        set(handles.edmanscx, 'Enable', 'On'); set(handles.edmanscy, 'Enable', 'On');
        set(handles.edmanshx, 'Enable', 'On'); set(handles.edmanshy, 'Enable', 'On');
        set(handles.ckx, 'Enable', 'Off'); set(handles.cky, 'Enable', 'Off');
        set(handles.ckr, 'Enable', 'Off');
        set(handles.cksx, 'Enable', 'Off'); set(handles.cksy, 'Enable', 'Off');
        set(handles.ckshx, 'Enable', 'Off'); set(handles.ckshy, 'Enable', 'Off');
        set(handles.ckx, 'Value', 1); set(handles.cky, 'Value', 1);
        set(handles.ckr, 'Value', 1);
        set(handles.cksx, 'Value', 1); set(handles.cksy, 'Value', 1);
        set(handles.ckshx, 'Value', 1); set(handles.ckshy, 'Value', 1);
        set(handles.edxlmin, 'Enable', 'On'); set(handles.edxlmax, 'Enable', 'On');
        set(handles.edylmin, 'Enable', 'On'); set(handles.edylmax, 'Enable', 'On');
        set(handles.edrlmin, 'Enable', 'On'); set(handles.edrlmax, 'Enable', 'On');
    otherwise % Custom
        % Enable all buttons!
        set(handles.pbleft, 'Enable', 'On'); set(handles.pbright, 'Enable', 'On');
        set(handles.pbup, 'Enable', 'On'); set(handles.pbdown, 'Enable', 'On');
        set(handles.pbrminus, 'Enable', 'On'); set(handles.pbrplus, 'Enable', 'On');
        set(handles.pbscalexdown, 'Enable', 'On'); set(handles.pbscalexup, 'Enable', 'On');
        set(handles.pbscaleydown, 'Enable', 'On'); set(handles.pbscaleyup, 'Enable', 'On');
        set(handles.pbshearxminus, 'Enable', 'On'); set(handles.pbshearxplus, 'Enable', 'On');
        set(handles.pbshearyminus, 'Enable', 'On'); set(handles.pbshearyplus, 'Enable', 'On');
        set(handles.edmanx, 'Enable', 'On'); set(handles.edmany, 'Enable', 'On');
        set(handles.edmanrxy, 'Enable', 'On');
        set(handles.edmanscx, 'Enable', 'On'); set(handles.edmanscy, 'Enable', 'On');
        set(handles.edmanshx, 'Enable', 'On'); set(handles.edmanshy, 'Enable', 'On');
        set(handles.ckx, 'Enable', 'On'); set(handles.cky, 'Enable', 'On');
        set(handles.ckr, 'Enable', 'On');
        set(handles.cksx, 'Enable', 'On'); set(handles.cksy, 'Enable', 'On');
        set(handles.ckshx, 'Enable', 'On'); set(handles.ckshy, 'Enable', 'On');
%         set(handles.ckx, 'Value', 1); set(handles.cky, 'Value', 1);
%         set(handles.ckr, 'Value', 1);
%         set(handles.cksx, 'Value', 1); set(handles.cksy, 'Value', 1);
%         set(handles.ckshx, 'Value', 1); set(handles.ckshy, 'Value', 1);
        set(handles.edxlmin, 'Enable', 'On'); set(handles.edxlmax, 'Enable', 'On');
        set(handles.edylmin, 'Enable', 'On'); set(handles.edylmax, 'Enable', 'On');
        set(handles.edrlmin, 'Enable', 'On'); set(handles.edrlmax, 'Enable', 'On');
end

if (val_reg == 1) | (val_simplex == 1) % If it is Manual or Simplex is selected!
    if val_reg
        set(handles.automatic_registration_panel, 'Visible', 'Off');
        set(handles.limits_menu, 'Enable', 'Off');
    else
        set(handles.automatic_registration_panel, 'Visible', 'On');
        set(handles.limits_menu, 'Enable', 'On');
        handles2delete = get(handles.axes5,'Children');
        delete(handles2delete);
        set(handles.axes5, 'Visible', 'Off');
        set(handles.function_minimization_text, 'Visible', 'Off');
    end
    set(handles.edxlmin, 'Enable', 'Off'); set(handles.edxlmax, 'Enable', 'Off');
    set(handles.edylmin, 'Enable', 'Off'); set(handles.edylmax, 'Enable', 'Off');
    set(handles.edrlmin, 'Enable', 'Off'); set(handles.edrlmax, 'Enable', 'Off');
    set(handles.edsxlmin, 'Enable', 'Off'); set(handles.edsxlmax, 'Enable', 'Off');
    set(handles.edsylmin, 'Enable', 'Off'); set(handles.edsylmax, 'Enable', 'Off');
    set(handles.edshxlmin, 'Enable', 'Off'); set(handles.edshxlmax, 'Enable', 'Off');
    set(handles.edshylmin, 'Enable', 'Off'); set(handles.edshylmax, 'Enable', 'Off');
else % Automatic and by Alternation!
    %set(handles.axes5, 'Visible', 'On');
    set(handles.automatic_registration_panel, 'Visible', 'On');
    set(handles.limits_menu, 'Enable', 'On');
    set(handles.axes5, 'Visible', 'Off'); % New 2017
    handles2delete = get(handles.axes5,'Children'); % New 2017
    delete(handles2delete); % New 2017
    set(handles.function_minimization_text, 'Visible', 'Off'); % New 2017
    set(handles.edxlmin, 'Enable', 'On'); set(handles.edxlmax, 'Enable', 'On');
    set(handles.edylmin, 'Enable', 'On'); set(handles.edylmax, 'Enable', 'On');
    set(handles.edrlmin, 'Enable', 'On'); set(handles.edrlmax, 'Enable', 'On');
    if ~strcmp(option, 'Rigid')
        set(handles.edsxlmin, 'Enable', 'On'); set(handles.edsxlmax, 'Enable', 'On');
        set(handles.edsylmin, 'Enable', 'On'); set(handles.edsylmax, 'Enable', 'On');
        if ~strcmp(option, 'Rigid + Scale')
            set(handles.edshxlmin, 'Enable', 'On'); set(handles.edshxlmax, 'Enable', 'On');
            set(handles.edshylmin, 'Enable', 'On'); set(handles.edshylmax, 'Enable', 'On');
        end
    end
end     

% Populate the limits:
if (handles.limits_set == 0) & (val_reg == 0) % First time to populate the limits and it is not manual 
    limits_menu_Callback(handles.limits_menu, [], handles);
end

return
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on button press in pbshearxminus.
function pbshearxminus_Callback(hObject, eventdata, handles)
% hObject    handle to pbshearxminus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val = str2num(get(handles.edmanshx,'String'))-.1;
set(handles.edmanshx,'String',val);
handles = redraw(handles);guidata(hObject,handles);
return
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on button press in pbshearxplus.
function pbshearxplus_Callback(hObject, eventdata, handles)
% hObject    handle to pbshearxplus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val = str2num(get(handles.edmanshx,'String'))+.1;
set(handles.edmanshx,'String',val);
handles = redraw(handles);guidata(hObject,handles);
return
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on button press in pbshearyminus.
function pbshearyminus_Callback(hObject, eventdata, handles)
% hObject    handle to pbshearyminus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val = str2num(get(handles.edmanshy,'String'))-.1;
set(handles.edmanshy,'String',val);
handles = redraw(handles);guidata(hObject,handles);
return
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on button press in pbshearyplus.
function pbshearyplus_Callback(hObject, eventdata, handles)
% hObject    handle to pbshearyplus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val = str2num(get(handles.edmanshy,'String'))+.1;
set(handles.edmanshy,'String',val);
handles = redraw(handles);guidata(hObject,handles);
return
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on selection change in limits_menu.
function limits_menu_Callback(hObject, eventdata, handles)
% hObject    handle to limits_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns limits_menu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from limits_menu

val = get(handles.manual_reg_button, 'Value');

x = str2num(get(handles.edmanx, 'String'));
y = str2num(get(handles.edmany, 'String'));
sx = str2num(get(handles.edmanscx, 'String'));
sy = str2num(get(handles.edmanscy, 'String'));
rxy = str2num(get(handles.edmanrxy, 'String'));
shx = str2num(get(handles.edmanshx, 'String'));
shy = str2num(get(handles.edmanshy, 'String'));


if ((isfield(handles,'imgsrc') || isfield(handles,'imgtar')) & val == 0)
    contents = cellstr(get(hObject,'String'));
    option = contents{get(hObject,'Value')};
    switch option
        case 'Very Coarse'
            lowb(1) = -size(handles.imgtarcur,2)/2; highb(1)=size(handles.imgtarcur,2)/2;%xtrans
            lowb(2) = -size(handles.imgtarcur,1)/2; highb(2)=size(handles.imgtarcur,1)/2;%ytrans
            lowb(3) = -60;highb(3) = 60;%rotation
            lowb(4) = 0.75;highb(4) = 1.25;%scalex
            lowb(5) = 0.75;highb(5) = 1.25;%scaley
            lowb(6) = -.4;highb(6)= 0.4;%shearx
            lowb(7) = -.4;highb(7)= 0.4;%sheary
        case 'Coarse'
            lowb(1) = -size(handles.imgtarcur,2)/6; highb(1)=size(handles.imgtarcur,2)/6;%xtrans
            lowb(2) = -size(handles.imgtarcur,1)/6; highb(2)=size(handles.imgtarcur,1)/6;%ytrans
            lowb(3) = -30;highb(3) = 30;%rotation
            lowb(4) = 0.8;highb(4) = 1.2;%scalex
            lowb(5) = 0.8;highb(5) = 1.2;%scaley
            lowb(6) = -.2;highb(6)= 0.2;%shearx
            lowb(7) = -.2;highb(7)= 0.2;%sheary
        case 'Fine'
            lowb(1) = -size(handles.imgtarcur,2)/20; highb(1)=size(handles.imgtarcur,2)/20;%xtrans
            lowb(2) = -size(handles.imgtarcur,1)/20; highb(2)=size(handles.imgtarcur,1)/20;%ytrans
            lowb(3) = -10;highb(3) = 10;%rotation
            lowb(4) = 0.9;highb(4) = 1.1;%scalex
            lowb(5) = 0.9;highb(5) = 1.1;%scaley
            lowb(6) = -.1;highb(6)= 0.1;%shearx
            lowb(7) = -.1;highb(7)= 0.1;%sheary
        otherwise % Auto = Coarse!
            lowb(1) = -size(handles.imgtarcur,2)/6; highb(1)=size(handles.imgtarcur,2)/6;%xtrans
            lowb(2) = -size(handles.imgtarcur,1)/6; highb(2)=size(handles.imgtarcur,1)/6;%ytrans
            lowb(3) = -30;highb(3) = 30;%rotation
            lowb(4) = 0.8;highb(4) = 1.2;%scalex
            lowb(5) = 0.8;highb(5) = 1.2;%scaley
            lowb(6) = -.2;highb(6)= 0.2;%shearx
            lowb(7) = -.2;highb(7)= 0.2;%sheary
    end
    
    lowb(1) = lowb(1) + x; lowb(2) = lowb(2) + y;
    lowb(4) = lowb(4) + sx - 1; lowb(5) = lowb(5) + sy - 1; % Indexes bug fix on 2017!
    lowb(3) = lowb(3) + rxy;
    lowb(6) = lowb(6) + shx; lowb(7) = lowb(7) + shy;
    
    highb(1) = highb(1) + x; highb(2) = highb(2) + y;
    highb(4) = highb(4) + sx - 1; highb(5) = highb(5) + sy - 1;
    highb(3) = highb(3) + rxy;
    highb(6) = highb(6) + shx; highb(7) = highb(7) + shy;
    
    set(handles.edxlmin,'String',lowb(1));
    set(handles.edylmin,'String',lowb(2));
    set(handles.edrlmin,'String',lowb(3));
    set(handles.edsxlmin,'String',lowb(4));
    set(handles.edsylmin,'String',lowb(5));
    set(handles.edshxlmin,'String',lowb(6));
    set(handles.edshylmin,'String',lowb(7));
    set(handles.edxlmax,'String',highb(1));
    set(handles.edylmax,'String',highb(2));
    set(handles.edrlmax,'String',highb(3));
    set(handles.edsxlmax,'String',highb(4));
    set(handles.edsylmax,'String',highb(5));
    set(handles.edshxlmax,'String',highb(6));
    set(handles.edshylmax,'String',highb(7));
    
    handles.limits_set = 1;
end

guidata(hObject,handles);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes during object creation, after setting all properties.
function limits_menu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to limits_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% --- Executes when selected object is changed in optimization_panel.
function optimization_panel_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in optimization_panel 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)

handles = enable_disable_buttons(handles);
set(handles.comment_text, 'String', '');
guidata(hObject,handles);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% --- Executes on mouse press over figure background.
function figure1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function limit_step_edit_Callback(hObject, eventdata, handles)
% hObject    handle to limit_step_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of limit_step_edit as text
%        str2double(get(hObject,'String')) returns contents of limit_step_edit as a double

val = str2double(get(hObject,'String'));
if isnan(val) | val < 0
    val = 10;
    warndlg('Only positive values allowed!!');
end
set(hObject, 'String', num2str(val));

guidata(hObject,handles);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes during object creation, after setting all properties.
function limit_step_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to limit_step_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% --- Executes when selected object is changed in map3d_visualization_panel.
function map3d_visualization_panel_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in map3d_visualization_panel 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)

switch hObject
    case handles.on_button
        set(handles.comment_text, 'String', '');
        set(handles.map3D_panel, 'Visible', 'On');
        %set(handles.registration_type_panel, 'Visible', 'Off');
        set(handles.automatic_registration_panel, 'Visible', 'Off');
        set(handles.manual_reg_button, 'Enable', 'Off');
        set(handles.automatic_reg_button, 'Enable', 'Off');
        set(handles.reset_button, 'Enable', 'Off');
        set(handles.alternation_button, 'Enable', 'Off');
        set(handles.simplex_button, 'Enable', 'Off');
        set(handles.pbstart, 'Enable', 'Off');
        %set(handles.automatic_registration_panel, 'Visible', 'Off');
        %set(handles.transformation_menu, 'Visible', 'Off');
        set(handles.transformation_menu, 'Enable', 'Off');
        handles2delete = get(handles.axes5,'Children');
        delete(handles2delete);
        set(handles.axes5, 'Visible', 'Off');
        set(handles.function_minimization_text, 'Visible', 'Off');
        
        set(handles.pbsavecomb, 'Visible', 'Off');
        % Disable all the the params:
        set(handles.pbleft, 'Enable', 'Off'); set(handles.pbright, 'Enable', 'Off');
        set(handles.pbup, 'Enable', 'Off'); set(handles.pbdown, 'Enable', 'Off');
        set(handles.pbrminus, 'Enable', 'Off'); set(handles.pbrplus, 'Enable', 'Off');
        set(handles.pbscalexdown, 'Enable', 'Off'); set(handles.pbscalexup, 'Enable', 'Off');
        set(handles.pbscaleydown, 'Enable', 'Off'); set(handles.pbscaleyup, 'Enable', 'Off');
        set(handles.pbshearxminus, 'Enable', 'Off'); set(handles.pbshearxplus, 'Enable', 'Off');
        set(handles.pbshearyminus, 'Enable', 'Off'); set(handles.pbshearyplus, 'Enable', 'Off');
        set(handles.edmanx, 'Enable', 'Off'); set(handles.edmany, 'Enable', 'Off');
        set(handles.edmanrxy, 'Enable', 'Off');
        set(handles.edmanscx, 'Enable', 'Off'); set(handles.edmanscy, 'Enable', 'Off');
        set(handles.edmanshx, 'Enable', 'Off'); set(handles.edmanshy, 'Enable', 'Off');
        set(handles.ckx, 'Enable', 'Off'); set(handles.cky, 'Enable', 'Off');
        set(handles.ckr, 'Enable', 'Off');
        set(handles.cksx, 'Enable', 'Off'); set(handles.cksy, 'Enable', 'Off');
        set(handles.ckshx, 'Enable', 'Off'); set(handles.ckshy, 'Enable', 'Off');
        set(handles.edxlmin, 'Enable', 'Off'); set(handles.edxlmax, 'Enable', 'Off');
        set(handles.edylmin, 'Enable', 'Off'); set(handles.edylmax, 'Enable', 'Off');
        set(handles.edrlmin, 'Enable', 'Off'); set(handles.edrlmax, 'Enable', 'Off');
        set(handles.edsxlmin, 'Enable', 'Off'); set(handles.edsxlmax, 'Enable', 'Off');
        set(handles.edsylmin, 'Enable', 'Off'); set(handles.edsylmax, 'Enable', 'Off');
        set(handles.edshxlmin, 'Enable', 'Off'); set(handles.edshxlmax, 'Enable', 'Off');
        set(handles.edshylmin, 'Enable', 'Off'); set(handles.edshylmax, 'Enable', 'Off');
        set(handles.limits_menu, 'Enable', 'Off');
        
        handles.params = handles.A;
        handles = populate_3dmap_values(handles);
    otherwise % Off_button
        set(handles.comment_text, 'String', '');
        handles2delete = get(handles.axes6,'Children');
        delete(handles2delete);
        set(handles.axes6, 'Visible', 'Off');
        rotate3d(handles.axes6, 'Off');
        set(handles.map3D_panel, 'Visible', 'Off');
        
        
        set(handles.manual_reg_button, 'Enable', 'On');
        set(handles.automatic_reg_button, 'Enable', 'On');
        set(handles.reset_button, 'Enable', 'On');
        set(handles.alternation_button, 'Enable', 'On');
        set(handles.simplex_button, 'Enable', 'On');
        set(handles.pbstart, 'Enable', 'On');
        set(handles.transformation_menu, 'Enable', 'On');
        
        
%         set(handles.registration_type_panel, 'Visible', 'On');
%         set(handles.automatic_registration_panel, 'Visible', 'On');
%         set(handles.transformation_menu, 'Visible', 'On');
        set(handles.pbrminus, 'Enable', 'On'); set(handles.pbrplus, 'Enable', 'On');
        set(handles.edmanx, 'Enable', 'On'); set(handles.edmany, 'Enable', 'On');
        set(handles.edmanrxy, 'Enable', 'On');
        set(handles.pbleft, 'Enable', 'On'); set(handles.pbright, 'Enable', 'On');
        set(handles.pbup, 'Enable', 'On'); set(handles.pbdown, 'Enable', 'On');
        set(handles.pbsavecomb, 'Visible', 'On');
        
        handles = enable_disable_buttons(handles);
        handles = redraw(handles);
end
guidata(hObject,handles);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function handles = populate_3dmap_values(handles, varargin)

p1 = get(handles.param1_menu, 'Value');
p2 = get(handles.param2_menu, 'Value');

params = {'x', 'y', 'rxy', 'scx', 'scy', 'shx', 'shy'};
for ii=1:length(params)
    if ii~=p1 & ii~=p2
        eval([sprintf('set(handles.val_%s_edit, ''Enable'', ''On'' );', params{ii})]);
    else
        eval([sprintf('set(handles.val_%s_edit, ''Enable'', ''Off'' );', params{ii})]);
    end
    eval([sprintf('set(handles.val_%s_edit, ''String'', num2str(handles.params(ii)) );', params{ii})]);
end
set(handles.value1_edit, 'String', handles.params(p1));
set(handles.value2_edit, 'String', handles.params(p2));


return

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function value1_edit_Callback(hObject, eventdata, handles)
% hObject    handle to value1_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of value1_edit as text
%        str2double(get(hObject,'String')) returns contents of value1_edit as a double

val = str2double(get(hObject,'String'));
pval = get(handles.param1_menu, 'Value');
if isnan(val)
    val = handles.params(pval);
    set(handles.value1_edit, 'String', num2str(val));
end
handles.params(pval) = val;
handles = populate_3dmap_values(handles);
handles = redraw(handles); 
guidata(hObject,handles);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes during object creation, after setting all properties.
function value1_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to value1_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function value2_edit_Callback(hObject, eventdata, handles)
% hObject    handle to value2_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of value2_edit as text
%        str2double(get(hObject,'String')) returns contents of value2_edit as a double

val = str2double(get(hObject,'String'));
pval = get(handles.param2_menu, 'Value');
if isnan(val)
    val = handles.params(pval);
    set(handles.value2_edit, 'String', num2str(val));
end
handles.params(pval) = val;
handles = populate_3dmap_values(handles);
handles = redraw(handles);  % Use the params instead of handles.A;
guidata(hObject,handles);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes during object creation, after setting all properties.
function value2_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to value2_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function lowlim1_edit_Callback(hObject, eventdata, handles)
% hObject    handle to lowlim1_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lowlim1_edit as text
%        str2double(get(hObject,'String')) returns contents of lowlim1_edit as a double

val = str2double(get(hObject,'String'));
pval = get(handles.param1_menu, 'Value');
if (pval == 4 || pval == 5) && val <=0 
    set(hObject, 'String', num2str(0.001));
end
guidata(hObject,handles);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes during object creation, after setting all properties.
function lowlim1_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lowlim1_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function uplim1_edit_Callback(hObject, eventdata, handles)
% hObject    handle to uplim1_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of uplim1_edit as text
%        str2double(get(hObject,'String')) returns contents of uplim1_edit as a double

val = str2double(get(hObject,'String'));
pval = get(handles.param1_menu, 'Value');
if (pval == 4 || pval == 5) && val <=0 
    set(hObject, 'String', num2str(0.001));
end
guidata(hObject,handles);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes during object creation, after setting all properties.
function uplim1_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uplim1_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function lowlim2_edit_Callback(hObject, eventdata, handles)
% hObject    handle to lowlim2_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lowlim2_edit as text
%        str2double(get(hObject,'String')) returns contents of lowlim2_edit as a double

val = str2double(get(hObject,'String'));
pval = get(handles.param2_menu, 'Value');
if (pval == 4 || pval == 5) && val <=0 
    set(hObject, 'String', num2str(0.001));
end
guidata(hObject,handles);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes during object creation, after setting all properties.
function lowlim2_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lowlim2_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function uplim2_edit_Callback(hObject, eventdata, handles)
% hObject    handle to uplim2_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of uplim2_edit as text
%        str2double(get(hObject,'String')) returns contents of uplim2_edit as a double

val = str2double(get(hObject,'String'));
pval = get(handles.param2_menu, 'Value');
if (pval == 4 || pval == 5) && val <=0 
    set(hObject, 'String', num2str(0.001));
end
guidata(hObject,handles);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes during object creation, after setting all properties.
function uplim2_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uplim2_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on selection change in param1_menu.
function param1_menu_Callback(hObject, eventdata, handles)
% hObject    handle to param1_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns param1_menu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from param1_menu

handles = populate_3dmap_values(handles);
guidata(hObject,handles);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes during object creation, after setting all properties.
function param1_menu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to param1_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on selection change in param2_menu.
function param2_menu_Callback(hObject, eventdata, handles)
% hObject    handle to param2_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns param2_menu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from param2_menu

handles = populate_3dmap_values(handles);
guidata(hObject,handles);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes during object creation, after setting all properties.
function param2_menu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to param2_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function step1_edit_Callback(hObject, eventdata, handles)
% hObject    handle to step1_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of step1_edit as text
%        str2double(get(hObject,'String')) returns contents of step1_edit as a double

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes during object creation, after setting all properties.
function step1_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to step1_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function step2_edit_Callback(hObject, eventdata, handles)
% hObject    handle to step2_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of step2_edit as text
%        str2double(get(hObject,'String')) returns contents of step2_edit as a double

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes during object creation, after setting all properties.
function step2_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to step2_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function val_x_edit_Callback(hObject, eventdata, handles)
% hObject    handle to val_x_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of val_x_edit as text
%        str2double(get(hObject,'String')) returns contents of val_x_edit as a double

val = str2double(get(hObject,'String'));
if ~isnan(val)
    handles.params(1) = val;
end
handles = populate_3dmap_values(handles);
redraw(handles);  % Use the params instead of handles.A;
guidata(hObject,handles);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes during object creation, after setting all properties.
function val_x_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to val_x_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function val_y_edit_Callback(hObject, eventdata, handles)
% hObject    handle to val_y_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of val_y_edit as text
%        str2double(get(hObject,'String')) returns contents of val_y_edit as a double

val = str2double(get(hObject,'String'));
if ~isnan(val)
    handles.params(2) = val;
end
handles = populate_3dmap_values(handles);
handles = redraw(handles);
guidata(hObject,handles);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes during object creation, after setting all properties.
function val_y_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to val_y_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function val_rxy_edit_Callback(hObject, eventdata, handles)
% hObject    handle to val_rxy_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of val_rxy_edit as text
%        str2double(get(hObject,'String')) returns contents of val_rxy_edit as a double

val = str2double(get(hObject,'String'));
if ~isnan(val)
    handles.params(3) = val;
end
handles = populate_3dmap_values(handles);
handles = redraw(handles);
guidata(hObject,handles);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes during object creation, after setting all properties.
function val_rxy_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to val_rxy_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function val_scx_edit_Callback(hObject, eventdata, handles)
% hObject    handle to val_scx_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of val_scx_edit as text
%        str2double(get(hObject,'String')) returns contents of val_scx_edit as a double

val = str2double(get(hObject,'String'));
if ~isnan(val)
    handles.params(4) = val;
end
handles = populate_3dmap_values(handles);
handles = redraw(handles);
guidata(hObject,handles);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes during object creation, after setting all properties.
function val_scx_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to val_scx_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function val_scy_edit_Callback(hObject, eventdata, handles)
% hObject    handle to val_scy_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of val_scy_edit as text
%        str2double(get(hObject,'String')) returns contents of val_scy_edit as a double

val = str2double(get(hObject,'String'));
if ~isnan(val)
    handles.params(5) = val;
end
handles = populate_3dmap_values(handles);
handles = redraw(handles);
guidata(hObject,handles);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes during object creation, after setting all properties.
function val_scy_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to val_scy_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function val_shx_edit_Callback(hObject, eventdata, handles)
% hObject    handle to val_shx_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of val_shx_edit as text
%        str2double(get(hObject,'String')) returns contents of val_shx_edit as a double

val = str2double(get(hObject,'String'));
if ~isnan(val)
    handles.params(6) = val;
end
handles = populate_3dmap_values(handles);
handles = redraw(handles);
guidata(hObject,handles);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes during object creation, after setting all properties.
function val_shx_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to val_shx_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function val_shy_edit_Callback(hObject, eventdata, handles)
% hObject    handle to val_shy_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of val_shy_edit as text
%        str2double(get(hObject,'String')) returns contents of val_shy_edit as a double

val = str2double(get(hObject,'String'));
if ~isnan(val)
    handles.params(7) = val;
end
handles = populate_3dmap_values(handles);
handles = redraw(handles);
guidata(hObject,handles);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes during object creation, after setting all properties.
function val_shy_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to val_shy_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function handles = opt_alternation(handles)

set(handles.comment_text, 'String', sprintf('Optimization by Alternation running...'));

%Get the limits/parameters typed into the gui
lowb = ones(7,1);highb = ones(7,1);vars = ones(7,1);
lowb(1)=str2num(get(handles.edxlmin,'String'));
lowb(2)=str2num(get(handles.edylmin,'String'));
lowb(3)=str2num(get(handles.edrlmin,'String'));
lowb(4)=str2num(get(handles.edsxlmin,'String'));
lowb(5)=str2num(get(handles.edsylmin,'String'));
lowb(6)=str2num(get(handles.edshxlmin,'String'));
lowb(7)=str2num(get(handles.edshylmin,'String'));
highb(1)=str2num(get(handles.edxlmax,'String'));
highb(2)=str2num(get(handles.edylmax,'String'));
highb(3)=str2num(get(handles.edrlmax,'String'));
highb(4)=str2num(get(handles.edsxlmax,'String'));
highb(5)=str2num(get(handles.edsylmax,'String'));
highb(6)=str2num(get(handles.edshxlmax,'String'));
highb(7)=str2num(get(handles.edshylmax,'String'));

%Check which parameters to optimise
vars(1)=get(handles.ckx,'Value');%trans x
vars(2)=get(handles.cky,'Value');%trans y
vars(3)=get(handles.ckr,'Value');%rotation 
vars(4)=get(handles.cksx,'Value');%scale x
vars(5)=get(handles.cksy,'Value');%scale y
vars(6)=get(handles.ckshx,'Value');%shear x
vars(7)=get(handles.ckshy,'Value');%shear y



param_string = {'Tx', 'Ty', 'Rxy', 'Scx', 'Scy', 'Shx', 'Shy'}; 

n_iter = handles.n_iter;
ll = 0;
change = Inf;
prev = handles.A;
t1 = tic;
time_iter = []; score = [];
params_all = [];
change_all = [];
nfunk_all = [];
set(handles.axes5, 'Visible', 'On');
set(handles.function_minimization_text, 'Visible', 'On');
%this outer loop repeats optimisation over all variables 4 times
%while ll < n_iter & (change > 1)
while (change > 1) % New 2017
    
    
    %k goes from 1:7- the number of parameters to loop over
    for k=1:7
        
        %check whether this parameter is switched on - if not skip to the
        %next
        if vars(k) ~= 1
            continue
        end
        
        %if stop has been pressed, stop
        if (strcmp(get(handles.pbstart,'String'),'Start')==1);return;end;
        
        %initialize parameters for this search
        parammin = lowb(k);
        parammax = highb(k);
        
        %handles.A is the current set of affine params
        
        %DO NOT CHANGE the present value - so if it is better than the rest
        %it's not changed
        %handles.A(k)=parammin;
        %update display
        handles.curimg = afftrans_mit(handles.imgsrc, handles.A,handles.nonlinx,handles.nonliny);
        handles.curimg = abs(handles.curimg)/max(handles.curimg(:));
        
        %get the starting mutual information - mi3 returns mutual
        %information for two images. Use 64 bins for both images.
        %currentm = mi3(handles.imgtarcur, handles.curimg, 64, 64);
        currentm = of(handles.of, handles.imgtarcur, handles.curimg);
        
        %Walk through sample space - 10 steps per iteration
        step = abs((parammax - parammin))/9;
        
        %paramset and mutualset are arrays of parameter values/the
        %corresponding mutual information for the graphical display.
        paramset = handles.A(k);
        mutualset = currentm;
        for i=parammin:step:parammax
            %check if we should quit - if stop has been pressed
            if (strcmp(get(handles.pbstart,'String'),'Start')==1);return;end;
            
            %add this parameter to the parameters tried for the graph
            paramset = [paramset i];
            
            %update the affine params
            handles.A(k)=i;
            
            %calculate the new image
            handles.curimg = afftrans_mit(handles.imgsrc, handles.A,handles.nonlinx,handles.nonliny);
            handles.curimg = abs(handles.curimg)/max(handles.curimg(:));
            
            %calculate nmi and add to set for graph
            %[nmi,mi] = mi3(handles.imgtarcur,handles.curimg,64,64);
            val = of(handles.of, handles.imgtarcur, handles.curimg);
            mutualset=[mutualset val];
            
            %set up display for graph
            temp=[paramset;mutualset]';
            temp=sortrows(temp,1);
            %set(handles.axes5, 'Visible', 'On'); % Already done up:
            %set(handles.function_minimization_text, 'Visible', 'On');
            axes(handles.axes5);
            plot(temp(:,1),temp(:,2),'-o','LineWidth',2);
            set(handles.axes5,'XColor',[0 0 0]);
            set(handles.axes5,'YColor',[0 0 0]);
            set(handles.axes5,'Color',[1 1 1]);
            xlabel(sprintf('Current Param: %s', param_string{k})); ylabel(sprintf('Cost %s', handles.of_string));
            
            %redraw display so user can see what just happened
            drawnow;
        end
        
        %find the best value from the last iteration
        tempval = paramset(find(mutualset == min(mutualset)));
        %set the param to this value
        handles.A(k) = min(tempval(1));
        
        %calculate the best image from this iteration
        handles.curimg = afftrans_mit(handles.imgsrc, handles.A,handles.nonlinx,handles.nonliny);
        handles.curimg = abs(handles.curimg)/max(handles.curimg(:));
        
        %display it
        axes(handles.axes4);
        %image(toverlay2(handles.imgtarcur,handles.curimg,handles.contrnum,[255 0 0],jet));
        image(cat(3, min(1,2*(1-handles.contrnum))*handles.imgtarcur, min(1,2*(handles.contrnum))*handles.curimg, zeros(size(handles.curimg))));
        axis image
        axis off
        drawnow;
        
        %Update the boxes with parameter values
        set(handles.textnmi,'String',sprintf('%.5f %s',min(mutualset), handles.of_string));
        set(handles.edmanx,'String',sprintf('%.2f',handles.A(1)));
        set(handles.edmany,'String',sprintf('%.2f',handles.A(2)));
        set(handles.edmanscx,'String',sprintf('%.4f',handles.A(4)));
        set(handles.edmanscy,'String',sprintf('%.4f',handles.A(5)));
        set(handles.edmanrxy,'String',sprintf('%.4f',handles.A(3)));
        set(handles.edmanshx,'String',sprintf('%.4f',handles.A(6)));
        set(handles.edmanshy,'String',sprintf('%.4f',handles.A(7)));
        time_iter = [time_iter toc(t1)];
        score = [score min(mutualset)];
        params_all = [params_all handles.A(:)];
    end
    
    % Calculate % change from previous:
    change = sum(abs(100*(handles.A - prev)./(handles.A + 1E-6)));
    change_all = [change_all change];
    nfunk_all = [nfunk_all (ll+1)*70];
    %figure(2); plot(nfunk_all, change_all, '-o','LineWidth',2);
    %xlabel(sprintf('Function evaluations')); ylabel(sprintf('%% Change (from previous iteration)'));
    prev = handles.A;
    % Now reduce parameter ranges to be within 80% of current value
    for n=1:7
        range = 0.8*(highb(n) - lowb(n));
        lowb(n) = handles.A(n) - range/2;
        highb(n) = handles.A(n) + range/2;
        
        %check the minimum is less than maximum, flip if not
        if(highb(n) < lowb(n))
            tempval = lowb(n);
            lowb(n) = highb(n);
            highb(n)=tempval;
        end
    end
    ll = ll + 1;
end
% if ll > n_iter-1
%     warndlg(sprintf('Maximum number of operations reached!', (sum(vars(:))*n_iter*10)));
% end
% Save score, t2
pause(1);
axes(handles.axes5);
plot(10*(1:length(score)),score,'.-','LineWidth',2);
set(handles.axes5,'XColor',[0 0 0]);
set(handles.axes5,'YColor',[0 0 0]);
set(handles.axes5,'Color',[1 1 1]);
xlabel(sprintf('# of function evaluations')); ylabel(sprintf('Cost %s', handles.of_string));
            
aa = clock;
time_str = sprintf('%dh%dmin%dsec', fix(aa(4)), fix(aa(5)), fix(aa(6)));
fp = mfilename('fullpath');
[pd, fd, extd] = fileparts(fp);
fn = fullfile(pd, 'data', sprintf('results_alternation_%s_%s.mat', date, time_str));
num_outer_iterations = ll;
total_num_func_evaluations = sum(vars(:))*num_outer_iterations*10;
save(fn, 'time_iter', 'score', 'num_outer_iterations', 'total_num_func_evaluations', 'params_all');
set(handles.comment_text, 'String', sprintf('Results saved on: %s', fn));

return
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function handles = simplex_downhill(handles)

set(handles.comment_text, 'String', sprintf('Optimization by Downhill Simplex running...'));

%Check which parameters to optimise
vars(1)=get(handles.ckx,'Value');%trans x
vars(2)=get(handles.cky,'Value');%trans y
vars(3)=get(handles.ckr,'Value');%rotation 
vars(4)=get(handles.cksx,'Value');%scale x
vars(5)=get(handles.cksy,'Value');%scale y
vars(6)=get(handles.ckshx,'Value');%shear x
vars(7)=get(handles.ckshy,'Value');%shear y


param_string = {'Tx', 'Ty', 'Rxy', 'Scx', 'Scy', 'Shx', 'Shy'}; 
% do cleverer fit

% try downhill simplex method
x=zeros(7,7);
%p=zeros(8,7);
% p=zeros(2,7);
% p(1,1)=str2num(get(handles.edxlmin,'String'));
% p(1,2)=str2num(get(handles.edylmin,'String'));
% p(1,3)=str2num(get(handles.edrlmin,'String'));
% p(1,4)=str2num(get(handles.edsxlmin,'String'));
% p(1,5)=str2num(get(handles.edsylmin,'String'));
% p(1,6)=str2num(get(handles.edshxlmin,'String'));
% p(1,7)=str2num(get(handles.edshylmin,'String'));


initiales = handles.A(:)' - [0 0 0 1 1 0 0];

%ask what sort of steps to make in simplex method
contents = cellstr(get(handles.limits_menu,'String'));
option = contents{get(handles.limits_menu,'Value')};
switch option
    case 'Very Coarse'
        p(1,:) = [0 0 0 1 1 0 0] + initiales;
        p(2,:) = [40 0 0 1 1 0 0] + initiales; % 6
        p(3,:) = [0 40 0 1 1 0 0] + initiales; % 6
        p(4,:) = [0 0 20 1 1 0 0] + initiales;
        p(5,:) = [0 0 0 1.1 1 0 0] + initiales;
        p(6,:) = [0 0 0 1 0.9 0 0] + initiales;
        p(7,:) = [0 0 0 1 1 0.05 0] + initiales;
        p(8,:) = [0 0 0 1 1 0 -0.05] + initiales;
    case {'Coarse', 'Auto'}
        p(1,:) = [0 0 0 1 1 0 0] + initiales;
        p(2,:) = [20 0 0 1 1 0 0] + initiales; % 5
        p(3,:) = [0 20 0 1 1 0 0] + initiales; % 5
        p(4,:) = [0 0 15 1 1 0 0] + initiales;
        p(5,:) = [0 0 0 1.05 1 0 0] + initiales;
        p(6,:) = [0 0 0 1 0.95 0 0] + initiales;
        p(7,:) = [0 0 0 1 1 0.03 0] + initiales;
        p(8,:) = [0 0 0 1 1 0 -0.03] + initiales;
    case 'Fine'
        p(1,:) = [0 0 0 1 1 0 0] + initiales;
        p(2,:) = [1 0 0 1 1 0 0] + initiales;
        p(3,:) = [0 1 0 1 1 0 0] + initiales;
        p(4,:) = [0 0 1 1 1 0 0] + initiales;
        p(5,:) = [0 0 0 1.001 1 0 0] + initiales;
        p(6,:) = [0 0 0 1 0.999 0 0] + initiales;
        p(7,:) = [0 0 0 1 1 0.001 0] + initiales;
        p(8,:) = [0 0 0 1 1 0 -0.001] + initiales;
    otherwise % Auto = Coarse:
        p(1,:) = [0 0 0 1 1 0 0] + initiales;
        p(2,:) = [3 0 0 1 1 0 0] + initiales; % 5
        p(3,:) = [0 3 0 1 1 0 0] + initiales; % 5
        p(4,:) = [0 0 5 1 1 0 0] + initiales;
        p(5,:) = [0 0 0 1.05 1 0 0] + initiales;
        p(6,:) = [0 0 0 1 0.95 0 0] + initiales;
        p(7,:) = [0 0 0 1 1 0.03 0] + initiales;
        p(8,:) = [0 0 0 1 1 0 -0.03] + initiales;
end

% To choose only those variables that are selected! By David.
p = p([1 (1+find(vars))], :);
vars2 = find(vars == 0); % Vars2 is now the pointer to those variables that do not require update!!
p_orig = p(1, :);

y=zeros(size(p,1),1);
%y=zeros(8,1);
for i=1:size(p,1)
    handles.A = squeeze(p(i,:));
    handles.curimg = afftrans_mit(handles.imgsrc, handles.A,handles.nonlinx,handles.nonliny);
    handles.curimg = abs(handles.curimg)/max(handles.curimg(:));
    %nmi=-mi3(handles.imgtarcur,handles.curimg,64,64);
    val = of(handles.of, handles.imgtarcur, handles.curimg);
    y(i) = val;
end

ftol = 0.0000002;

mpts = size(p, 1); % 8
ndim = size(p, 2); % 7;
psum = zeros(ndim,1);
nfunk = 0;

psum=get_psum(p);

Nmax = sum(vars(:))*10*handles.n_iter;
ll = 0;
change = Inf;
prev = p;
t1 = tic;
time_iter = []; score = [];
params_all = [];
change_all = [];
nfunk_all = [];
while change > 1 % Before it was while 1: New 2017 version
    % By David: get A to be the one with the minumum:
    [YY, II] = min(y);
    handles.A = squeeze(p(II,:));
    params_all = [params_all handles.A(:)];
    
    set(handles.textnmi,'String',sprintf('%.5f %s',min(y), handles.of_string));
    set(handles.edmanx,'String',sprintf('%.2f',handles.A(1)));
    set(handles.edmany,'String',sprintf('%.2f',handles.A(2)));
    set(handles.edmanscx,'String',sprintf('%.4f',handles.A(4)));
    set(handles.edmanscy,'String',sprintf('%.4f',handles.A(5)));
    set(handles.edmanrxy,'String',sprintf('%.4f',handles.A(3)));
    set(handles.edmanshx,'String',sprintf('%.4f',handles.A(6)));
    set(handles.edmanshy,'String',sprintf('%.4f',handles.A(7)));
    handles.curimg = afftrans_mit(handles.imgsrc, handles.A,handles.nonlinx,handles.nonliny);
    handles.curimg = abs(handles.curimg)/max(handles.curimg(:));
    axes(handles.axes4);
    %image(toverlay2(handles.imgtarcur,handles.curimg,handles.contrnum,[255 0 0],jet));
    image(cat(3, min(1,2*(1-handles.contrnum))*handles.imgtarcur, min(1,2*(handles.contrnum))*handles.curimg, zeros(size(handles.curimg))));
    axis image
    axis off
    drawnow;
    pause(0.1);
    if (strcmp(get(handles.pbstart,'String'),'Start')==1);return;end;
    
    ilo=1; %0 in NR
    
    %Have to order the points: which is the best, worst.. loop over
    %points in the simplex to find out
    
    if(y(1) > y(2))
        inhi=2;
        ihi=1;
    else
        inhi=1;
        ihi=2;
    end
    
    for i=1:mpts
        if(y(i)<=y(ilo)) ilo = i;end;
        if(y(i)>y(ihi))
            inhi=ihi;
            ihi=i;
        elseif (y(i)>y(inhi) && i ~= ihi) inhi=i;
        end
    end
    
    rtol=2.0*abs(y(ihi)-y(ilo))/(abs(y(ihi))+abs(y(ilo))+1e-10);
    
    %compute the fractional range from highest to lowest and return
    %if satisfactory
    if(rtol < ftol)
        temp = y(1);
        y(1)=y(ilo);
        y(ilo)=temp;
        
        for i=1:ndim
            temp = p(1,i);
            p(1,i) = p(ilo,i);
            p(ilo,i) = temp;
        end
        
        break
    end
    
    %if (nfunk > Nmax); break; end % New for 2017: Do not stop by number of function evaluations  
    
    nfunk=nfunk+2;
    
    %begin a new iteration. extrapolate by a factor -1 through the
    %simplex across from the high points, i.e., reflect the simplex
    %from the high point
    
    fac = -1.0;
    
    ptry = zeros(ndim,1);
    fac1=(1.0-fac)/ndim;
    fac2=fac1-fac;
    
    for j=1:ndim
        ptry(j) = psum(j)*fac1 -p(ihi,j)*fac2;
    end
    
    % For those unselected variables keep the original value:
    ptry(vars2) = p_orig(vars2); % By David
    
    handles.A = ptry;
    handles.curimg = afftrans_mit(handles.imgsrc, handles.A,handles.nonlinx,handles.nonliny);
    handles.curimg = abs(handles.curimg)/max(handles.curimg(:));
    %ytry = -mi3(handles.imgtarcur,handles.curimg,64,64);
    ytry = of(handles.of, handles.imgtarcur,handles.curimg);
    
    if(ytry < y(ihi))
        y(ihi)=ytry;
        
        for j=1:ndim
            psum(j) = psum(j) + ptry(j) - p(ihi,j);
            p(ihi,j)=ptry(j);
        end
    end
    
    if(ytry <= y(ilo))
        %gives a better result than the best so far so try an
        %additional extrapolation factor 2
        fac = 2.0;
        
        
%         axes(handles.axes4);image(toverlay2(handles.imgtarcur,handles.curimg,handles.contrnum,[255 0 0],jet));
%         axis image
%         axis off
%         drawnow;
        
        ptry = zeros(ndim,1);
        fac1=(1.0-fac)/ndim;
        fac2=fac1-fac;
        
        for j=1:ndim
            ptry(j) = psum(j)*fac1 -p(ihi,j)*fac2;
        end
        
        ptry(vars2) = p_orig(vars2); % By David
        
        handles.A = ptry;
        handles.curimg = afftrans_mit(handles.imgsrc, handles.A,handles.nonlinx,handles.nonliny);
        handles.curimg = abs(handles.curimg)/max(handles.curimg(:));
        %ytry = -mi3(handles.imgtarcur,handles.curimg,64,64);
        ytry = of(handles.of, handles.imgtarcur,handles.curimg);
        
        if(ytry < y(ihi))
            y(ihi)=ytry;
            
            for j=1:ndim
                psum(j) = psum(j) + ptry(j) - p(ihi,j);
                p(ihi,j)=ptry(j);
            end
        end
        
    elseif (ytry >= y(inhi))
        ysave=y(ihi);
        
        fac = 0.5;
        ptry = zeros(ndim,1);
        fac1=(1.0-fac)/ndim;
        fac2=fac1-fac;
        
        for j=1:ndim
            ptry(j) = psum(j)*fac1 -p(ihi,j)*fac2;
        end
        
        ptry(vars2) = p_orig(vars2); % By David

        handles.A = ptry;
        handles.curimg = afftrans_mit(handles.imgsrc, handles.A,handles.nonlinx,handles.nonliny);
        handles.curimg = abs(handles.curimg)/max(handles.curimg(:));
        %ytry = -mi3(handles.imgtarcur,handles.curimg,64,64);
        ytry = of(handles.of, handles.imgtarcur,handles.curimg);
        
        if(ytry < y(ihi))
            y(ihi)=ytry;
            
            for j=1:ndim
                psum(j) = psum(j) + ptry(j) - p(ihi,j);
                p(ihi,j)=ptry(j);
            end
        end
        
        if(ytry >= ysave)
            %can't seem to get rid of high point. better contract
            %around the lowest (best) point
            
            for i=1:mpts
                if(i ~= ilo)
                    
                    for j=1:ndim
                        
                        psum(j)=0.5*(p(i,j)+p(ilo,j));
                        p(i,j)=psum(j);
                    end
                    
                    psum(vars2) = p_orig(vars2);
                    p(i, vars2) = p_orig(vars2); % By David

                    handles.A = psum;
                    handles.curimg = afftrans_mit(handles.imgsrc, handles.A,handles.nonlinx,handles.nonliny);
                    handles.curimg = abs(handles.curimg)/max(handles.curimg(:));
                    %nmi=-mi3(handles.imgtarcur,handles.curimg,64,64);
                    val = of(handles.of, handles.imgtarcur,handles.curimg);
                    y(i) = val;%-mi3(handles.imgtarcur,handles.curimg,64,64);
                    
                end
            end
            
            nfunk = nfunk + ndim;
            psum=get_psum(p);
        end
    else
        nfunk = nfunk -1;
    end
    time_iter = [time_iter toc(t1)];
    score = [score min(y)];
    % New for 2017:
    [YY, II] = min(y);
    change = sum(abs(100*(p(:) - prev(:))./(p(:) + 1E-6)));
    change_all = [change_all change];
    nfunk_all = [nfunk_all nfunk];
    %figure(2); plot(nfunk_all, change_all, '-o','LineWidth',2);
    %xlabel(sprintf('Function evaluations')); ylabel(sprintf('%% Change (from previous iteration)'));
    prev = p;
    % Make a plot on the display area:
    set(handles.axes5, 'Visible', 'On');
    set(handles.function_minimization_text, 'Visible', 'On');
    axes(handles.axes5);
    plot(nfunk_all, score,'*-','LineWidth',2);
    set(handles.axes5,'XColor',[0 0 0]);
    set(handles.axes5,'YColor',[0 0 0]);
    set(handles.axes5,'Color',[1 1 1]);
    xlabel(sprintf('# of function evaluations')); ylabel(sprintf('Cost %s', handles.of_string));
    %redraw display so user can see what just happened
    drawnow;
    % End of new for 2017;
    ll = ll + 1;
    
end
[YY, II] = min(y);
handles.A = squeeze(p(II,:));
set(handles.textnmi,'String',sprintf('%.5f %s', min(y), handles.of_string));
set(handles.edmanx,'String',sprintf('%.2f',handles.A(1)));
set(handles.edmany,'String',sprintf('%.2f',handles.A(2)));
set(handles.edmanscx,'String',sprintf('%.4f',handles.A(4)));
set(handles.edmanscy,'String',sprintf('%.4f',handles.A(5)));
set(handles.edmanrxy,'String',sprintf('%.4f',handles.A(3)));
set(handles.edmanshx,'String',sprintf('%.4f',handles.A(6)));
set(handles.edmanshy,'String',sprintf('%.4f',handles.A(7)));
handles.curimg = afftrans_mit(handles.imgsrc, handles.A,handles.nonlinx,handles.nonliny);
handles.curimg = abs(handles.curimg)/max(handles.curimg(:));
axes(handles.axes4);
%image(toverlay2(handles.imgtarcur,handles.curimg,handles.contrnum,[255 0 0],jet));
image(cat(3, min(1,2*(1-handles.contrnum))*handles.imgtarcur, min(1,2*(handles.contrnum))*handles.curimg, zeros(size(handles.curimg))));
axis image
axis off
drawnow;
pause(0.1);
aa = clock;
time_str = sprintf('%dh%dmin%dsec', fix(aa(4)), fix(aa(5)), fix(aa(6)));
fp = mfilename('fullpath');
[pd, fd, extd] = fileparts(fp);
fn = fullfile(pd, 'data', sprintf('results_simplex_%s_%s.mat', date, time_str));
num_iterations = ll-1;
%total_num_func_evaluations = sum(vars(:))*num_iterations*10;
total_num_func_evaluations = nfunk;
save(fn, 'time_iter', 'score', 'num_iterations', 'total_num_func_evaluations', 'params_all');
set(handles.comment_text, 'String', sprintf('Results saved on: %s', fn));

return
