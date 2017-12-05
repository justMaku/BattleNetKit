#!/bin/bash
protoc --swift_out=Sources/BattleNetKit/Packets/Aurora --proto_path=Proto/ Proto/*.proto 
