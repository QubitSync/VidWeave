const std = @import("std");
const ArrayList = std.ArrayList;
const test_allocator = std.testing.allocator;

fn failingFunc() error{Oops}!void {
    return error.Oops;
}

pub fn main() !void {}

test "returning an error" {
    failingFunc() catch |err| {
        try std.testing.expect(err == error.Oops);
        std.debug.print("return from catched error: {}", .{err});
        return;
    };
}
