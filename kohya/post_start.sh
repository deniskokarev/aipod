#!/bin/bash
# executed by rupod's start.sh
# start Kohya GUI
source /kohya_ss/venv/bin/activate
exec /kohya_ss/gui.sh --listen 0.0.0.0 --server_port 7860 --inbrowser --share
