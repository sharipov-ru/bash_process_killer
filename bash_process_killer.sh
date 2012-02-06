#!/bin/bash
port="3000"
echo Process Killer.
echo It helps to unload your non-responded rails/irb/ruby processes
echo Active ruby PIDs with used port:
lsof -wni | grep ruby
echo Type port to kill process:
read port
echo Search process on port $port...
var=`lsof -wni tcp:$port | grep -v PID | awk '{print $2}'`
if [ "$var" ]
then
  kill -9 $var
  echo "PID $var killed on port $port"
else
  echo "Process that uses $port port not found"
fi
lsof -n | grep ruby | grep DIR
echo Press enter to exit
read line
