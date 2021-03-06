function varargout = Resultados(varargin)
% RESULTADOS MATLAB code for Resultados.fig
%      RESULTADOS, by itself, creates a new RESULTADOS or raises the existing
%      singleton*.
%
%      H = RESULTADOS returns the handle to a new RESULTADOS or the handle to
%      the existing singleton*.
%
%      RESULTADOS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RESULTADOS.M with the given input arguments.
%
%      RESULTADOS('Property','Value',...) creates a new RESULTADOS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Resultados_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Resultados_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Resultados

% Last Modified by GUIDE v2.5 26-May-2015 08:07:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Resultados_OpeningFcn, ...
                   'gui_OutputFcn',  @Resultados_OutputFcn, ...
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


% --- Executes just before Resultados is made visible.
function Resultados_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Resultados (see VARARGIN)
global U_potencia_ext U_potencia_int U_maniobra_ext U_maniobra_int U_rayo_ext U_rayo_int U_ff_potencia U_ft_potencia U_ff_maniobra U_ft_maniobra U_ff_rayo U_ft_rayo BSL_cal BIL_cal Us_nor BSL_nor BIL_nor d_estr_bar d_cond_estr
set(handles.text2,'string',[num2str(BSL_cal) ' kV']);
set(handles.text4,'string',[num2str(BIL_cal) ' kV']);
set(handles.text6,'string',[num2str(BSL_nor) ' kV']);
set(handles.text8,'string',[num2str(BIL_nor) ' kV']);
set(handles.text10,'string',[num2str(d_estr_bar) ' mm']);
set(handles.text12,'string',[num2str(d_cond_estr) ' mm']);

% Choose default command line output for Resultados
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Resultados wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Resultados_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close Datos
close


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(gcbf)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global camino
camino=get(handles.edit2,'String');
hoja_de_calculo


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.text13,'Enable','on');
set(handles.edit2,'Enable','on');
set(handles.pushbutton3,'Enable','on');


function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
