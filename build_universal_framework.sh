BUILD=build
FRAMEWORK=ObjectiveRocks
FRAMEWORK_PATH=$FRAMEWORK.framework
ARCHIVE_PATH=$BUILD/iOS/Archive
SIM_PATH=$BUILD/iOS/Simulator
UNIVERSAL_iOS_PATH=$BUILD/iOS/Universal
MACOS_PATH=$BUILD/macOS
ZIP_DIR=$BUILD/zip

echo "### Cleaning up after old attempts"
rm -Rf $BUILD/$UNIVERSAL_iOS_PATH
rm -rf $ZIP_DIR

# iOS universal
echo "### Copying framework files"
cp -RL $ARCHIVE_PATH/ $UNIVERSAL_iOS_PATH
cp -RL $SIM_PATH/$FRAMEWORK_PATH/Modules/$FRAMEWORK.swiftmodule/* $UNIVERSAL_iOS_PATH/$FRAMEWORK_PATH/Modules/$FRAMEWORK.swiftmodule
echo "### lipo'ing the frameworks together into universal framework"
lipo -create $ARCHIVE_PATH/$FRAMEWORK_PATH/$FRAMEWORK $SIM_PATH/$FRAMEWORK_PATH/$FRAMEWORK -output $UNIVERSAL_iOS_PATH/$FRAMEWORK_PATH/$FRAMEWORK
echo "### lipo'ing the dSYMs together"
DSYM_PATH=$FRAMEWORK.framework.dSYM/Contents/Resources/DWARF/$FRAMEWORK
lipo -create $ARCHIVE_PATH/$DSYM_PATH $SIM_PATH/$DSYM_PATH  -output $UNIVERSAL_iOS_PATH/$DSYM_PATH

# Rename and zip
mkdir -p $ZIP_DIR
cp -RL LICENSE $ZIP_DIR
mkdir $ZIP_DIR/iOS
mkdir $ZIP_DIR/macOS
cp -RL $UNIVERSAL_iOS_PATH/$FRAMEWORK_PATH $ZIP_DIR/iOS/ObjectiveRocks.framework
cp -RL $UNIVERSAL_iOS_PATH/ObjectiveRocks.framework.dSYM $ZIP_DIR/iOS/ObjectiveRocks.framework.dSYM 
cp -RL $MACOS_PATH/$FRAMEWORK_PATH $ZIP_DIR/macOS/ObjectiveRocks.framework
cp -RL $MACOS_PATH/ObjectiveRocks.framework.dSYM $ZIP_DIR/macOS/ObjectiveRocks.framework.dSYM
cd $ZIP_DIR
zip -r ObjectiveRocks.zip LICENSE iOS/ObjectiveRocks.framework iOS/ObjectiveRocks.framework.dSYM macOS/ObjectiveRocks.framework macOS/ObjectiveRocks.framework.dSYM
echo "### Zipped resulting frameworks and dSYMs to $ZIP_DIR/ObjectiveRocks.zip"