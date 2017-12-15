; ModuleID = 'MicroC'
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
@tmp = private unnamed_addr constant [6 x i8] c"Space\00"
@tmp.9 = private unnamed_addr constant [14 x i8] c"Space pressed\00"
@tmp.10 = private unnamed_addr constant [6 x i8] c"Space\00"
@tmp.11 = private unnamed_addr constant [11 x i8] c"Space held\00"
@tmp.12 = private unnamed_addr constant [6 x i8] c"Space\00"
@tmp.13 = private unnamed_addr constant [15 x i8] c"Space released\00"

declare i32 @printf(i8*, ...)

declare i32 @printbig(i32)

declare i32 @initScreen(%color*, i32, i32)

declare void @startGame(%color*, i32, i32)

declare i1 @isKeyDown(i8*)

declare i1 @isKeyUp(i8*)

declare i1 @isKeyHeld(i8*)

define i32 @main() {
entry:
  %c = alloca %color*
  %color_tmp = alloca %color
  %clr_ptr = alloca %color*
  %r = getelementptr inbounds %color, %color* %color_tmp, i32 0, i32 0
  store i32 0, i32* %r
  %g = getelementptr inbounds %color, %color* %color_tmp, i32 0, i32 1
  store i32 0, i32* %g
  %b = getelementptr inbounds %color, %color* %color_tmp, i32 0, i32 2
  store i32 0, i32* %b
  store %color* %color_tmp, %color** %clr_ptr
  %0 = load %color*, %color** %clr_ptr
  store %color* %0, %color** %c
  %c1 = load %color*, %color** %c
  call void @startGame(%color* %c1, i32 640, i32 480)
  ret i32 0
}

define void @init() {
entry:
  ret void
}

define void @update() {
entry:
  %keyD = call i1 @isKeyDown(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @tmp, i32 0, i32 0))
  br i1 %keyD, label %then, label %else

merge:                                            ; preds = %else, %then
  %keyH = call i1 @isKeyHeld(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @tmp.10, i32 0, i32 0))
  br i1 %keyH, label %then2, label %else4

then:                                             ; preds = %entry
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.8, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @tmp.9, i32 0, i32 0))
  br label %merge

else:                                             ; preds = %entry
  br label %merge

merge1:                                           ; preds = %else4, %then2
  %keyU = call i1 @isKeyUp(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @tmp.12, i32 0, i32 0))
  br i1 %keyU, label %then6, label %else8

then2:                                            ; preds = %merge
  %printf3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.8, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @tmp.11, i32 0, i32 0))
  br label %merge1

else4:                                            ; preds = %merge
  br label %merge1

merge5:                                           ; preds = %else8, %then6
  ret void

then6:                                            ; preds = %merge1
  %printf7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.8, i32 0, i32 0), i8* getelementptr inbounds ([15 x i8], [15 x i8]* @tmp.13, i32 0, i32 0))
  br label %merge5

else8:                                            ; preds = %merge1
  br label %merge5
}
