const std = @import("std");
const zap = @import("zap");
const Allocator = std.mem.Allocator;

pub const SomePackage = struct {
    const Self = @This();

    allocator: Allocator,
    a: i16,

    pub fn init(allocator: Allocator, a: i8) Self {
        return .{
            .allocator = allocator,
            .a = a,
        };
    }

    pub fn get(self: *Self, req: zap.Request) void {
        const string = std.fmt.allocPrint(
            self.allocator,
            "{d}",
            .{self.a},
        ) catch return;
        defer self.allocator.free(string);

        req.sendJson(string) catch return;
    }

    pub fn decrement(self: *Self, req: zap.Request) void {
        self.a -= 1;
        req.sendJson(std.fmt.allocPrint(self.allocator, "{d}", .{self.a}) catch return) catch return;
    }

    pub fn increment(self: *Self, req: zap.Request) void {
        self.a += 1;
        req.sendJson(std.fmt.allocPrint(self.allocator, "{d}", .{self.a}) catch return) catch return;
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
