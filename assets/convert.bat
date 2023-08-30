@echo off
setlocal enabledelayedexpansion

cd assets

set "webp_count=0"
set "avif_count=0"
set "webp_skipped=0"
set "avif_skipped=0"

echo Converting JPEG to WebP...
for %%i in (*.jpeg) do (
    set "webp_output=%%~ni.webp"
    if exist !webp_output! (
        echo Skipped: !webp_output! already exists.
        set /a webp_skipped+=1
    ) else (
        D:\gptq\manaralodge\.git\libwebp-1.3.1\libwebp-1.3.1-windows-x64\bin\cwebp -q 80 %%i -o !webp_output!
        echo Converted: %%i to !webp_output!
        set /a webp_count+=1
    )
)

echo Done!
echo WebP: Converted !webp_count! files, skipped !webp_skipped! files.

endlocal
