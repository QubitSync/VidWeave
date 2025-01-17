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
    db: *sqlite.Db,
    query: []const u8,

    pub fn init(db: *sqlite.Db, query: []const u8) Self {
        return .{
            .db = db,
            .query = query,
        };
    }

    pub fn exec(self: *Self) !void {
        if (self.query.len == 0 or self.query[self.query.len - 1] != ';') {
            return QueryError.QueryMustEndWithSemicolon;
        }
        try self.db.exec(self.query);
    }

    pub fn fetch(self: *Self) ![]const []const u8 {
        return self.db.one(self.query);
    }
};
