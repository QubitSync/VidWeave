const sqlite = @import("sqlite");

fn initDatabase() !sqlite.Db {
    return try sqlite.Db.init(.{
        .mode = sqlite.Db.Mode{ .File = "mydata.db" },
        .open_flags = .{
            .write = true,
            .create = true,
        },
        .threading_mode = .MultiThread,
    });
}
