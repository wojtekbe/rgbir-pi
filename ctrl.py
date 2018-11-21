#!/usr/bin/env python2
import filterwheel as fw
import time
import cv2
import sys

filt = fw.FilterWheel(2)

cam = cv2.VideoCapture(0)
s, img = cam.read()
cv2.imwrite("out.png", img)

while True:
    filt.set(10)
    time.sleep(1)
    filt.set(15)
    time.sleep(1)
    filt.set(20)
    time.sleep(1)
    filt.set(25)
    time.sleep(1)

filt.stop()
