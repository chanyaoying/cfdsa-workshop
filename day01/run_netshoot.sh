#!/bin/bash

docker run -ti --rm \
  --network my-net \
  nicolaka/netshoot /bin/bash