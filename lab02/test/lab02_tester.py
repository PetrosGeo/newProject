#!/usr/bin/env python3.4
import os.path
from mipsTester import runTests

if os.path.isfile("/usr/home/grads/courses/myy402/bin/MarsMYY402_4_5.jar"):
  # This is the path to MarsMYY402_4_5.jar for the lab machines.
  marsJar = "/usr/home/grads/courses/myy402/bin/MarsMYY402_4_5.jar"
else:
  ##########################################
  # This is my set-up for my machine,
  # MODIFY FOR YOUR PERSONAL COMPUTER SETUP!
  #  USING THE FULL PATH TO MarsMYY402_4_5.jar IN YOUR COMPUTER
  ##########################################
  marsJar = "/home/efthym/t/ca_course/MarsMYY402_4_5.jar"

tests = [ \
 ("Empty string",\
  [('^string:.*$', 'string: .asciiz ""')],\
  {'v1' : 'string'},\
  {}\
 ), \
 ("Multiple spaces",\
  [('^string:.*$', 'string: .asciiz "  a    abc  "')],\
  {'v1' : 'string+7'},\
  {} \
 ), \
 ("Longest at the end",\
  [('^string:.*$', 'string: .asciiz "a longest"')],\
  {'v1' : 'string+2'},\
  {} \
 ), \
 ("Longest at the start",\
  [('^string:.*$', 'string: .asciiz "longest tiny"')],\
  {'v1' : 'string+0'},\
  {} \
 ), \
 ("Equal lengths",\
  [('^string:.*$', 'string: .asciiz "samesize small samesize small "')],\
  {'v1' : 'string+15'},\
  {} \
 ) \
]

# Change verbose below to True, if you get errors to get more detailed information
print (runTests("../lab02.asm", tests, marsJar, verbose=True))

