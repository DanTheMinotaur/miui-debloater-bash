#!/bin/bash

app_exists() {
    local package=$1
    adb shell pm list packages | grep -q "^package:$package$"
    return $?
}

remove_app() {
    local package=$1
    adb uninstall $package
}

disable_app() {
    local package=$1
    adb shell pm disable-user --user 0 $package
}

remove_disable_app() {
    local package=$1
    

    if app_exists $package; then
        if remove_app $package; then
            echo "App $package removed sccessfully."
            return
        fi

        echo "Failed to remove app $package. Attempting to disable..."

        if disable_app $package; then
            echo "App $package disabled successfully."
            return
        fi

        echo "Failed to disable app $package."
        return
    fi

    echo "App $package is not installed on the device."
}

APPS_FILE=${1:-apps.yml}

main() {
  if [ ! -f $APPS_FILE ]; then
      echo "$APPS_FILE file not found."
      exit 1
  fi

  # Had to load data into array from while, was causing strange effects with script exiting
  local to_delete=()

  while IFS=':' read -r package_name name; do
      local package_name=$(echo $package_name | tr -d '[:space:]')
      if [ "${package_name:0:1}" = "#" ]; then
        continue
      fi
      to_delete+=($package_name)
  done < $APPS_FILE

  for p in "${to_delete[@]}"
  do
    remove_disable_app "$p"
  done
}

main
