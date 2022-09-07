FROM python:3.10-slim
RUN pip install onnxruntime opencv-python pillow numpy
RUN apt update -y && \
    apt install -y libgl1-mesa-glx libglib2.0-0 && \
    apt clean

WORKDIR /app
COPY ./OpenSeeFace/ /app

ENTRYPOINT [ "/usr/local/bin/python", "facetracker.py" ]