const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const exe_mod = b.createModule(.{
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
    });

    const exe = b.addExecutable(.{
        .name = "VidWeave",
        .root_module = exe_mod,
    });

    exe.linkSystemLibrary("c");
    exe.linkSystemLibrary("zlib");
    exe.linkSystemLibrary("avcodec");
    exe.linkSystemLibrary("avformat");
    exe.linkSystemLibrary("avutil");
    exe.linkSystemLibrary("avdevice");
    exe.linkSystemLibrary("avfilter");
    exe.linkSystemLibrary("swscale");
    exe.linkSystemLibrary("drm"); //TODO: investigate more on this
    exe.linkLibC();

    b.installArtifact(exe);

    const run_cmd = b.addRunArtifact(exe);
    run_cmd.step.dependOn(b.getInstallStep());

    if (b.args) |args| {
        run_cmd.addArgs(args);
    }

    const run_step = b.step("run", "Run the app");
    run_step.dependOn(&run_cmd.step);

    const exe_unit_tests = b.addTest(.{
        .root_module = exe_mod,
    });

    exe_unit_tests.linkSystemLibrary("c");
    exe_unit_tests.linkSystemLibrary("zlib");
    exe_unit_tests.linkSystemLibrary("avcodec");
    exe_unit_tests.linkSystemLibrary("avformat");
    exe_unit_tests.linkSystemLibrary("avutil");
    exe_unit_tests.linkSystemLibrary("avdevice");
    exe_unit_tests.linkSystemLibrary("avfilter");
    exe_unit_tests.linkSystemLibrary("swscale");
    exe_unit_tests.linkSystemLibrary("drm");
    exe_unit_tests.linkLibC();

    const run_exe_unit_tests = b.addRunArtifact(exe_unit_tests);

    const test_step = b.step("test", "Run unit tests");
    test_step.dependOn(&run_exe_unit_tests.step);
}
