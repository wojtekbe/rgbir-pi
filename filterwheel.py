import RPi.GPIO as GPIO

class FilterWheel:
    def __init__(self, n, servo_port=18, servo_freq=50):
        GPIO.setmode(GPIO.BCM)
        GPIO.setup(servo_port, GPIO.OUT)
        self.pwm = GPIO.PWM(servo_port, 60)
        self.pwm.start(0)

    def set(self, angle):
        d = angle / 18.0 + 2.5
        print(d)
        self.pwm.ChangeDutyCycle(d)

    def stop(self):
        self.pwm.stop()
        GPIO.cleanup()
