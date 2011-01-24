require 'rubygems'
require 'wirble'

IRB.conf[:AUTO_INDENT] = (IRB.conf[:USE_READLINE] = true)
(IRB.conf[:LOAD_MODULES] ||=[]) | ['irb/completion']
Wirble.init
Wirble.colorize
