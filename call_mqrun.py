from mqrun import mqclient
import yaml

with open('paramfile.yaml') as f:
    params = yaml.load(f)

path_data = {
    "inputfile1": "/path/to/raw/file",
    "inputfile2": "/path/to/raw/file2",
}

for threads in [4, 6, 8, 10]:
    params['globalParams']['numThreads'] = threads
    maxquant = mqclient.mqrun(
        params, path_data, image='path/to/image',
        outdir='mqoutput_%s' % threads
    )
    # wait and throw an exception if MaxQuant failed
    maxquant.result()
