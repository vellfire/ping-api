from fastapi import FastAPI
import subprocess

app = FastAPI()

host = "172.16.110.2"

@app.get("/status")
def ping():
    command = ['ping', '-c', '1', '-W', '1', host]
    result = subprocess.run(command, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
    return{"online": result.returncode == 0}
