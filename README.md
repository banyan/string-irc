# string-irc - Add color codes for mIRC compatible client.

[![Build Status](https://secure.travis-ci.org/banyan/string-irc.png)](http://travis-ci.org/banyan/string-irc)

Description
---

Port of http://search.cpan.org/~hirose/String-IRC-0.04/ from Perl to Ruby.

Compatibility
---

Tested under Ruby 1.9.2 and Ruby 1.8.7.

See current status at [Travis CI](http://travis-ci.org/banyan/string-irc).

Usage
---

    require 'string-irc'

    si1 = StringIrc.new('hello')
    si1.red.underline
    si2 = StringIrc.new('world').yellow('green').bold
    msg = "#{si1.to_s} #{si2.to_s}" # You must add #to_s, this is the diffrence from original.

    si.COLOR([BG_COLOR]);

    Add color code and return StringIRC object. BG_COLOR is
    optional. Available COLOR and BC_COLOR are as follows.

    white
    black
    blue navy
    green
    red
    brown maroon
    purple
    orange olive
    yellow
    light_green lime
    teal a_green blue_cyan
    light_cyan cyan aqua
    light_blue royal
    pink light_purple fuchsia
    grey
    light_grey silver

    #bold, #underline, #inverse are available method.

    si.bold
    si.underline
    si.inverse

Copyright
---

MIT License
