import wiringpi

class FilterWheel:
    def __init__(self, n, servo_pin=18):
        self.pin = servo_pin
        wiringpi.wiringPiSetupGpio()
        wiringpi.pinMode(self.pin, wiringpi.GPIO.PWM_OUTPUT)
        wiringpi.pwmSetMode(wiringpi.GPIO.PWM_MODE_MS)
        wiringpi.pwmSetClock(1920)
        wiringpi.pwmSetRange(200)

    def set(self, angle):
        d = angle
        print(d)
        wiringpi.pwmWrite(self.pin, d)

    def stop(self):
        wiringpi.pwmWrite(self.pin, 0)
        wiringpi.pinMode(self.pin, wiringpi.GPIO.OUTPUT)
