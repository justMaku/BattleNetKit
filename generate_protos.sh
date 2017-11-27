#!/bin/bash
protoc --swift_out=Sources/BattleNetKit/Models --proto_path=Proto/ Proto/*.proto 
