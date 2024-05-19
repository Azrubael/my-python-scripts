#!/bin/bash

# Calling Python from Bash

auxTP='
from sys import argv
from math import ceil, log
import math
def aux(content, evap_per_day, threshold):
  evap_per_day = float(evap_per_day); threshold = float(threshold)
  return int(ceil(log(threshold / 100.0) / log(1.0 - evap_per_day / 100.0)))
a=aux(argv[1:][0], argv[1:][1], argv[1:][2])
print(a)
'
evaporator () {
    python3 -c "$auxTP" "$1" "$2" "$3"
}
evaporator "$1" "$2" "$3"