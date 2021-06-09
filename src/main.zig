const std = @import("std");
const c = @cImport({
    @cInclude("soundio/soundio.h");
});

const print = std.debug.print;

pub fn main() anyerror!void {
    print("\n", .{});
    std.log.info("All your codebase are belong to us.", .{});

    const soundio = c.soundio_create();
    if (soundio == null) {
        print("soundio failed to allocate\n", .{});
        return error.Fail;
    }
    print("soundio successfully created context\n", .{});
}
