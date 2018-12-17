#!/usr/bin/env python2
import filterwheel as fw
import time
import cv2
import sys

def take_pic(c, f):
    f.set(0)
    for i in range(30): s, img0 = c.read()
    cv2.imwrite("img0.png", img0)

    f.set(1)
    for i in range(30): s, img1 = c.read()
    cv2.imwrite("img1.png", img1)

cam = cv2.VideoCapture(0)
filt = fw.FilterWheel(pin=18, pwmc=192, pwmr=2000, filter_pos=[66, 113])

take_pic(cam, filt)

filt.stop()
cam.release()
