//%attributes = {"invisible":true}
$Thickness:=1

OBJECT MOVE:C664(*; "SelRect1"; <>RefX1; <>RefY1; <>RefX1+<>SliderH1-$Thickness; <>RefY2-<>SliderV1-$Thickness; *)
OBJECT MOVE:C664(*; "SelRect2"; <>RefX1+<>SliderH2+$Thickness; <>RefY2-<>SliderV2+$Thickness; <>RefX2; <>RefY2; *)
OBJECT MOVE:C664(*; "SelRect3"; <>RefX1+<>SliderH1+$Thickness; <>RefY1; <>RefX2; <>RefY2-<>SliderV2-$Thickness; *)
OBJECT MOVE:C664(*; "SelRect4"; <>RefX1; <>RefY2-<>SliderV1+$Thickness; <>RefX1+<>SliderH2-$Thickness; <>RefY2; *)

<>Pict2:=<>Pict1
TRANSFORM PICTURE:C988(<>Pict2; Crop:K61:7; <>SliderH1; <>RefY2-<>RefY1-<>SliderV2; <>SliderH2-<>SliderH1; <>SliderV2-<>SliderV1)