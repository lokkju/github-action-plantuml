#!/bin/sh

set -e
sh -c "/entrypoint.sh test/sequence.basic.puml -o .output/"
