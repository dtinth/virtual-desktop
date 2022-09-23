#!/bin/bash
Xtigervnc -desktop "$VNC_DESKTOP_NAME" -geometry "$VNC_GEOMETRY" -listen tcp -ac -SecurityTypes None -AlwaysShared -AcceptKeyEvents -AcceptPointerEvents -SendCutText -AcceptCutText :0