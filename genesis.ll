; ModuleID = 'ccode/genesis.c'
source_filename = "ccode/genesis.c"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.12.0"

%struct.SDL_Window = type opaque
%struct.SDL_Renderer = type opaque
%struct.color = type { i32, i32, i32 }
%struct.SDL_Rect = type { i32, i32, i32, i32 }

@gWindow = global %struct.SDL_Window* null, align 8
@gRenderer = global %struct.SDL_Renderer* null, align 8
@backgroundR = global i32 255, align 4
@backgroundG = global i32 255, align 4
@backgroundB = global i32 255, align 4
@.str = private unnamed_addr constant [41 x i8] c"SDL could not initialize! SDL Error: %s\0A\00", align 1
@.str.1 = private unnamed_addr constant [25 x i8] c"SDL_RENDER_SCALE_QUALITY\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"1\00", align 1
@.str.3 = private unnamed_addr constant [47 x i8] c"Warning: Linear texture filtering not enabled!\00", align 1
@.str.4 = private unnamed_addr constant [5 x i8] c"Game\00", align 1
@.str.5 = private unnamed_addr constant [44 x i8] c"Window could not be created! SDL Error: %s\0A\00", align 1
@.str.6 = private unnamed_addr constant [46 x i8] c"Renderer could not be created! SDL Error: %s\0A\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @initScreen(i32, i32, %struct.color*) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca %struct.color*, align 8
  %7 = alloca i32, align 4
  store i32 %0, i32* %4, align 4
  store i32 %1, i32* %5, align 4
  store %struct.color* %2, %struct.color** %6, align 8
  store i32 1, i32* %7, align 4
  %8 = call i32 @SDL_Init(i32 32)
  %9 = icmp slt i32 %8, 0
  br i1 %9, label %10, label %13

; <label>:10:                                     ; preds = %3
  %11 = call i8* @SDL_GetError()
  %12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str, i32 0, i32 0), i8* %11)
  store i32 0, i32* %7, align 4
  br label %47

; <label>:13:                                     ; preds = %3
  %14 = call i32 @SDL_SetHint(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.1, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0))
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %18, label %16

; <label>:16:                                     ; preds = %13
  %17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.3, i32 0, i32 0))
  br label %18

; <label>:18:                                     ; preds = %16, %13
  %19 = load i32, i32* %4, align 4
  %20 = load i32, i32* %5, align 4
  %21 = call %struct.SDL_Window* @SDL_CreateWindow(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.4, i32 0, i32 0), i32 536805376, i32 536805376, i32 %19, i32 %20, i32 4)
  store %struct.SDL_Window* %21, %struct.SDL_Window** @gWindow, align 8
  %22 = load %struct.SDL_Window*, %struct.SDL_Window** @gWindow, align 8
  %23 = icmp eq %struct.SDL_Window* %22, null
  br i1 %23, label %24, label %27

; <label>:24:                                     ; preds = %18
  %25 = call i8* @SDL_GetError()
  %26 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.5, i32 0, i32 0), i8* %25)
  store i32 0, i32* %7, align 4
  br label %46

; <label>:27:                                     ; preds = %18
  %28 = load %struct.SDL_Window*, %struct.SDL_Window** @gWindow, align 8
  %29 = call %struct.SDL_Renderer* @SDL_CreateRenderer(%struct.SDL_Window* %28, i32 -1, i32 2)
  store %struct.SDL_Renderer* %29, %struct.SDL_Renderer** @gRenderer, align 8
  %30 = load %struct.SDL_Renderer*, %struct.SDL_Renderer** @gRenderer, align 8
  %31 = icmp eq %struct.SDL_Renderer* %30, null
  br i1 %31, label %32, label %35

; <label>:32:                                     ; preds = %27
  %33 = call i8* @SDL_GetError()
  %34 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.6, i32 0, i32 0), i8* %33)
  store i32 0, i32* %7, align 4
  br label %45

; <label>:35:                                     ; preds = %27
  %36 = load %struct.color*, %struct.color** %6, align 8
  %37 = getelementptr inbounds %struct.color, %struct.color* %36, i32 0, i32 0
  %38 = load i32, i32* %37, align 4
  store i32 %38, i32* @backgroundR, align 4
  %39 = load %struct.color*, %struct.color** %6, align 8
  %40 = getelementptr inbounds %struct.color, %struct.color* %39, i32 0, i32 1
  %41 = load i32, i32* %40, align 4
  store i32 %41, i32* @backgroundG, align 4
  %42 = load %struct.color*, %struct.color** %6, align 8
  %43 = getelementptr inbounds %struct.color, %struct.color* %42, i32 0, i32 2
  %44 = load i32, i32* %43, align 4
  store i32 %44, i32* @backgroundB, align 4
  call void @clearScreen()
  call void @showDisplay()
  br label %45

; <label>:45:                                     ; preds = %35, %32
  br label %46

; <label>:46:                                     ; preds = %45, %24
  br label %47

; <label>:47:                                     ; preds = %46, %10
  %48 = load i32, i32* %7, align 4
  ret i32 %48
}

declare i32 @SDL_Init(i32) #1

declare i32 @printf(i8*, ...) #1

declare i8* @SDL_GetError() #1

declare i32 @SDL_SetHint(i8*, i8*) #1

declare %struct.SDL_Window* @SDL_CreateWindow(i8*, i32, i32, i32, i32, i32) #1

declare %struct.SDL_Renderer* @SDL_CreateRenderer(%struct.SDL_Window*, i32, i32) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @clearScreen() #0 {
  %1 = load %struct.SDL_Renderer*, %struct.SDL_Renderer** @gRenderer, align 8
  %2 = load i32, i32* @backgroundR, align 4
  %3 = trunc i32 %2 to i8
  %4 = load i32, i32* @backgroundG, align 4
  %5 = trunc i32 %4 to i8
  %6 = load i32, i32* @backgroundB, align 4
  %7 = trunc i32 %6 to i8
  %8 = call i32 @SDL_SetRenderDrawColor(%struct.SDL_Renderer* %1, i8 zeroext %3, i8 zeroext %5, i8 zeroext %7, i8 zeroext -1)
  %9 = load %struct.SDL_Renderer*, %struct.SDL_Renderer** @gRenderer, align 8
  %10 = call i32 @SDL_RenderClear(%struct.SDL_Renderer* %9)
  ret void
}

declare i32 @SDL_SetRenderDrawColor(%struct.SDL_Renderer*, i8 zeroext, i8 zeroext, i8 zeroext, i8 zeroext) #1

declare i32 @SDL_RenderClear(%struct.SDL_Renderer*) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define { i64, i64 } @drawRectangle(i32, i32, i32, i32, i32, i32, i32) #0 {
  %8 = alloca %struct.SDL_Rect, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca %struct.SDL_Rect, align 4
  store i32 %0, i32* %9, align 4
  store i32 %1, i32* %10, align 4
  store i32 %2, i32* %11, align 4
  store i32 %3, i32* %12, align 4
  store i32 %4, i32* %13, align 4
  store i32 %5, i32* %14, align 4
  store i32 %6, i32* %15, align 4
  %17 = getelementptr inbounds %struct.SDL_Rect, %struct.SDL_Rect* %16, i32 0, i32 0
  %18 = load i32, i32* %9, align 4
  store i32 %18, i32* %17, align 4
  %19 = getelementptr inbounds %struct.SDL_Rect, %struct.SDL_Rect* %16, i32 0, i32 1
  %20 = load i32, i32* %10, align 4
  store i32 %20, i32* %19, align 4
  %21 = getelementptr inbounds %struct.SDL_Rect, %struct.SDL_Rect* %16, i32 0, i32 2
  %22 = load i32, i32* %11, align 4
  store i32 %22, i32* %21, align 4
  %23 = getelementptr inbounds %struct.SDL_Rect, %struct.SDL_Rect* %16, i32 0, i32 3
  %24 = load i32, i32* %12, align 4
  store i32 %24, i32* %23, align 4
  %25 = load %struct.SDL_Renderer*, %struct.SDL_Renderer** @gRenderer, align 8
  %26 = load i32, i32* %13, align 4
  %27 = trunc i32 %26 to i8
  %28 = load i32, i32* %14, align 4
  %29 = trunc i32 %28 to i8
  %30 = load i32, i32* %15, align 4
  %31 = trunc i32 %30 to i8
  %32 = call i32 @SDL_SetRenderDrawColor(%struct.SDL_Renderer* %25, i8 zeroext %27, i8 zeroext %29, i8 zeroext %31, i8 zeroext -1)
  %33 = load %struct.SDL_Renderer*, %struct.SDL_Renderer** @gRenderer, align 8
  %34 = call i32 @SDL_RenderFillRect(%struct.SDL_Renderer* %33, %struct.SDL_Rect* %16)
  %35 = bitcast %struct.SDL_Rect* %8 to i8*
  %36 = bitcast %struct.SDL_Rect* %16 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %35, i8* %36, i64 16, i32 4, i1 false)
  %37 = bitcast %struct.SDL_Rect* %8 to { i64, i64 }*
  %38 = load { i64, i64 }, { i64, i64 }* %37, align 4
  ret { i64, i64 } %38
}

declare i32 @SDL_RenderFillRect(%struct.SDL_Renderer*, %struct.SDL_Rect*) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @showDisplay() #0 {
  %1 = load %struct.SDL_Renderer*, %struct.SDL_Renderer** @gRenderer, align 8
  call void @SDL_RenderPresent(%struct.SDL_Renderer* %1)
  ret void
}

declare void @SDL_RenderPresent(%struct.SDL_Renderer*) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @initScreenT(i32) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.color, align 4
  %4 = alloca %struct.color*, align 8
  %5 = alloca %struct.SDL_Rect, align 4
  %6 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  %7 = getelementptr inbounds %struct.color, %struct.color* %3, i32 0, i32 0
  store i32 255, i32* %7, align 4
  %8 = getelementptr inbounds %struct.color, %struct.color* %3, i32 0, i32 1
  store i32 255, i32* %8, align 4
  %9 = getelementptr inbounds %struct.color, %struct.color* %3, i32 0, i32 2
  store i32 255, i32* %9, align 4
  store %struct.color* %3, %struct.color** %4, align 8
  %10 = load %struct.color*, %struct.color** %4, align 8
  %11 = call i32 @initScreen(i32 640, i32 480, %struct.color* %10)
  %12 = call { i64, i64 } @drawRectangle(i32 0, i32 0, i32 20, i32 20, i32 255, i32 0, i32 0)
  %13 = bitcast %struct.SDL_Rect* %5 to { i64, i64 }*
  %14 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %13, i32 0, i32 0
  %15 = extractvalue { i64, i64 } %12, 0
  store i64 %15, i64* %14, align 4
  %16 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %13, i32 0, i32 1
  %17 = extractvalue { i64, i64 } %12, 1
  store i64 %17, i64* %16, align 4
  call void @showDisplay()
  store i32 0, i32* %6, align 4
  br label %18

; <label>:18:                                     ; preds = %22, %1
  %19 = load i32, i32* %6, align 4
  %20 = icmp slt i32 %19, 4000
  br i1 %20, label %21, label %25

; <label>:21:                                     ; preds = %18
  call void @SDL_PumpEvents()
  call void @SDL_Delay(i32 1)
  br label %22

; <label>:22:                                     ; preds = %21
  %23 = load i32, i32* %6, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, i32* %6, align 4
  br label %18

; <label>:25:                                     ; preds = %18
  call void @close()
  ret i32 0
}

declare void @SDL_PumpEvents() #1

declare void @SDL_Delay(i32) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @close() #0 {
  %1 = load %struct.SDL_Renderer*, %struct.SDL_Renderer** @gRenderer, align 8
  call void @SDL_DestroyRenderer(%struct.SDL_Renderer* %1)
  %2 = load %struct.SDL_Window*, %struct.SDL_Window** @gWindow, align 8
  call void @SDL_DestroyWindow(%struct.SDL_Window* %2)
  store %struct.SDL_Window* null, %struct.SDL_Window** @gWindow, align 8
  store %struct.SDL_Renderer* null, %struct.SDL_Renderer** @gRenderer, align 8
  call void @SDL_Quit()
  ret void
}

declare void @SDL_DestroyRenderer(%struct.SDL_Renderer*) #1

declare void @SDL_DestroyWindow(%struct.SDL_Window*) #1

declare void @SDL_Quit() #1

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"clang version 5.0.0 (tags/RELEASE_500/final)"}
