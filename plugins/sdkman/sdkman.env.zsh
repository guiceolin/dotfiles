export SDKMAN_DIR="${HOME}/.sdkman"
[[ -d "$SDKMAN_DIR/candidates/java/current/bin" ]]   && path=("$SDKMAN_DIR/candidates/java/current/bin"   $path)
[[ -d "$SDKMAN_DIR/candidates/kotlin/current/bin" ]]  && path=("$SDKMAN_DIR/candidates/kotlin/current/bin"  $path)
[[ -d "$SDKMAN_DIR/candidates/gradle/current/bin" ]]  && path=("$SDKMAN_DIR/candidates/gradle/current/bin"  $path)
[[ -d "$SDKMAN_DIR/candidates/maven/current/bin" ]]   && path=("$SDKMAN_DIR/candidates/maven/current/bin"   $path)
