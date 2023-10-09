import sounddevice as sd

if __name__=="__main__":
    print(sd.query_devices())
    sd.default.device = 2, 1
    print(sd.query_devices())
