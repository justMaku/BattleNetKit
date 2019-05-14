output_dir="Sources/BattleNetKit/Packets/Aurora"
find ./Protocol -name '*.proto' -print0 | xargs -0  \
  protoc --swift_out="${output_dir}"       \
         --swift_opt=Visibility=Public     \
         --proto_path=Protocol/