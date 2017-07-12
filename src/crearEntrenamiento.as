// ActionScript file

import mx.controls.Alert;
import mx.events.CloseEvent;
import lib.validaciones;

	public var val:validaciones = new validaciones();

	private function efAceptar():void
	{
		if(verificaEntrenamiento())
		{
			//Guardo el registro del nuevo evento
			evento.text = "0000";
			dispatchEvent(new CloseEvent(CloseEvent.CLOSE));
		}
	}

	private function verificaEntrenamiento():Boolean{
		if(fechaI.selectedDate!= null){
			var ai:int = fechaI.selectedDate.getFullYear();
			var mei:int = fechaI.selectedDate.getMonth() +1;
			var di:int = fechaI.selectedDate.getDate();
		}
		var hi:int = horaI.value;
		var mi:int = minI.value;

		if(fechaF.selectedDate != null){

			var af:int = fechaF.selectedDate.getFullYear();
			var mef:int = fechaF.selectedDate.getMonth() +1;
			var df:int = fechaF.selectedDate.getDate();
			
		}
		
		var hf:int = horaF.value;
		var mf:int = minF.value;
		if((fechaI.text.length!=0) && (fechaF.text.length!=0)){
			
			if(val.validDate(ai,mei,di,af,mef,df)){
				if(val.fechasIguales(ai,mei,di,af,mef,df)){
					if(val.comparaHoras(hi,mi,hf,mf)){
						if(descripcion.text.length==0){
							log.text = log.text + "Descripcion ??";
							return false;
						}
						return true;
					}
					else{
						log.text = "";
						log.text = log.text + "Horas de inicio y final erradas. \n";
						return false;
					}
				}
				else{
					if(descripcion.text.length==0){
						log.text = log.text + "Descripcion ??";
						return false;
					}
					return true;
				}
			}
			else{
				log.text = "";
				log.text = log.text + "Rango Invalido de fechas. \n";
				return false;
			}
			
		}
		else{
			log.text = "";
			if(fechaI.text.length==0){
				log.text = log.text + "Fecha de inicio debe contener un valor. \n";
				return false;
			}
			if(fechaF.text.length==0){
				log.text = log.text + "Fecha de finalizacion debe contener un valor. \n";
				return false;
			}

			return false;		
			
		}
	}
	
	private function fBorrar():void{
		
		Alert.show('Esta seguro de borrar este evento? \n los cambios seran permanentes!!!', 'Alerta', Alert.OK | Alert.CANCEL, this, confirmaBorrar, iconoAlerta, Alert.CANCEL);
		
	}
	
	private function confirmaBorrar(eventObj:CloseEvent):void{
		//Chequeo que el boton OK fue presionado.
		if (eventObj.detail==Alert.OK) {
			evento.text = "1111";
			dispatchEvent(new CloseEvent(CloseEvent.CLOSE));
		}
	}
	
