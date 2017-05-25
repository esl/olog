%%%-------------------------------------------------------------------
%%% @author zsoci
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 11. Apr 2017 2:34 PM
%%%-------------------------------------------------------------------
-module(olog).
-author("zsoci").

-include("olog.hrl").
-include("olog_common.hrl").
%% API

-export([ start/0
        , start_link/0
        , stop/0]).

-export([ log/2
        , log/3
        , log/4
        ]).


%% start/0
%% ====================================================================
%% @doc starts the Common Service Interface service
%% @end
-spec start() -> Result when
  Result :: {ok, Pid} | ignore | {error, Error},
  Pid :: pid(),
  Error :: {already_started, Pid} | term().
start() -> csi:start(?SERVICE_NAME, ?SERVICE_MODULE).

%% start_link/0
%% ====================================================================
%% @doc starts the Common Service Interface service and make a link
%% @end
-spec start_link() -> Result when
  Result :: {ok, Pid} | ignore | {error, Error},
  Pid :: pid(),
  Error :: {already_started, Pid} | term().
start_link() -> csi:start_link(?SERVICE_NAME, ?SERVICE_MODULE).

%% stop/0
%% ====================================================================
%% @doc stops the Common Service Interface service
%% @end
-spec stop() -> Reply when
  Reply :: term().
stop() -> csi:stop(?SERVICE_NAME).

-spec log(Format :: string(), Owner :: atom()) ->
  ok.
log(Format, Owner) ->
  log(?INFO, Format, [], Owner).

-spec log(Level :: atom(), Format :: string(), Owner :: atom()) ->
  ok.
log(Level, Format, Owner) ->
  log(Level, Format, [], Owner).

-spec log(Level :: atom(), Format :: string(), Args :: string(),
          Owner :: atom()) ->
  ok.
log(Level, Format, Args, _Owner) ->
  case Level of
    info ->
      lager:info(Format, Args);
    warning ->
      lager:warning(Format, Args);
    error ->
      lager:error(Format, Args)
  end.
