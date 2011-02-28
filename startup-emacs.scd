// "Setup QT or Swing GUI, please!".warn;

////////////////SERVERS///////////////////////////
Server.default = Server.local;
s = Server.default;

s.options.memSize_(2**15);

Server.default.options.numOutputBusChannels = 2;
Server.default.options.numInputBusChannels = 2;

s.boot;
