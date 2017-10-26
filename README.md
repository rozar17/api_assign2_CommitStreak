# Getting Started on Ruby

Ruby is like Perl, Python & Smalltalk <br />
It is created by Yukihiro Matsumoto in Japan in 1995 <br />

It is not a compiled language like C++, Java or Visual Basic <br />

It is an object-oriented language <br />

It is easily readable code (like English) <br />

You do not use semicolons in coding <br />

It has lots of "syntatic sugar" - shortcuts <br />

It is not just for the Web. <br />
It is a multipurpose language <br />

# Ruby on rails
Unlike Ruby, Ruby on rails is for web developments. <br />
Ruby on rails is a web framework written in Ruby. <br />




# Installing Ruby for Windows

Go to http://www.ruby-lang.org <br />

Download Ruby Interpreter by clicking or download the one-click installer currently Ruby v.1.8.6 <br />

This download comes with a plain text editor called SciTE. <br />
You can use other text editor if you wish. <br />

You will also need a Command prompt <br />


# There are three ways to use Ruby
Single command <br />
Ruby file <br />
Interactive Ruby shell (IRB) <br />


# To know the version of your ruby, type in command prompt
```
$ ruby -e 'puts 123'
123
```

# Examples of using Ruby via the command prompt
```
$ ruby -e 'puts 123'
123
```

```
$ ruby -e 'print 123'
123
```

# To run a ruby file
```
create file name "simple_file.rb" with info

puts 123
# Print does not add a line return
print 456
puts 789
```



Run ruby file above in command prompt
```
$ ruby simple_file.rb
123
456789
```





# Using Ruby IRB
IRB allows us to interact with code in real time <br />
It works like a calculator and its great for testing code <br />


# Examples of using Ruby's IRB via the command prompt
```
C:\Users\rozar>irb
```


return value of puts is 'nil' eg. <br />
```
irb(main):006:0> puts 123
123
=> nil
irb(main):007:0> puts 1 + 1
2
=> nil
```





# Other examples of using Ruby's IRB via the command prompt
```
irb(main):001:0> 1+1
=> 2
irb(main):002:0> 4+5
=> 9
irb(main):003:0> 3*50
=> 150
irb(main):004:0> 45 / 9
=> 5
irb(main):005:0> 100 - 10
=> 90
irb(main):008:0> 1 + 1
=> 2
```


# Example of Ruby coding:
```
irb(main):009:0> "Hello".reverse
=> "olleH"
```

Note: "Hello" is an object <br />

# to get out of ruby
irb(main):009:0>quit


# Another way of writing ruby
```
C:\Users\rozar>irb --simple-prompt
>> 1 + 1
=> 2
>> quit
```


# For more documentation
Go to https://ruby-doc.org/core-2.4.2/ <br />

or on command line <br />

C:\Users\rozar>ri upcase <br />
C:\Users\rozar>ri String#upcase <br />
C:\Users\rozar>ri Object#inspect <br />


Other useful info: https://github.com/rozar17/api_assign2_CommitStreak/wiki






