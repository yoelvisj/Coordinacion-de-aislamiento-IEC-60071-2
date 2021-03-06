function varargout = coordinacion(varargin)
% COORDINACION M-file for coordinacion.fig
%      COORDINACION, by itself, creates a new COORDINACION or raises the existing
%      singleton*.
%
%      H = COORDINACION returns the handle to a new COORDINACION or the handle to
%      the existing singleton*.
%
%      COORDINACION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in COORDINACION.M with the given input arguments.
%
%      COORDINACION('Property','Value',...) creates a new COORDINACION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before coordinacion_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to coordinacion_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help coordinacion

% Last Modified by GUIDE v2.5 20-May-2015 08:39:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @coordinacion_OpeningFcn, ...
                   'gui_OutputFcn',  @coordinacion_OutputFcn, ...
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


% --- Executes just before coordinacion is made visible.
function coordinacion_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to coordinacion (see VARARGIN)
%Seleccionamos el axes1.
axes(handles.axes1);
axis off;
%Guardamos el path de la primera imagen
path1='pdvsa.png';
%Leemos la imagen convirtiendola en una matriz
imag1=imread(path1);
%Mostramos la imagen en el axes
imshow(imag1);
%Desabilitamos los ejes vertical y horizontal
axis off;

%Seleccionamos el axes2.
axes(handles.axes2);
axis off;
%Guardamos el path de la primera imagen
path2='seo.jpg';
%Leemos la imagen convirtiendola en una matriz
imag2=imread(path2);
%Mostramos la imagen en el axes
imshow(imag2);
%Desabilitamos los ejes vertical y horizontal
axis off;

%Seleccionamos el axes3.
axes(handles.axes3);
axis off;
%Guardamos el path de la primera imagen
path3='SE negro.png';
%Leemos la imagen convirtiendola en una matriz
imag3=imread(path3);
%Mostramos la imagen en el axes
imshow(imag3);
%Desabilitamos los ejes vertical y horizontal
axis off;

% Choose default command line output for coordinacion
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes coordinacion wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = coordinacion_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(gcbf)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Datos
close(gcbf)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
acerca=['     Yoelvis Jim�nez      Lu�s Torrelles' char(10) char(10) '     Pedro �lvarez        Carlos V�squez' char(10) char(10) '     Gerencia de Servicios El�ctricos' char(10) '        Petr�leos de Venezuela, S.A.'];
msgbox(acerca,'Autores');


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1
