param ($THEME = 'default')

$TEMP_DIR=".\tests\.tmp\visual"
$THEME_DIR="$TEMP_DIR\$THEME"
$SRC_DIR="$THEME_DIR\src"

mkdir -p "$THEME_DIR"
cp -r .\tests\visual\assets "$THEME_DIR\assets" -Force
cp -r .\tests\visual\src "$THEME_DIR\src" -Force

# replace theme reference
#find "$SRC_DIR" -name '*.html' -print0 | xargs -0 sed -i -E \
#    -e "s#/packages/default/dist/#/../../../packages/$THEME/dist/#"

Get-ChildItem -r -path "$SRC_DIR\**\*.html" | ForEach-Object -Process { (Get-Content $_).replace('/packages/default/dist/', "/../../../packages/$THEME/dist/") | Set-Content $_ }

# capture screenshots. see .pastshotsrc for config options
npm install --no-save pastshots@1.6 optipng

npx pastshots  --serve "$SRC_DIR/**/*.html"   --port 8889  --output "./tests/visual/output/$THEME"
