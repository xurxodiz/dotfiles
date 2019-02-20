-module(user_default).
-export([dbg/0, dbg/1]).

dbg() ->
    dbg:tracer(),
    dbg:p(all, c).

dbg(Node) ->
    dbg:tracer(),
    dbg:n(Node),
    dbg:p(all, c).