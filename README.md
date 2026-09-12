![version](https://img.shields.io/badge/version-20%2B-E23089)
![platform](https://img.shields.io/static/v1?label=platform&message=mac-intel%20|%20mac-arm%20|%20win-64&color=blue)

# HDI_PicturesCrop

Cropping a picture to an interactively drawn rectangle using `TRANSFORM PICTURE` in `Crop` mode. Originally published by 4D as a **HDI** (*How Do I*) example for **4D v12**; restored so it runs on current 4D releases.

## What it demonstrates

- Cropping a picture with `TRANSFORM PICTURE` and the `Crop` selector, given an origin and a width/height.
- Building an interactive crop rectangle from four sliders (left/right edges and top/bottom edges) that constrain each other so the selection stays valid.
- Positioning on-form overlay objects programmatically with `OBJECT MOVE` to draw the four bands around the selection.
- Reading the reference picture's on-screen box with `OBJECT GET COORDINATES` so slider values map to real pixel coordinates.
- Loading the source image with `READ PICTURE FILE` from the project `/RESOURCES` folder.

## Key commands

| Command | Used for |
|---|---|
| `TRANSFORM PICTURE` | Crop `<>Pict1` into `<>Pict2` using the slider-defined rectangle |
| `OBJECT MOVE` | Reposition the four `SelRect*` overlay objects to outline the crop area |
| `OBJECT GET COORDINATES` | Read the displayed picture's box to anchor the crop geometry |
| `READ PICTURE FILE` | Load `Caledonie.jpg` into the picture variable |
| `Open form window` | Open the demo dialog window |
| `DIALOG` | Display the `Demo` form |

## How it works

`Demo_Start` (called from the `On Startup` database method) opens the `Demo` form, re-entering itself via `CALL WORKER` so the `DIALOG` runs on a worker process.

On `On Load` (`Forms/Demo/method.4dm`) the form reads `Caledonie.jpg` into `<>Pict1`, initialises the four slider variables (`<>SliderH1/H2` for horizontal edges, `<>SliderV1/V2` for vertical edges), captures the picture object's coordinates into `<>RefX1..<>RefY2` with `OBJECT GET COORDINATES`, then calls `MoveRefLines`.

`MoveRefLines` is the heart of the demo. It positions four overlay objects (`SelRect1..SelRect4`) with `OBJECT MOVE` to frame the selection, then copies `<>Pict1` to `<>Pict2` and calls `TRANSFORM PICTURE(<>Pict2; Crop; <>SliderH1; <>RefY2-<>RefY1-<>SliderV2; <>SliderH2-<>SliderH1; <>SliderV2-<>SliderV1)`. The four ruler object methods (`Ruler1..Ruler4`) clamp opposing sliders (for example `Ruler2` forces `<>SliderH2>=<>SliderH1`) and re-run `MoveRefLines`, so dragging any edge re-crops immediately.

## Points of interest

- The crop origin's vertical component is expressed relative to the picture box (`<>RefY2-<>RefY1-<>SliderV2`) because the sliders count upward from the bottom while `TRANSFORM PICTURE` crops from the top-left.
- A one-pixel `$Thickness` offset is added when placing the `SelRect*` bands so the outline sits just outside the cropped region rather than over it.
- The ruler methods guard against inverted selections by snapping the trailing edge to the leading edge, preventing negative width or height being passed to `TRANSFORM PICTURE`.

## References

- [4D documentation: TRANSFORM PICTURE](https://developer.4d.com/docs/commands/transform-picture)
- [4D documentation: OBJECT MOVE](https://developer.4d.com/docs/commands/object-move)
- [4D documentation: OBJECT GET COORDINATES](https://developer.4d.com/docs/commands/object-get-coordinates)
- Index of v16/v17 HDIs: [miyako/4d-hdi](https://github.com/miyako/4d-hdi)

## Screenshots

<img width="500" height="auto" alt="" src="https://github.com/user-attachments/assets/7cf08523-eada-4012-9778-c9d3b2da470f" />
