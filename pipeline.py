import time


class Run:
    def __init__(self):
        pass

    def run_pipeline(self):
        for i in range(0, 10):
            print(i)
            time.sleep(3)


if __name__ == '__main__':
    run = Run()
    run.run_pipeline()
