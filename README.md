ruby-linda-arduino-sensor
=========================
Share Arduino's sensor values with [linda-socket.io](https://github.com/node-linda/linda-socket.io)

- write {type: "sensor", name: "light", value: value}
- write {type: "sensor", name: "temperature", value: value}
- https://github.com/node-linda/ruby-linda-arduino-sensor


## Install Dependencies

    % gem install bundler
    % bundle install


## Run

    % foreman start

=> http://node-linda-base.herokuapp.com/test/tuple?type=sensor


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
