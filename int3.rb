# Brandi Crawford
# Fun Times with BISC

#!/usr/bin/ruby -I/msf3/lib -Ilib

require 'bisc'

#
# Create our BISC object, which will handle scanning for instruction
# sequences and managing scratch data space
#
bisc = BISC::Assembler.new(ARGV)

#
# Build and test a simple return-oriented program that
# executes an "INT3"
#
Main = [
	"INT3"
]

print bisc.assemble(Main)
