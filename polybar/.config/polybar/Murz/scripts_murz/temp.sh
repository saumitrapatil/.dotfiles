#!/bin/bash

sensors | grep 'Package' | awk '{print $4}'
