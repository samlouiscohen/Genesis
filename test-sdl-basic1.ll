; ModuleID = 'Genesis'
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"

%color = type { i32, i32, i32 }

@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00"
@fmt.1 = private unnamed_addr constant [5 x i8] c"%lf\0A\00"
@fmt.2 = private unnamed_addr constant [4 x i8] c"%s\0A\00"
@fmt.3 = private unnamed_addr constant [4 x i8] c"%d\0A\00"
@fmt.4 = private unnamed_addr constant [5 x i8] c"%lf\0A\00"
@fmt.5 = private unnamed_addr constant [4 x i8] c"%s\0A\00"
@fmt.6 = private unnamed_addr constant [4 x i8] c"%d\0A\00"
@fmt.7 = private unnamed_addr constant [5 x i8] c"%lf\0A\00"
@fmt.8 = private unnamed_addr constant [4 x i8] c"%s\0A\00"

declare i32 @printf(i8*, ...)

declare i32 @printbig(i32)

declare i32 @initScreen(%color*, i32, i32)

declare void @startGame(%color*, i32, i32)

declare i1 @isKeyDown(i8*)

declare i1 @isKeyUp(i8*)

declare i1 @isKeyHeld(i8*)

declare i32 @newCluster(i32, i32, i32, i32, i32, i32, %color*)

declare i32 @randomInt(i32)

declare i32 @getX(i32)

declare i32 @getY(i32)

define i32 @main() {
entry:
  %c = alloca %color*
  %color_tmp = alloca %color
  %clr_ptr = alloca %color*
  %r = getelementptr inbounds %color, %color* %color_tmp, i32 0, i32 0
  store i32 255, i32* %r
  %g = getelementptr inbounds %color, %color* %color_tmp, i32 0, i32 1
  store i32 255, i32* %g
  %b = getelementptr inbounds %color, %color* %color_tmp, i32 0, i32 2
  store i32 255, i32* %b
  store %color* %color_tmp, %color** %clr_ptr
  %0 = load %color*, %color** %clr_ptr
  store %color* %0, %color** %c
  %c1 = load %color*, %color** %c
  %initScreen = call i32 @initScreen(%color* %c1, i32 640, i32 480)
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt, i32 0, i32 0), i32 1)
  ret i32 0
}

define void @update(i32 %f) {
entry:
  %f1 = alloca i32
  store i32 %f, i32* %f1
  ret void
}

define void @init() {
entry:
  ret void
}
