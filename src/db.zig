const mem = @import("std").mem;
const sqlite = @import("sqlite");

pub fn initDatabase() !sqlite.Db {
    return try sqlite.Db.init(.{
        .mode = sqlite.Db.Mode{ .File = "mydata.db" },
        .open_flags = .{
            .write = true,
            .create = true,
        },
        .threading_mode = .MultiThread,
    });
}

const QueryError = error{
    QueryMustEndWithSemicolon,
};

pub const Database = struct {
    const Self = @This();
    allocator: mem.Allocator,
    db: *sqlite.Db,
    query: []const u8,

    pub fn init(allocator: mem.Allocator, db: *sqlite.Db, query: []const u8) Self {
        return .{
            .allocator = allocator,
            .db = db,
            .query = query,
        };
    }

    /// Executes the query stored in the `query` field.
    pub fn exec(self: *Self) !void {
        if (self.query.len == 0 or self.query[self.query.len - 1] != ';') {
            return QueryError.QueryMustEndWithSemicolon;
        }
        return try self.db.exec(self.query);
    }

    /// Fetches a single row from the database using the query stored in the `query` field.
    pub fn fetch(self: *Self) ![]const []const u8 {
        return try self.db.one(self.query);
    }

    /// Fetches a single row from the database and allocates memory for the result.
    pub fn oneAlloc(self: *Self) ![]const []const []const u8 {
        return try self.db.oneAlloc([]const []const []const u8, self.allocator, self.query);
    }
};
