# olcPixelGameEngine template project with Makefile

A template project with compiling tooling for Linux.
Default compiler is `clang++`, feel free to change it.

### Make procedures
- `$ make clean` - Removes all build files
- `$ make all` - Creates debug and release builds
- `$ make debug` - Creates a debug build with `-DDEBUG` and `-g` flags
- `$ make release` - Creates a release build with `-O2` optimization flag
- `$ make build` - Creates the build directory

Example use: `$ make build clean all`