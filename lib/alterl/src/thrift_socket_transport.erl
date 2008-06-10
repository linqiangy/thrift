-module(thrift_socket_transport).

-behaviour(thrift_transport).

-export([new/1,
         
         write/2, read/2]).

-record(data, {socket}).

new(Socket) ->
    thrift_transport:new(?MODULE, #data{socket = Socket}).

write(#data{socket = Socket}, Data) when is_binary(Data) ->
    gen_tcp:send(Socket, Data).

read(#data{socket = Socket}, Len) when is_integer(Len), Len >= 0 ->
    gen_tcp:recv(Socket, Len).
