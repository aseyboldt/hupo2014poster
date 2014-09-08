from mqrun import mqclient
import json

with open('paramfile.json') as f:
    params = json.load(f)

path_data = {
    "raw_file1": "/path/to/raw/file",
    "raw_file2": "/path/to/raw/file2",
}

maxquant = mqclient.mqrun(params, path_data, share='/mnt/win_share_requests')

maxquant.wait()
try:
    outfiles = maxquant.result()
except TimeoutError:
    print("Connection lost or server overloaded")
except Exception as e:
    print("Error executing MaxQuant: " + str(e))
else:
    print(outfiles)
