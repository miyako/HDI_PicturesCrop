Case of 
	: (Form event code:C388=On Load:K2:1)
		
		C_PICTURE:C286(<>Pict1; <>Pict2)
		C_LONGINT:C283(<>RefX1; <>RefY1; <>RefX2; <>RefY2)
		C_LONGINT:C283(<>SliderH1; <>SliderH2; <>SliderV1; <>SliderV2)
		
		READ PICTURE FILE:C678(File:C1566("/RESOURCES/Images/library/Caledonie.jpg").platformPath; <>Pict1)
		
		<>SliderH1:=20
		<>SliderH2:=120
		<>SliderV1:=40
		<>SliderV2:=100
		
		OBJECT GET COORDINATES:C663(*; "RefPicture"; <>RefX1; <>RefY1; <>RefX2; <>RefY2)
		
		MoveRefLines
		
End case 