# sierpinski-triangle

Sierpinski triangle in [Zig](https://ziglang.org/) using [Raylib](https://www.raylib.com/)
<img src="https://github.com/xndrg/sierpinski-triangle/blob/main/triangle.png?raw=true" width="400" />

# Get Started

```console
$ zig build run
```

# How It Works

There are 3 points on the screen at the beggining, which represent big triangle, called p1, p2, p3.\
And 1 point at random position within this rectangle, called p. It will be moved every frame.
Every frame we generate random number from 1 to 6, just like throwing a dice.\
If number is 1 or 2 => We draw next point at half distance from p to p1.\
If number is 3 or 4 => We draw next point at half distance from p to p1.\
If number is 5 or 6 => We draw next point at half distance from p to p3.

# References

[Raylib Zig bindings](https://github.com/Not-Nik/raylib-zig)