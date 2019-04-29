function varargout = NBAGUI(varargin)
% NBAGUI MATLAB code for NBAGUI.fig
%      NBAGUI, by itself, creates a new NBAGUI or raises the existing
%      singleton*.
%
%      H = NBAGUI returns the handle to a new NBAGUI or the handle to
%      the existing singleton*.
%
%      NBAGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NBAGUI.M with the given input arguments.
%
%      NBAGUI('Property','Value',...) creates a new NBAGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before NBAGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to NBAGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help NBAGUI

% Last Modified by GUIDE v2.5 25-Apr-2019 00:45:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @NBAGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @NBAGUI_OutputFcn, ...
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


% --- Executes just before NBAGUI is made visible.
function NBAGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to NBAGUI (see VARARGIN)

% Choose default command line output for NBAGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes NBAGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% cover picture for the start of the game
axes(handles.picBackground)
pic=imread('cover.jpg');
handles.picBackground = image(pic);
axis off
axis image
guidata(hObject, handles);

set(handles.picBackground, 'visible', 'on');


% music
global y;
global Fs;
global song;
%load handel.mat
%filename= 'NBAGUI.wav';
%audiowrite(filename,y,Fs);
[y,Fs] = audioread('NBAGUI.wav');
song = audioplayer(y,Fs);
song.StopFcn = @(src, event) play(src);
play(song)


global selectedPlayer1;
global selectedPlayer2;
global selectedPlayer3;
global selectedPlayer4;
global selectedPlayer5;
global selectedPlayer6;
global selectedPlayer7;
global selectedPlayer8;
global selectedPlayer9;
global selectedPlayer10;
selectedPlayer1 = 'Lebron James';
selectedPlayer2 = 'Lebron James';
selectedPlayer3 = 'Lebron James';
selectedPlayer4 = 'Lebron James';
selectedPlayer5 = 'Lebron James';
selectedPlayer6 = 'Lebron James';
selectedPlayer7 = 'Lebron James';
selectedPlayer8 = 'Lebron James';
selectedPlayer9 = 'Lebron James';
selectedPlayer10 = 'Lebron James';

% --- Outputs from this function are returned to the command line.
function varargout = NBAGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in startButton.
function startButton_Callback(hObject, eventdata, handles)
% hObject    handle to startButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% hide start page
set(handles.startButton,'visible','off')
set(handles.gameTitle,'visible','off')
set(handles.matText,'visible','off')

% show user team options
set(handles.playerTitle,'visible','on')

set(handles.userPlayer1,'visible','on')
set(handles.userPlayer2,'visible','on')
set(handles.userPlayer3,'visible','on')
set(handles.userPlayer4,'visible','on')
set(handles.userPlayer5,'visible','on')

set(handles.playersList1,'visible','on')
set(handles.playersList2,'visible','on')
set(handles.playersList3,'visible','on')
set(handles.playersList4,'visible','on')
set(handles.playersList5,'visible','on')

% show computer team options
set(handles.oppPlayer1,'visible','on')
set(handles.oppPlayer2,'visible','on')
set(handles.oppPlayer3,'visible','on')
set(handles.oppPlayer4,'visible','on')
set(handles.oppPlayer5,'visible','on')

set(handles.oppTitle,'visible','on')

set(handles.oppList1,'visible','on')
set(handles.oppList2,'visible','on')
set(handles.oppList3,'visible','on')
set(handles.oppList4,'visible','on')
set(handles.oppList5,'visible','on')

set(handles.finalizeButton,'visible','on')

set(handles.picBackground, 'visible', 'off')

% your team shows lebron pictures
axes(handles.userPlayer1)
firstphoto=imread('NewPictures/Lebron James.jpg');
handles.userPlayers1= image(firstphoto);
axis off

axes(handles.userPlayer2)
firstphoto=imread('NewPictures/Lebron James.jpg');
handles.userPlayers2= image(firstphoto);
axis off

axes(handles.userPlayer3)
firstphoto=imread('NewPictures/Lebron James.jpg');
handles.userPlayers3= image(firstphoto);
axis off

axes(handles.userPlayer4)
firstphoto=imread('NewPictures/Lebron James.jpg');
handles.userPlayers4= image(firstphoto);
axis off

axes(handles.userPlayer5)
firstphoto=imread('NewPictures/Lebron James.jpg');
handles.userPlayer5= image(firstphoto);
axis off

% opponent team shows lebron pictures
axes(handles.oppPlayer1)
firstphoto=imread('NewPictures/Lebron James.jpg');
handles.userPlayers1= image(firstphoto);
axis off

axes(handles.oppPlayer2)
firstphoto=imread('NewPictures/Lebron James.jpg');
handles.userPlayers2= image(firstphoto);
axis off

axes(handles.oppPlayer3)
firstphoto=imread('NewPictures/Lebron James.jpg');
handles.userPlayers3= image(firstphoto);
axis off

axes(handles.oppPlayer4)
firstphoto=imread('NewPictures/Lebron James.jpg');
handles.userPlayers4= image(firstphoto);
axis off

axes(handles.oppPlayer5)
firstphoto=imread('NewPictures/Lebron James.jpg');
handles.userPlayer5= image(firstphoto);
axis off

% --- Executes on selection change in playersList1.
function playersList1_Callback(hObject, eventdata, handles)
% hObject    handle to playersList1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns playersList1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from playersList1

% show pictures of players
global selectedPlayer1;
players = handles.playersList1.String;
image = importdata('Players2.0.txt');
keySet = players;
valueSet = image;
M = containers.Map(keySet,valueSet);

contents = cellstr(get(hObject,'String'));
selectedPlayer1 = contents{get(hObject,'Value')};
a = imread(M(selectedPlayer1));
imshow(a,'Parent',handles.userPlayer1);


% --- Executes during object creation, after setting all properties.
function playersList1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to playersList1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in playersList2.
function playersList2_Callback(hObject, eventdata, handles)
% hObject    handle to playersList2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns playersList2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from playersList2

global selectedPlayer2;
% show pictures of players
players = handles.playersList2.String;
image = importdata('Players2.0.txt');
keySet = players;
valueSet = image;
M = containers.Map(keySet,valueSet);

contents = cellstr(get(hObject,'String'));
selectedPlayer2 = contents{get(hObject,'Value')};
a = imread(M(selectedPlayer2));
imshow(a,'Parent',handles.userPlayer2);

% --- Executes during object creation, after setting all properties.
function playersList2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to playersList2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in playersList3.
function playersList3_Callback(hObject, eventdata, handles)
% hObject    handle to playersList3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns playersList3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from playersList3

global selectedPlayer3;
% show pictures of players
players = handles.playersList3.String;
image = importdata('Players2.0.txt');
keySet = players;
valueSet = image;
M = containers.Map(keySet,valueSet);

contents = cellstr(get(hObject,'String'));
selectedPlayer3 = contents{get(hObject,'Value')};
a = imread(M(selectedPlayer3));
imshow(a,'Parent',handles.userPlayer3);

% --- Executes during object creation, after setting all properties.
function playersList3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to playersList3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in playersList4.
function playersList4_Callback(hObject, eventdata, handles)
% hObject    handle to playersList4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns playersList4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from playersList4

global selectedPlayer4;
% show pictures of players
players = handles.playersList4.String;
image = importdata('Players2.0.txt');
keySet = players;
valueSet = image;
M = containers.Map(keySet,valueSet);

contents = cellstr(get(hObject,'String'));
selectedPlayer4 = contents{get(hObject,'Value')};
a = imread(M(selectedPlayer4));
imshow(a,'Parent',handles.userPlayer4);

% --- Executes during object creation, after setting all properties.
function playersList4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to playersList4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in playersList5.
function playersList5_Callback(hObject, eventdata, handles)
% hObject    handle to playersList5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns playersList5 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from playersList5

global selectedPlayer5;
% show pictures of players
players = handles.playersList5.String;
image = importdata('Players2.0.txt');
keySet = players;
valueSet = image;
M = containers.Map(keySet,valueSet);

contents = cellstr(get(hObject,'String'));
selectedPlayer5 = contents{get(hObject,'Value')};
a = imread(M(selectedPlayer5));
imshow(a,'Parent',handles.userPlayer5);

% --- Executes during object creation, after setting all properties.
function playersList5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to playersList5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
    
% --- Executes on selection change in oppList1.
function oppList1_Callback(hObject, eventdata, handles)
% hObject    handle to oppList1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns oppList1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from oppList1

global selectedPlayer6;
% show pictures of players
players = handles.oppList1.String;
image = importdata('Players2.0.txt');
keySet = players;
valueSet = image;
M = containers.Map(keySet,valueSet);

contents = cellstr(get(hObject,'String'));
selectedPlayer6 = contents{get(hObject,'Value')};
a = imread(M(selectedPlayer6));
imshow(a,'Parent',handles.oppPlayer1);

% --- Executes during object creation, after setting all properties.
function oppList1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to oppList1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in oppList2.
function oppList2_Callback(hObject, eventdata, handles)
% hObject    handle to oppList2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns oppList2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from oppList2

global selectedPlayer7;
% show pictures of players
players = handles.oppList2.String;
image = importdata('Players2.0.txt');
keySet = players;
valueSet = image;
M = containers.Map(keySet,valueSet);

contents = cellstr(get(hObject,'String'));
selectedPlayer7 = contents{get(hObject,'Value')};
a = imread(M(selectedPlayer7));
imshow(a,'Parent',handles.oppPlayer2);

% --- Executes during object creation, after setting all properties.
function oppList2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to oppList2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in oppList3.
function oppList3_Callback(hObject, eventdata, handles)
% hObject    handle to oppList3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns oppList3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from oppList3

global selectedPlayer8;
% show pictures of players
players = handles.oppList3.String;
image = importdata('Players2.0.txt');
keySet = players;
valueSet = image;
M = containers.Map(keySet,valueSet);

contents = cellstr(get(hObject,'String'));
selectedPlayer8 = contents{get(hObject,'Value')};
a = imread(M(selectedPlayer8));
imshow(a,'Parent',handles.oppPlayer3);

% --- Executes during object creation, after setting all properties.
function oppList3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to oppList3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in oppList4.
function oppList4_Callback(hObject, eventdata, handles)
% hObject    handle to oppList4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns oppList4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from oppList4

global selectedPlayer9;
% show pictures of players
players = handles.oppList4.String;
image = importdata('Players2.0.txt');
keySet = players;
valueSet = image;
M = containers.Map(keySet,valueSet);

contents = cellstr(get(hObject,'String'));
selectedPlayer9 = contents{get(hObject,'Value')};
a = imread(M(selectedPlayer9));
imshow(a,'Parent',handles.oppPlayer4);

% --- Executes during object creation, after setting all properties.
function oppList4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to oppList4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in oppList5.
function oppList5_Callback(hObject, eventdata, handles)
% hObject    handle to oppList5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns oppList5 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from oppList5

global selectedPlayer10;
% show pictures of players
players = handles.oppList5.String;
image = importdata('Players2.0.txt');
keySet = players;
valueSet = image;
M = containers.Map(keySet,valueSet);

contents = cellstr(get(hObject,'String'));
selectedPlayer10 = contents{get(hObject,'Value')};
a = imread(M(selectedPlayer10));
imshow(a,'Parent',handles.oppPlayer5);

% --- Executes during object creation, after setting all properties.
function oppList5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to oppList5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in finalizeButton.
function finalizeButton_Callback(hObject, eventdata, handles)
% hObject    handle to finalizeButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    
% hide player lists
set(handles.playersList1,'visible','off')
set(handles.playersList2,'visible','off')
set(handles.playersList3,'visible','off')
set(handles.playersList4,'visible','off')
set(handles.playersList5,'visible','off')

% hide opponent options
set(handles.oppList1,'visible','off')
set(handles.oppList2,'visible','off')
set(handles.oppList3,'visible','off')
set(handles.oppList4,'visible','off')
set(handles.oppList5,'visible','off')

% show strategy options
set(handles.strategyList1,'visible','on')
set(handles.strategyList2,'visible','on')
set(handles.strategyList3,'visible','on')
set(handles.strategyList4,'visible','on')
set(handles.strategyList5,'visible','on')
set(handles.strategyList6,'visible','on')
set(handles.strategyList7,'visible','on')
set(handles.strategyList8,'visible','on')
set(handles.strategyList9,'visible','on')
set(handles.strategyList10,'visible','on')
set(handles.playButton,'visible','on')

% change wording
handles.playerTitle.String='YOUR TEAM- CHOOSE PLAYER STRATEGIES';
handles.oppTitle.String='YOUR OPPONENT- CHOOSE PLAYER STRATEGIES';

% hide finalize button
set(handles.finalizeButton,'visible','off')

% --- Executes on selection change in strategyList1.
function strategyList1_Callback(hObject, eventdata, handles)
% hObject    handle to strategyList1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns strategyList1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from strategyList1


% --- Executes during object creation, after setting all properties.
function strategyList1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to strategyList1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in strategyList2.
function strategyList2_Callback(hObject, eventdata, handles)
% hObject    handle to strategyList2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns strategyList2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from strategyList2


% --- Executes during object creation, after setting all properties.
function strategyList2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to strategyList2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in strategyList3.
function strategyList3_Callback(hObject, eventdata, handles)
% hObject    handle to strategyList3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns strategyList3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from strategyList3


% --- Executes during object creation, after setting all properties.
function strategyList3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to strategyList3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in strategyList4.
function strategyList4_Callback(hObject, eventdata, handles)
% hObject    handle to strategyList4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns strategyList4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from strategyList4


% --- Executes during object creation, after setting all properties.
function strategyList4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to strategyList4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in strategyList5.
function strategyList5_Callback(hObject, eventdata, handles)
% hObject    handle to strategyList5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns strategyList5 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from strategyList5


% --- Executes during object creation, after setting all properties.
function strategyList5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to strategyList5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in strategyList6.
function strategyList6_Callback(hObject, eventdata, handles)
% hObject    handle to strategyList6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns strategyList6 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from strategyList6


% --- Executes during object creation, after setting all properties.
function strategyList6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to strategyList6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in strategyList7.
function strategyList7_Callback(hObject, eventdata, handles)
% hObject    handle to strategyList7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns strategyList7 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from strategyList7


% --- Executes during object creation, after setting all properties.
function strategyList7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to strategyList7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in strategyList8.
function strategyList8_Callback(hObject, eventdata, handles)
% hObject    handle to strategyList8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns strategyList8 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from strategyList8


% --- Executes during object creation, after setting all properties.
function strategyList8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to strategyList8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in strategyList9.
function strategyList9_Callback(hObject, eventdata, handles)
% hObject    handle to strategyList9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns strategyList9 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from strategyList9


% --- Executes during object creation, after setting all properties.
function strategyList9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to strategyList9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in strategyList10.
function strategyList10_Callback(hObject, eventdata, handles)
% hObject    handle to strategyList10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns strategyList10 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from strategyList10


% --- Executes during object creation, after setting all properties.
function strategyList10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to strategyList10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in playButton.
function playButton_Callback(hObject, eventdata, handles)
% hObject    handle to playButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global selectedPlayer1;
global selectedPlayer2;
global selectedPlayer3;
global selectedPlayer4;
global selectedPlayer5;
global selectedPlayer6;
global selectedPlayer7;
global selectedPlayer8;
global selectedPlayer9;
global selectedPlayer10;
global boxScore1;
global boxScore2;
                   
p1Index = getIndexF(selectedPlayer1);
p2Index = getIndexF(selectedPlayer2);
p3Index = getIndexF(selectedPlayer3);
p4Index = getIndexF(selectedPlayer4);
p5Index = getIndexF(selectedPlayer5);
p6Index = getIndexF(selectedPlayer6);
p7Index = getIndexF(selectedPlayer7);
p8Index = getIndexF(selectedPlayer8);
p9Index = getIndexF(selectedPlayer9);
p10Index = getIndexF(selectedPlayer10);

p1Strat = handles.strategyList1.Value;
p2Strat = handles.strategyList2.Value;
p3Strat = handles.strategyList3.Value;
p4Strat = handles.strategyList4.Value;
p5Strat = handles.strategyList5.Value;
p6Strat = handles.strategyList6.Value;
p7Strat = handles.strategyList7.Value;
p8Strat = handles.strategyList8.Value;
p9Strat = handles.strategyList9.Value;
p10Strat = handles.strategyList10.Value;

[boxScore1,boxScore2] = GameF(p1Index,p2Index,p3Index,p4Index,p5Index,...
                                p6Index,p7Index,p8Index,p9Index,p10Index,...
                                p1Strat,p2Strat,p3Strat,p4Strat,p5Strat,...
                                p6Strat,p7Strat,p8Strat,p9Strat,p10Strat);
                            
set(handles.boxScore1,'Data', boxScore1); 
set(handles.boxScore2,'Data', boxScore2); 

% hide section
set(handles.strategyList1,'visible','off')
set(handles.strategyList2,'visible','off')
set(handles.strategyList3,'visible','off')
set(handles.strategyList4,'visible','off')
set(handles.strategyList5,'visible','off')
set(handles.strategyList6,'visible','off')
set(handles.strategyList7,'visible','off')
set(handles.strategyList8,'visible','off')
set(handles.strategyList9,'visible','off')
set(handles.strategyList10,'visible','off')
set(handles.playButton,'visible','off')

% show box score and result
set(handles.resultText,'visible','on')
set(handles.scoreText,'visible','on')
set(handles.boxScore1,'visible','on')
set(handles.boxScore2,'visible','on')
set(handles.boxTitle1,'visible','on')
set(handles.boxTitle2,'visible','on')

% show replay button that resets all
set(handles.replayButton,'visible','on')

% change wording
handles.playerTitle.String='YOUR TEAM';
handles.oppTitle.String='YOUR OPPONENT';


% move components
handles.playerTitle.Position= [1.1428571428571428 12 33.0 1.4000000000000004];

handles.userPlayer1.Position= [1.1428571428571428 3.0 14.428571428571427 6.733333333333334];

handles.userPlayer2.Position= [15.714285714285714 3.0 14.428571428571427 6.733333333333334];

handles.userPlayer3.Position= [30.285714285714285 3.0 14.428571428571427 6.733333333333334];

handles.userPlayer4.Position= [44.857142857142854 3.0 14.428571428571427 6.733333333333334];

handles.userPlayer5.Position= [59.42857142857142 3.0 14.428571428571427 6.733333333333334];

handles.oppTitle.Position= [75.42857142857143 12 33.0 1.4000000000000004];

handles.oppPlayer1.Position= [75.42857142857143 3.0 14.428571428571427 6.733333333333334];

handles.oppPlayer2.Position= [90 3.0 14.428571428571427 6.733333333333334];

handles.oppPlayer3.Position= [104.57142857142857 3.0 14.428571428571427 6.733333333333334];

handles.oppPlayer4.Position= [119.14285714285714 3.0 14.428571428571427 6.733333333333334];

handles.oppPlayer5.Position= [133.7142857142857 3.0 14.428571428571427 6.733333333333334];

% strategy Name
if handles.strategyList1.Value == 1
    handles.strategyName1.String = 'Aggressive';
elseif handles.strategyList1.Value == 2
    handles.strategyName1.String = 'Defensive';
elseif handles.strategyList1.Value == 3
    handles.strategyName1.String = 'Neutral';
end

if handles.strategyList2.Value == 1
    handles.strategyName2.String = 'Aggressive';
elseif handles.strategyList2.Value == 2
    handles.strategyName2.String = 'Defensive';
elseif handles.strategyList2.Value == 3
    handles.strategyName2.String = 'Neutral';
end

if handles.strategyList3.Value == 1
    handles.strategyName3.String = 'Aggressive';
elseif handles.strategyList3.Value == 2
    handles.strategyName3.String = 'Defensive';
elseif handles.strategyList3.Value == 3
    handles.strategyName3.String = 'Neutral';
end

if handles.strategyList4.Value == 1
    handles.strategyName4.String = 'Aggressive';
elseif handles.strategyList4.Value == 2
    handles.strategyName4.String = 'Defensive';
elseif handles.strategyList4.Value == 3
    handles.strategyName4.String = 'Neutral';
end

if handles.strategyList5.Value == 1
    handles.strategyName5.String = 'Aggressive';
elseif handles.strategyList5.Value == 2
    handles.strategyName5.String = 'Defensive';
elseif handles.strategyList5.Value == 3
    handles.strategyName5.String = 'Neutral';
end

if handles.strategyList6.Value == 1
    handles.strategyName6.String = 'Aggressive';
elseif handles.strategyList6.Value == 2
    handles.strategyName6.String = 'Defensive';
elseif handles.strategyList6.Value == 3
    handles.strategyName6.String = 'Neutral';
end

if handles.strategyList7.Value == 1
    handles.strategyName7.String = 'Aggressive';
elseif handles.strategyList7.Value == 2
    handles.strategyName7.String = 'Defensive';
elseif handles.strategyList7.Value == 3
    handles.strategyName7.String = 'Neutral';
end

if handles.strategyList8.Value == 1
    handles.strategyName8.String = 'Aggressive';
elseif handles.strategyList8.Value == 2
    handles.strategyName8.String = 'Defensive';
elseif handles.strategyList8.Value == 3
    handles.strategyName8.String = 'Neutral';
end

if handles.strategyList9.Value == 1
    handles.strategyName9.String = 'Aggressive';
elseif handles.strategyList9.Value == 2
    handles.strategyName9.String = 'Defensive';
elseif handles.strategyList9.Value == 3
    handles.strategyName9.String = 'Neutral';
end

if handles.strategyList10.Value == 1
    handles.strategyName10.String = 'Aggressive';
elseif handles.strategyList10.Value == 2
    handles.strategyName10.String = 'Defensive';
elseif handles.strategyList10.Value == 3
    handles.strategyName10.String = 'Neutral';
end

% show strategy name
set(handles.strategyName1,'visible','on')
set(handles.strategyName2,'visible','on')
set(handles.strategyName3,'visible','on')
set(handles.strategyName4,'visible','on')
set(handles.strategyName5,'visible','on')
set(handles.strategyName6,'visible','on')
set(handles.strategyName7,'visible','on')
set(handles.strategyName8,'visible','on')
set(handles.strategyName9,'visible','on')
set(handles.strategyName10,'visible','on')

set(handles.playerName1,'String', selectedPlayer1);
set(handles.playerName2,'String', selectedPlayer2);
set(handles.playerName3,'String', selectedPlayer3);
set(handles.playerName4,'String', selectedPlayer4);
set(handles.playerName5,'String', selectedPlayer5);
set(handles.playerName6,'String', selectedPlayer6);
set(handles.playerName7,'String', selectedPlayer7);
set(handles.playerName8,'String', selectedPlayer8);
set(handles.playerName9,'String', selectedPlayer9);
set(handles.playerName10,'String', selectedPlayer10);

% show names of players
set(handles.playerName1,'visible', 'on');
set(handles.playerName2,'visible', 'on');
set(handles.playerName3,'visible', 'on');
set(handles.playerName4,'visible', 'on');
set(handles.playerName5,'visible', 'on');
set(handles.playerName6,'visible', 'on');
set(handles.playerName7,'visible', 'on');
set(handles.playerName8,'visible', 'on');
set(handles.playerName9,'visible', 'on');
set(handles.playerName10,'visible', 'on');

% show player titles
set(handles.playerTitle1,'visible', 'on');
set(handles.playerTitle2,'visible', 'on');
set(handles.playerTitle3,'visible', 'on');
set(handles.playerTitle4,'visible', 'on');
set(handles.playerTitle5,'visible', 'on');
set(handles.playerTitle6,'visible', 'on');
set(handles.playerTitle7,'visible', 'on');
set(handles.playerTitle8,'visible', 'on');
set(handles.playerTitle9,'visible', 'on');
set(handles.playerTitle10,'visible', 'on');

team1Score= boxScore1(1,14)+boxScore1(2,14)+boxScore1(3,14)+boxScore1(4,14)+boxScore1(5,14);
team2Score= boxScore2(1,14)+boxScore2(2,14)+boxScore2(3,14)+boxScore2(4,14)+boxScore2(5,14);

if team1Score > team2Score
    handles.resultText.String = 'THE WINNER IS YOUR TEAM';
elseif team1Score < team2Score
    handles.resultText.String = 'THE WINNER IS YOUR OPPONENT';
end

handles.scoreText.String = ['THE SCORE: ', num2str(team1Score), '-', num2str(team2Score)];

% --- Executes on button press in replayButton.
function replayButton_Callback(hObject, eventdata, handles)
% hObject    handle to replayButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% hide player's names
set(handles.playerName1,'visible', 'off');
set(handles.playerName2,'visible', 'off');
set(handles.playerName3,'visible', 'off');
set(handles.playerName4,'visible', 'off');
set(handles.playerName5,'visible', 'off');
set(handles.playerName6,'visible', 'off');
set(handles.playerName7,'visible', 'off');
set(handles.playerName8,'visible', 'off');
set(handles.playerName9,'visible', 'off');
set(handles.playerName10,'visible', 'off');

% hide player titles
set(handles.playerTitle1,'visible', 'off');
set(handles.playerTitle2,'visible', 'off');
set(handles.playerTitle3,'visible', 'off');
set(handles.playerTitle4,'visible', 'off');
set(handles.playerTitle5,'visible', 'off');
set(handles.playerTitle6,'visible', 'off');
set(handles.playerTitle7,'visible', 'off');
set(handles.playerTitle8,'visible', 'off');
set(handles.playerTitle9,'visible', 'off');
set(handles.playerTitle10,'visible', 'off');

% hide strategy names
set(handles.strategyName1,'visible','off')
set(handles.strategyName2,'visible','off')
set(handles.strategyName3,'visible','off')
set(handles.strategyName4,'visible','off')
set(handles.strategyName5,'visible','off')
set(handles.strategyName6,'visible','off')
set(handles.strategyName7,'visible','off')
set(handles.strategyName8,'visible','off')
set(handles.strategyName9,'visible','off')
set(handles.strategyName10,'visible','off')

% reset box score
set(handles.resultText,'visible','off')
set(handles.scoreText,'visible','off')
set(handles.boxScore1,'visible','off')
set(handles.boxScore2,'visible','off')
set(handles.boxTitle1,'visible','off')
set(handles.boxTitle2,'visible','off')
set(handles.replayButton,'visible','off')

% reset component positions
handles.playerTitle.Position= [32.42857142857142 40.4 53.285714285714285 1.3999999999999986];

handles.userPlayer1.Position= [32.42857142857142 32.93333333333333 14.428571428571427 6.733333333333334];

handles.userPlayer2.Position= [49.71428571428571 32.93333333333333 14.428571428571427 6.733333333333334];

handles.userPlayer3.Position= [67 32.93333333333333 14.428571428571427 6.733333333333334];

handles.userPlayer4.Position= [84.28571428571428 32.93333333333333 14.428571428571427 6.733333333333334];

handles.userPlayer5.Position= [101.57142857142857 32.93333333333333 14.428571428571427 6.733333333333334];

handles.oppTitle.Position= [32.42857142857142 20.266666666666666 60.42857142857142 1.3999999999999986];

handles.oppPlayer1.Position= [32.42857142857142 12.933333333333334 14.428571428571427 6.733333333333334];

handles.oppPlayer2.Position= [49.71428571428571 12.933333333333334 14.428571428571427 6.733333333333334];

handles.oppPlayer3.Position= [67 12.933333333333334 14.428571428571427 6.733333333333334];

handles.oppPlayer4.Position= [84.28571428571428 12.933333333333334 14.428571428571427 6.733333333333334];

handles.oppPlayer5.Position= [101.57142857142857 12.933333333333334 14.428571428571427 6.733333333333334];

% reset user's players
handles.playerTitle.String='CHOOSE YOUR TEAM';
set(handles.playersList1,'visible','on')
set(handles.playersList2,'visible','on')
set(handles.playersList3,'visible','on')
set(handles.playersList4,'visible','on')
set(handles.playersList5,'visible','on')

handles.playersList1.Value= 1;
handles.playersList2.Value= 1;
handles.playersList3.Value= 1;
handles.playersList4.Value= 1;
handles.playersList5.Value= 1;

axes(handles.userPlayer1)
firstphoto=imread('NewPictures/Lebron James.jpg');
handles.userPlayers1= image(firstphoto);
axis off

axes(handles.userPlayer2)
firstphoto=imread('NewPictures/Lebron James.jpg');
handles.userPlayers2= image(firstphoto);
axis off

axes(handles.userPlayer3)
firstphoto=imread('NewPictures/Lebron James.jpg');
handles.userPlayers3= image(firstphoto);
axis off

axes(handles.userPlayer4)
firstphoto=imread('NewPictures/Lebron James.jpg');
handles.userPlayers4= image(firstphoto);
axis off

axes(handles.userPlayer5)
firstphoto=imread('NewPictures/Lebron James.jpg');
handles.userPlayer5= image(firstphoto);
axis off

set(handles.finalizeButton,'visible','on')

% reset opponent team
handles.oppTitle.String='CHOOSE YOUR OPPONENT';
set(handles.oppTitle,'visible','on')

set(handles.oppList1,'visible','on')
set(handles.oppList2,'visible','on')
set(handles.oppList3,'visible','on')
set(handles.oppList4,'visible','on')
set(handles.oppList5,'visible','on')

handles.oppList1.Value= 1;
handles.oppList2.Value= 1;
handles.oppList3.Value= 1;
handles.oppList4.Value= 1;
handles.oppList5.Value= 1;

axes(handles.oppPlayer1)
firstphoto=imread('NewPictures/Lebron James.jpg');
handles.userPlayers1= image(firstphoto);
axis off

axes(handles.oppPlayer2)
firstphoto=imread('NewPictures/Lebron James.jpg');
handles.userPlayers2= image(firstphoto);
axis off

axes(handles.oppPlayer3)
firstphoto=imread('NewPictures/Lebron James.jpg');
handles.userPlayers3= image(firstphoto);
axis off

axes(handles.oppPlayer4)
firstphoto=imread('NewPictures/Lebron James.jpg');
handles.userPlayers4= image(firstphoto);
axis off

axes(handles.oppPlayer5)
firstphoto=imread('NewPictures/Lebron James.jpg');
handles.userPlayer5= image(firstphoto);
axis off
% reset strategy lists
handles.strategyList1.Value= 1;
handles.strategyList2.Value= 1;
handles.strategyList3.Value= 1;
handles.strategyList4.Value= 1;
handles.strategyList5.Value= 1;
handles.strategyList6.Value= 1;
handles.strategyList7.Value= 1;
handles.strategyList8.Value= 1;
handles.strategyList9.Value= 1;
handles.strategyList10.Value= 1;


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
delete(hObject);
clear all
