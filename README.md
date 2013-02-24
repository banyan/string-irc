# string-irc - Add color codes for mIRC compatible client.
[![Build Status](https://secure.travis-ci.org/banyan/string-irc.png)](http://travis-ci.org/banyan/string-irc)

## Description

Port of http://search.cpan.org/~hirose/String-IRC-0.04/ from Perl to Ruby.

## Compatibility

* Ruby 2.0.0
* Ruby 1.9.3
* Ruby 1.8.7

## Getting Started

```
$ gem install string-irc
```

```ruby
require 'string-irc'

si1 = StringIrc.new('hello')
si1.red.underline.to_s
si2 = StringIrc.new('world').yellow('green').bold.to_s
message = "#{si1} #{si2}"
p message # => "\u001F\u000304hello\u000F \u0002\u000308,03world\u000F"
```

### Caveats

* To strigfy StringIrc instance, you have to add #to_s method. This API is diffrence from original one.

### Try with IRC

* There is example code in `example` directory, try with IRC how looks it.

## Usage

```
string_irc_instance.COLOR([BG_COLOR])
```

* Color scheme

<table>
  <tr>
    <th>foreground, and background</th>
  </tr>
  <tr>
    <td>white</td>
  </tr>
  <tr>
    <td>black</td>
  </tr>
  <tr>
    <td>blue, navy</td>
  </tr>
  <tr>
    <td>green</td>
  </tr>
  <tr>
    <td>red</td>
  </tr>
  <tr>
    <td>brown, maroon</td>
  </tr>
  <tr>
    <td>purple</td>
  </tr>
  <tr>
    <td>orange, olive</td>
  </tr>
  <tr>
    <td>yellow</td>
  </tr>
  <tr>
    <td>light_green, lime</td>
  </tr>
  <tr>
    <td>teal, a_green, blue_cyan</td>
  </tr>
  <tr>
    <td>light_cyan, cyan, aqua</td>
  </tr>
  <tr>
    <td>light_blue, royal</td>
  </tr>
  <tr>
    <td>pink, light_purple, fuchsia</td>
  </tr>
  <tr>
    <td>grey</td>
  </tr>
  <tr>
    <td>light_grey, silver</td>
  </tr>
</table>

* Decorate method

```
#bold
#underline
#inverse
```

* Original color scheme (currently it's only available as foreground color)

<table>
  <tr>
    <th>foreground only</th>
  </tr>
  <tr>
    <td>rainbow</td>
  </tr>
  <tr>
    <td>seven_eleven</td>
  </tr>
</table>

## Copyright

Copyright (c) 2012 Kohei Hasegawa. See LICENSE for [details](http://banyan.mit-license.org/).
