#!/usr/bin/env python2
import filterwheel as fw
import time
import cv2

filt = fw.FilterWheel(2)
filt.set(0)

cam = cv2.VideoCapture(0)
s, img = cam.read()
cv2.imwrite("out.png", img)

time.sleep(1)
filt.stop()
