#!/bin/bash

make && vsim -c -t 1ps testbench -do 'run -all'