#!/usr/bin/env bash

tcpdump -i en0 -nnAX 'src host 172.16.1.11 and port 8888'

