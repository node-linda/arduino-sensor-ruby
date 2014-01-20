require 'rubygems'
require 'arduino_firmata'
require 'linda-socket.io-client'
$stdout.sync = true

ENV['LINDA_BASE']  ||= 'http://node-linda-base.herokuapp.com'
ENV['LINDA_SPACE'] ||= 'test'

arduino = ArduinoFirmata.connect ENV['ARDUINO']

linda = Linda::SocketIO::Client.connect ENV['LINDA_BASE']
ts = linda.tuplespace(ENV['LINDA_SPACE'])

linda.io.on :connect do
  puts "connect!! <#{linda.url}/#{ts.name}/tuple>"
end

linda.io.on :disconnect do
  puts "socket.io disconnect"
end

loop do
  light = arduino.analog_read 0
  puts "light : #{light}"
  ts.write type: "sensor", name: "light", value: light
  temp = arduino.analog_read(1).to_f*5*100/1024
  puts "temprature : #{temp}"
  ts.write type: "sensor", name: "temperature", value: temp
  sleep 1
end
