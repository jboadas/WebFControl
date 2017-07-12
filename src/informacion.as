// ActionScript file
import flash.events.MouseEvent;

import mx.controls.Alert;
import mx.events.CloseEvent;

public function modificar():void{
	
	evento.text = "5555"
	dispatchEvent(new CloseEvent(CloseEvent.CLOSE));
}

public function verlistas():void{

	evento.text = "2000"
	dispatchEvent(new CloseEvent(CloseEvent.CLOSE));
}

public function verlogs():void{
	
	evento.text = "2001"
	dispatchEvent(new CloseEvent(CloseEvent.CLOSE));
}

public function verTripulacion():void{

	evento.text = "2002"
	dispatchEvent(new CloseEvent(CloseEvent.CLOSE));
	
}

private function fNegar():void{
	
	Alert.show('Esta seguro que desea cancelar \n la ejecucion del proceso', 'Alerta', Alert.OK | Alert.CANCEL, this, confirmaBorrar, iconoAlerta, Alert.CANCEL);
	
}
private function confirmaBorrar(eventObj:CloseEvent):void{
	//Chequeo que el boton OK fue presionado.
	if (eventObj.detail==Alert.OK) {
		if(jText.text.length==0){
			Alert.show("Debe colocar la justificacion para cancelar");
			jlabel.visible=true;
			jText.visible=true;
			jText.enabled=true;
		}
		else{
			evento.text = "9999";
			dispatchEvent(new CloseEvent(CloseEvent.CLOSE));
		}
	}	
}
