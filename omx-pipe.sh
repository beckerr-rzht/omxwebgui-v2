#!/bin/bash
# pipe commands to fifo file

screen -S OMX -X stuff "$2"
