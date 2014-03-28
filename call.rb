# Brandi Crawford
# Fun Times with BISC

#!/usr/bin/ruby -I/msf3/lib -Ilib/

require 'bisc'

#
# Create our BISC object, which will handle scanning for instruction
# sequences and managing scratch data space
#
# MUST ADD!!
#
bisc = BISC::Assembler.new(ARGV)

#
# A return-oriented program to call a Win32 API function 
#

# Define a "call" function to call functions
def call (function, *args)
	return[
	"POP ECX",function,
	"MOV EAX, [ECX]",
	"PUSH EAX", "NOP"
	].concat(args)
end

# Sleep
sleep = bisc.get_iat_pointer("KERNEL32.DLL", "Sleep")

Main = [
	# Call to Sleep
	#0x1388 is 5000 in hex
	call(sleep,0x1388),
]

print bisc.assemble(Main)
