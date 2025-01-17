const std = @import("std");
const zap = @import("zap");
const Allocator = std.mem.Allocator;

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

// TODO: Implement Other Error pages

pub fn not_found(r: zap.Request) void {
    r.sendJson("{\"status\": 404, \"message\": \"Not Found\"}") catch return;
}

// NOTE: Home Page

pub fn home(r: zap.Request) void {
    const response = "<html><head><title>Welcome</title><style>body {display: flex;justify-content: center;align-items: center;height: 100vh;margin: 0;}h1 {font-family: Arial, sans-serif;}</style></head><body><h1>Hello from ZAP!!!</h1></body></html>";
    r.sendBody(response) catch return;
}
