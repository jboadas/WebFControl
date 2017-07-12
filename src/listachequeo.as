// ActionScript file

import flash.events.MouseEvent;

import mx.controls.Alert;
import mx.events.CloseEvent;


private function fOk():void{

	evento.text = "0000";
	dispatchEvent(new CloseEvent(CloseEvent.CLOSE));
	
}

private function fInfo():void{

	evento.text = "4141";
	dispatchEvent(new CloseEvent(CloseEvent.CLOSE));
	
}


private function editarFecHor():void{
	evento.text = "5555";
	dispatchEvent(new CloseEvent(CloseEvent.CLOSE));
}

private function fCancel():void{
	
	dispatchEvent(new CloseEvent(CloseEvent.CLOSE));
	
}

private function fNegar():void{
	
	Alert.show('Esta seguro que desea cancelar \n la ejecucion del proceso', 'Alerta', Alert.OK | Alert.CANCEL, this, confirmaBorrar, iconoAlerta, Alert.CANCEL);
	
}

public function verifTripul():void{
	
	if((cCap.selectedIndex!=-1) && (cCop.selectedIndex!=-1)){
		if((cJcab.selectedIndex!=-1) && (cTrip1.selectedIndex!=-1)){
			if((cTrip2.selectedIndex!=-1) && (cTrip3.selectedIndex!=-1)){
				if((cDesp.selectedIndex!=-1) && (cMec.selectedIndex!=-1)){
					ch1.enabled = true;
				}
			}
		}
	}
	
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

private function addListeners():void{
		
	rcap.addEventListener(MouseEvent.CLICK,resetCombo);
	rcop.addEventListener(MouseEvent.CLICK,resetCombo);
	rjcab.addEventListener(MouseEvent.CLICK,resetCombo);
	rtri1.addEventListener(MouseEvent.CLICK,resetCombo);
	rtri2.addEventListener(MouseEvent.CLICK,resetCombo);
	rtri3.addEventListener(MouseEvent.CLICK,resetCombo);
	rdesp.addEventListener(MouseEvent.CLICK,resetCombo);
	rmec.addEventListener(MouseEvent.CLICK,resetCombo);
}


public function resetCombo(e:Event):void{
	//resetea los combobox de las tripulaciones
	if(e.target.id == "rcap"){
		cCap.selectedIndex = -1;
		ch1.selected = false;
		ch1.enabled = false;
	}
	if(e.target.id == "rcop"){
		cCop.selectedIndex = -1;
		ch1.selected = false;
		ch1.enabled = false;
	}
	if(e.target.id == "rjcab"){
		cJcab.selectedIndex = -1;
		ch1.selected = false;
		ch1.enabled = false;
	}
	if(e.target.id == "rtri1"){
		cTrip1.selectedIndex = -1;
		ch1.selected = false;
		ch1.enabled = false;
	}
	if(e.target.id == "rtri2"){
		cTrip2.selectedIndex = -1;
		ch1.selected = false;
		ch1.enabled = false;
	}
	if(e.target.id == "rtri3"){
		cTrip3.selectedIndex = -1;
		ch1.selected = false;
		ch1.enabled = false;
	}
	if(e.target.id == "rdesp"){
		cDesp.selectedIndex = -1;
		ch1.selected = false;
		ch1.enabled = false;
	}
	if(e.target.id == "rmec"){
		cMec.selectedIndex = -1;
		ch1.selected = false;
		ch1.enabled = false;
	}
}

