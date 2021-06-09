
# Zig Static Link Library

## Steps to reproduce:

1) Build and run with:

```bash
zig build -Dtarget=x86_64-windows-gnu && wine64 main.exe
```
2) Output is:
```bash
info: All your codebase are belong to us.
soundio successfully created context
```
3) Move libsoundio.dll to the library search path, build and run.
```bash
mv libsoundio.dll vendor/libsoundio/
zig build -Dtarget=x86_64-windows-gnu && wine64 main.exe
```
Will output somethine like:
```bash
0009:err:module:import_dll Library libsoundio.dll (which is needed by L"Z:\\home\\[redacted]\\Projects\\learning\\zig\\static-lib\\dist\\main.exe") not found
0009:err:module:LdrInitializeThunk Importing dlls for L"Z:\\home\\[redacted]\\Projects\\learning\\zig\\static-lib\\dist\\main.exe" failed, status c00001
```
Move the dll out of the path and it works again.
```bash
mv vendor/libsoundio/libsoundio.dll ./
zig build -Dtarget=x86_64-windows-gnu && wine64 main.exe

info: All your codebase are belong to us.
soundio successfully created context
```
