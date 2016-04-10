#!/usr/bin/env python 


import sys


for line in sys.stdin:
    line = line.strip()
    unpacked = line.split(",")
   stadium, capacity, expanded, location, surface, turf, team, opened, weather, roof, elevation = line.split(",")
    #medallion, hack_license, vendor_id, rate_code, store_and_fwd_flag, pickup_datetime, dropoff_datetime, passenger_count, trip_time_in_secs, trip_distance, pickup_longitude, pickup_latitude, dropoff_longitude, dropoff_latitude = line.split(",")

    results = [turf, "1"]
    print("\t".join(results))
