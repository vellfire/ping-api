from fastapi import FastAPI
import subprocess
from os import environ

app = FastAPI()

endpoint = environ['ENDPOINT']

@app.get("/status")
def ping():
    command = ['ping', '-c', '1', '-W', '1', endpoint]
    result = subprocess.run(command, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
    return{"online": result.returncode == 0}
