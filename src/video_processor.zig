const std = @import("std");
const ffmpeg = @import("ffmpeg.zig");
const Allocator = std.mem.Allocator;

pub const VideoProcessor = struct {
    const Self = @This();

    allocator: Allocator,
    file_path: []const u8,

    pub fn init(allocator: Allocator, file_path: []const u8) Self {
        return .{
            .allocator = allocator,
            .file_path = file_path,
        };
    }

    pub fn adjust_video_quality(self: *Self) !void {}

    pub fn chunkify_video(self: *Self) !void {}

    pub fn process_video(self: *Self) !void {}

    pub fn video_handler(self: *Self) !void {}

    pub fn video_utility(self: *Self) !void {}
};
