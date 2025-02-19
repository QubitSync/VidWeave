const std = @import("std");
const zap = @import("zap");
const api = @import("api.zig");

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{
        .thread_safe = true,
    }){};
    const allocator = gpa.allocator();

    var simpleRouter = zap.Router.init(allocator, .{
        .not_found = api.not_found,
    });
    defer simpleRouter.deinit();

    var somePackage = api.SomePackage.init(allocator, 1);

    try simpleRouter.handle_func("/get", &somePackage, &api.SomePackage.get);

    try simpleRouter.handle_func("/dec", &somePackage, &api.SomePackage.decrement);

    try simpleRouter.handle_func("/inc", &somePackage, &api.SomePackage.increment);

    var listener = zap.HttpListener.init(.{
        .port = 3000,
        .on_request = simpleRouter.on_request_handler(),
        .log = true,
        .max_clients = 100000,
    });
    try listener.listen();
    std.debug.print("Listening on 0.0.0.0:3000\n", .{});
    zap.start(.{
        .threads = 2,
        // Must be 1 if state is shared
        .workers = 1,
    });
}
