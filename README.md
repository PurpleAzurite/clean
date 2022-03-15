# Clean
Clean is a small command-line utility to tidy the user's home directory. It has currently only been tested on Linux. It works by reading a simple list of files and deleting their corresponding inodes from $HOME.

## Dependencies
- The nim compiler

## Building
    ```shell
       git clone https://github.com/PurpleAzurite/clean.git && cd clean
       make
       sudo make install
    ```
