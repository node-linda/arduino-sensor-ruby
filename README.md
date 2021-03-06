arduino-sensor-ruby
===================
Share Arduino's sensor values with [linda-socket.io](https://github.com/node-linda/linda-socket.io)

- write {type: "sensor", name: "light", value: value}
- write {type: "sensor", name: "temperature", value: value}
- https://github.com/node-linda/arduino-sensor-ruby


## Install Dependencies

    % gem install bundler foreman
    % bundle install


## Setup Arduino

Install Arduino Firmata v2.2

    Arduino IDE -> [File] -> [Examples] -> [Firmata] -> [StandardFirmata]

sensors
- light
  - analog input 0
  - CdS and 330Ω
- temperature
  - analog input 1
  - [LM35DZ](http://akizukidenshi.com/catalog/g/gi-00116/)

![arduino schema](http://farm6.staticflickr.com/5443/8952129460_3ed3003697_z.jpg)


## Run

    % foreman start

=> http://node-linda-base.herokuapp.com/test?type=sensor


## Run with your [linda-base](https://github.com/node-linda/node-linda-base)

    % export LINDA_BASE=http://node-linda-base.herokuapp.com
    % export LINDA_SPACE=test
    % foreman start


## Install as Service

    % gem install foreman

for launchd (Mac OSX)

    % sudo foreman export launchd /Library/LaunchDaemons/ --app ruby-linda-arduino-sensor -u `whoami`
    % sudo launchctl load -w /Library/LaunchDaemons/ruby-linda-arduino-sensor-main-1.plist


for upstart (Ubuntu)

    % sudo foreman export upstart /etc/init/ --app ruby-linda-arduino-sensor -d `pwd` -u `whoami`
    % sudo service ruby-linda-arduino-sensor start
