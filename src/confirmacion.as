// ActionScript file

import flash.events.MouseEvent;
import mx.controls.Alert;
import mx.events.CloseEvent;

private function fOk():void{

	if(!chkb.selected){
		Alert.show("Debe marcar la casilla de verificacion");
	}
	else{
		evento.text = "0000";
		dispatchEvent(new CloseEvent(CloseEvent.CLOSE));
	}
	
}

private function fCancel():void{
	
	dispatchEvent(new CloseEvent(CloseEvent.CLOSE));
	
}

private function fNegar():void{
	
	Alert.show('Esta seguro que desea cancelar \n la ejecucion del proceso', 'Alerta', Alert.OK | Alert.CANCEL, this, confirmaBorrar, iconoAlerta, Alert.CANCEL);
}

private function confirmaBorrar(eventObj:CloseEvent):void{
	//Chequeo que el boton OK fue presionado.
	if (eventObj.detail==Alert.OK) {
		if(tjusti.text.length==0){
			Alert.show("Debe colocar la justificacion para cancelar");
			tjusti.visible=true;
			tjusti.enabled=true;
		}
		else{
			evento.text = "9999";
			dispatchEvent(new CloseEvent(CloseEvent.CLOSE));
		}
	}	
}

private function verlog():void{
	evento.text = "2001"
	dispatchEvent(new CloseEvent(CloseEvent.CLOSE));
}
