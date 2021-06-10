
# Zig Static Link Library

NOTE(lbayes): Since getting this running and making if fail by adding `linkLibC()`, I have not been
able to get it to _statically link_ this library under any circumstance.

I have also deleted the directory at ~/.config/zig (found with `zig env`) and other cache dirs with:

```bash
$ rm -rf zig-* dist ~/.cache/zig
```

## Steps to reproduce:

1) Build and run with:

```bash
$ zig build -Dtarget=x86_64-windows-gnu && wine64 dist/main.exe

info: All your codebase are belong to us.
soundio successfully created context
```
2) Move libsoundio.dll to the library search path, build and run.
```bash
$ cp hidden/libsoundio.dll vendor/libsoundio/ && \
    zig build -Dtarget=x86_64-windows-gnu && wine64 dist/main.exe

0009:err:module:import_dll Library libsoundio.dll (which is needed by L"Z:\\home\\[redacted]\\Projects\\learning\\zig\\static-lib\\dist\\main.exe") not found
0009:err:module:LdrInitializeThunk Importing dlls for L"Z:\\home\\[redacted]\\Projects\\learning\\zig\\static-lib\\dist\\main.exe" failed, status c00001
```
Move the dll out of the path and it works again.
```bash
rm vendor/libsoundio/libsoundio.dll && \
    zig build -Dtarget=x86_64-windows-gnu && wine64 dist/main.exe

info: All your codebase are belong to us.
soundio successfully created context
```
