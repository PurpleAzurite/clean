import os

const VERSION = "Clean v2.3.1"

proc listObjects(config: string): seq[string] =
  try:
    let file = open(config)
    defer: file.close()

    while not file.endOfFile():
      result.add(file.readLine())

  except:
    echo "Could not open config file: " & config
    quit(1)


proc showHelp() =
  echo "Usage: clean [options]"
  echo "\t-h, --help\tDisplay this message"
  echo "\t-v, --version\tDisplay program version information"
  echo "\t-l, --list\tSpecify a custom file listing filesystem entries to be removed"


proc main() =
  let args = os.commandLineParams()
  var configPath = getConfigDir() / "clean/files.list"

  for idx, arg in args:
    if arg == "-h" or arg == "--help":
      showHelp()
      return

    elif arg == "-v" or arg == "--version":
      echo VERSION
      return

    elif arg == "-l" or arg == "--list":
      try:
        configPath = args[idx + 1]
      except IndexDefect:
        echo "Please specify the path to the list file"
        quit(1)

    else:
      echo "Unknown argument: " & arg
      echo "Aborting"
      quit(1)


  let objects = listObjects(configPath)

  for obj in objects:
    let realPath = getHomeDir() / obj
    if os.dirExists(realPath):
      os.removeDir(realPath)
      echo "Removed dir: " & obj

    if os.fileExists(realPath):
      os.removeFile(realPath)
      echo "Removed file: " & obj


when isMainModule:
  main()
