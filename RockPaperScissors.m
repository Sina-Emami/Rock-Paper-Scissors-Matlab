function varargout = RockPaperScissors(varargin)
% RockPaperScissors MATLAB code for sinatest.fig
%      RockPaperScissors, by itself, creates a new RockPaperScissors or raises the existing
%      singleton*.
%
%      H = SINATEST returns the handle to a new RockPaperScissors or the handle to
%      the existing singleton*.
%
%      RockPaperScissors('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SINATEST.M with the given input arguments.
%
%      RockPaperScissors('Property','Value',...) creates a new RockPaperScissors or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before RockPaperScissors_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to sinatest_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help sinatest

% Last Modified by GUIDE v2.5 27-May-2021 20:12:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @RockPaperScissors_OpeningFcn, ...
                   'gui_OutputFcn',  @RockPaperScissors_OutputFcn, ...
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


% --- Executes just before sinatest is made visible.
function RockPaperScissors_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to sinatest (see VARARGIN)

% Choose default command line output for sinatest
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes sinatest wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = RockPaperScissors_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in rock.
function rock_Callback(hObject, eventdata, handles)
% hObject    handle to rock (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.player1, 'string' , 'ROCK')


% --- Executes on button press in paper.
function paper_Callback(hObject, eventdata, handles)
% hObject    handle to paper (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.player1, 'string' , 'PAPER')


% --- Executes on button press in scissors.
function scissors_Callback(hObject, eventdata, handles)
% hObject    handle to scissors (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.player1, 'string' , 'SCISSORS')


% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.player_score, 'string', '0')
set(handles.computer_score, 'string', '0')
set(handles.computer, 'string', 'COMPUTER')
set(handles.player1, 'string', 'PLAYER')
set(handles.text4, 'string', 'FIGHT')


% --- Executes on button press in pushbutton6.
function set_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
computer_move = randi([1,3]);
if computer_move == 1
    set(handles.computer, 'string' , 'ROCK')
elseif computer_move == 2
    set(handles.computer, 'string' , 'PAPER')
elseif computer_move == 3
    set(handles.computer, 'string' , 'SCISSORS')
end

ComputerScore = get(handles.computer_score, 'string');
PlayerScore = get(handles.player_score, 'string');
PlayerScore = str2num(PlayerScore);
ComputerScore = str2num(ComputerScore);

player_move = get(handles.player1, 'string');
if strcmp(player_move, 'ROCK')
    p_m = 1;
elseif strcmp(player_move, 'PAPER')
    p_m = 2;
else
    p_m = 3;
end
%% Rules for Rock Paper Scissors
% 1. Rock beats scissors

if strcmp(player_move, 'ROCK') && computer_move == 3
    set(handles.text4, 'string' , 'PLAYER WINS')
    PlayerScore = PlayerScore+1;
    set(handles.player_score, 'string' , num2str(PlayerScore))
elseif computer_move == 1 && strcmp(player_move, 'SCISSORS')
    set(handles.text4, 'string' , 'COMPUTRE WINS')
    ComputerScore = ComputerScore+1;
    set(handles.computer_score, 'string' , num2str(ComputerScore))
end

%% 2.Scissors beats paper

if strcmp(player_move, 'SCISSORS') && computer_move == 2
    set(handles.text4, 'string' , 'PLAYER WINS')
    PlayerScore = PlayerScore+1;
    set(handles.player_score, 'string' , num2str(PlayerScore))
elseif computer_move == 3 && strcmp(player_move, 'PAPER')
    set(handles.text4, 'string' , 'COMPUTRE WINS')
    ComputerScore = ComputerScore+1;
    set(handles.computer_score, 'string' , num2str(ComputerScore))
end

%% 3. Paper beats rock

if strcmp(player_move, 'PAPER') && computer_move == 1
    set(handles.text4, 'string' , 'PLAYER WINS')
    PlayerScore = PlayerScore+1;
    set(handles.player_score, 'string' , num2str(PlayerScore))
elseif computer_move == 2 && strcmp(player_move, 'ROCK')
    set(handles.text4, 'string' , 'COMPUTRE WINS')
    ComputerScore = ComputerScore+1;
    set(handles.computer_score, 'string' , num2str(ComputerScore))
end

%% Come Back to this  
%.4 if both players make the same move, there is no winner and the game is
%a draw

if p_m == computer_move
    set(handles.text4, 'string' , 'GAME IS A DRAW. FIGHT AGAIN...')
end
