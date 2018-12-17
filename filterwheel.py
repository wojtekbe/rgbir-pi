import wiringpi
import time

class FilterWheel:
    def __init__(self, filter_pos, pin=18, pwmc=192, pwmr=2000):
        self.pin = pin
        wiringpi.wiringPiSetupGpio()
        wiringpi.pinMode(self.pin, wiringpi.GPIO.PWM_OUTPUT)
        wiringpi.pwmSetMode(wiringpi.GPIO.PWM_MODE_MS)
        wiringpi.pwmSetClock(pwmc)
        wiringpi.pwmSetRange(pwmr)
        self.N = len(filter_pos)
        self.filter_pos = filter_pos
        self.pos = 0
        wiringpi.pwmWrite(self.pin, self.pos)

    def set(self, n):
        if n>(self.N-1) or n<0:
            print("Filter index out of range")
            return None
        d = self.filter_pos[n]
        print(d)
        wiringpi.pwmWrite(self.pin, d)
        time.sleep(1)

    def stop(self):
        wiringpi.pwmWrite(self.pin, 0)
