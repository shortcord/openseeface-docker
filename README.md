# OpenSeeFace Docker

Docker container for [OpenSeeFace](https://github.com/emilianavt/OpenSeeFace).  

You still need to have VSeeFace open on another computer to send the tracking data to, this does not run VSeeFace directly, just the tracking part.  

You can use either a local instance of VSeeFace (via Wine) or a proper Windows Machine/VM.

---

### Running the container

Docker isolates the container from the host system, so chances are your webcam is not accessible from within the container, to fix this you need to find out which `/dev/videoX` is your webcam.  

Normally its `/dev/video0` but its best to check with `mpv` or `vlc` before hand.  

You need to pass a few arguments to the container on start, normally just the IP address and port of the computer running VSeeFace, for simplicity sake, we are assuming the IP address and Port are stored within `$targetIP` and `$targetPort`.  

Run the container like so `docker run --rm --device=/dev/video0 --cpuset-cpus=0 shortcord/openseeface --capture 0 --width 1280 --height 720 --ip $targetIP --port $targetPort --slient 0 --max-threads 1` 

What the above command is doing is starting the container and passing `/dev/video0`, pinning it to CPU Core #0, and removing said container after close.  

Please read up on the [docker run](https://docs.docker.com/engine/reference/run/) argument if you would like more info on the above command.  

For VSeeFace to actually use the data from OpenSeeFace, you need to pick "OpenSeeFace Tracking" as your webcam and set the Listen IP to `0.0.0.0` and port to your choosing (the default of `11573` is fine).

---

For other arguments that are applicable, run the container with `--help`.  .  

These arguments are also settable via environment variables within the container, you can set them via Docker Compose or by building your own container from this one.   

This container is built with all upstream defaults, it assumes nothing.  