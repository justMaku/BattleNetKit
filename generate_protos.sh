output_dir="Sources/BattleNetKit/Packets/Aurora"

rm -rf "${output_dir}"
mkdir "${output_dir}"

find ./Protocol -name '*.proto' -print0 | xargs -0  \
  protoc --swift_out=FileNaming=PathToUnderscores:"${output_dir}"       \
         --swift_opt=Visibility=Public     \
         --proto_path=Protocol/