const std = @import("std");
const zap = @import("zap");
const Allocator = std.mem.Allocator;

pub fn on_request_verbose(r: zap.Request) void {
    if (r.path) |the_path| {
        std.debug.print("PATH: {s}\n", .{the_path});
    }

    if (r.query) |the_query| {
        std.debug.print("QUERY: {s}\n", .{the_query});
    }
    r.sendBody("<html><body><h1>Hello from ZAP!!!</h1></body></html>") catch return;
}

pub const SomePackage = struct {
    const Self = @This();

    allocator: Allocator,
    a: i8,
    b: i8,

    pub fn init(allocator: Allocator, a: i8, b: i8) Self {
        return .{
            .allocator = allocator,
            .a = a,
            .b = b,
        };
    }

    pub fn getA(self: *Self, req: zap.Request) void {
        std.log.warn("get_a_requested", .{});

        const string = std.fmt.allocPrint(
            self.allocator,
            "A value is {d}\n",
            .{self.a},
        ) catch return;
        defer self.allocator.free(string);

        req.sendBody(string) catch return;
    }

    pub fn getB(self: *Self, req: zap.Request) void {
        std.log.warn("get_b_requested", .{});

        const string = std.fmt.allocPrint(
            self.allocator,
            "B value is {d}\n",
            .{self.b},
        ) catch return;
        defer self.allocator.free(string);

        req.sendBody(string) catch return;
    }

    pub fn incrementA(self: *Self, req: zap.Request) void {
        std.log.warn("increment_a_requested", .{});

        self.a += 1;

        req.sendBody("incremented A") catch return;
    }
};

pub fn not_found(req: zap.Request) void {
    std.debug.print("not found handler", .{});

    req.sendBody("Not found") catch return;
}

pub fn favorite_icon(req: zap.Request) void {
    std.debug.print("favicon handler", .{});

    req.sendBody("favicon") catch return;
}
