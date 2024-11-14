const rl = @import("raylib");
const std = @import("std");
const rand = std.crypto.random;
const print = std.debug.print;

const screenWidth = 1000;
const screenHeight = 1000;
const circleRadius = 1;

const p1 = rl.Vector2{ .x = 100, .y = 100 };
const p2 = rl.Vector2{ .x = 500, .y = 900 };
const p3 = rl.Vector2{ .x = 900, .y = 100 };

pub fn main() anyerror!void {
    rl.initWindow(screenWidth, screenHeight, "Triangle");
    defer rl.closeWindow();

    rl.setTargetFPS(60);

    const target = rl.loadRenderTexture(screenWidth, screenHeight);
    rl.beginTextureMode(target);
    rl.clearBackground(rl.Color.black);
    rl.endTextureMode();

    var p = rl.Vector2{ .x = 600, .y = 600 };
    while (!rl.windowShouldClose()) {
        rl.beginTextureMode(target);

        rl.drawCircle(p1.x, p1.y, circleRadius, rl.Color.ray_white);
        rl.drawCircle(p2.x, p2.y, circleRadius, rl.Color.ray_white);
        rl.drawCircle(p3.x, p3.y, circleRadius, rl.Color.ray_white);

        const number = rand.uintLessThan(u8, 6) + 1;
        switch (number) {
            1...2 => {
                const tmp = rl.math.vector2Scale(rl.math.vector2Subtract(p2, p), 0.5);
                p = rl.math.vector2Add(p, tmp);
            },
            3...4 => {
                const tmp = rl.math.vector2Scale(rl.math.vector2Subtract(p1, p), 0.5);
                p = rl.math.vector2Add(p, tmp);
            },
            5...6 => {
                const tmp = rl.math.vector2Scale(rl.math.vector2Subtract(p3, p), 0.5);
                p = rl.math.vector2Add(p, tmp);
            },
            else => {},
        }
        rl.drawCircle(@intFromFloat(p.x), @intFromFloat(p.y), circleRadius, rl.Color.ray_white);
        rl.endTextureMode();

        rl.beginDrawing();
        rl.drawTexture(target.texture, 0, 0, rl.Color.white);
        rl.endDrawing();
    }
}
