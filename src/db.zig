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

pub fn runQuery(db: *sqlite.Db, query: []const u8) !QueryError {
    if (query.len == 0 or query[query.len - 1] != ';') {
        return QueryError.QueryMustEndWithSemicolon;
    }
    return try db.exec(query);
}
