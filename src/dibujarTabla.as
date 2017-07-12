// ActionScript file
import calendar.Evento;
import calendar.cellFactory;
import flash.external.ExternalInterface;

import flash.accessibility.Accessibility;
import flash.events.Event;
import flash.events.MouseEvent;

import mx.controls.Alert;
import mx.events.CloseEvent;
import mx.events.ScrollEvent;
import mx.events.ScrollEventDirection;
import mx.managers.PopUpManager;
import mx.utils.object_proxy;

	public var tabla:cellFactory = new cellFactory(); // variable del UI element que contiene la tabla;
	public var eWindow:EditarEvento;
	public var ceWindow:CrearEvento;
	public var mWindow:CrearMantenimiento;
	public var lWin:ListaChequeo;
	public var iWin:Informacion;
	public var cWin:Confirmacion;
	public var aWin:Ayudax;
	public var vlWin:Verlogs;
	public var tWin:VerTripulantes;
	public var capWin:CrearEntrenamiento;
	public var equipoActual:String;
	public var cap:Array;
	public var tri:Array;
	public var desp:Array;
	public var mec:Array;
	

public function iniciaEventos():void{
	
	var anoini:int;
	var mesini:int;
	var diaini:int;
	var horini:int;
	var minini:int;
	
	var anofin:int;
	var mesfin:int;
	var diafin:int;
	var horfin:int;
	var minfin:int;
	
	var idEvt:int;
	var nrovuelo:String;
	var operador:String;
	var org:String;
	var dst:String;
	var des:String;
	var tipo:int;
	var status:int;
	var asize:int;
	var vcap:int;
	var vcop:int;
	var vjcab:int;
	var vtri1:int;
	var vtri2:int;
	var vtri3:int;
	var vdesp:int;
	var vmec:int;

	var lisopesol:String;
	var lismansol:String;
	var lissegsol:String;
	var lisadmsol:String;
	var lisopeeje:String;
	var lismaneje:String;
	var lissegeje:String;
	var lisadmeje:String;
	
	var txtopesol:String;
	var txtmansol:String;
	var txtsegsol:String;
	var txtadmsol:String;
	
	var txtopeeje:String;
	var txtmaneje:String;
	var txtsegeje:String;
	var txtadmeje:String;
	
	var usercancel:String;
	var txtcancel:String;
	var log:String;

	eventos = new Array();
	mantenimientos = new Array();
	entrenamientos = new Array();
	
	
	if (vuelosCol.length == 0 || vuelosCol == null){
		if(vuelosCol==null){
			mx.controls.Alert.show("Por favor seleccione una Aeronave !");
		}
	}
	else{
		for(var i:int=0;i<vuelosCol.length;i++){
			
			anoini = parseInt(vuelosCol[i].anoini);
			mesini = parseInt(vuelosCol[i].mesini);
			diaini = parseInt(vuelosCol[i].diaini);
			horini = parseInt(vuelosCol[i].horaini);
			minini = parseInt(vuelosCol[i].minini);

			anofin = parseInt(vuelosCol[i].anofin);
			mesfin = parseInt(vuelosCol[i].mesfin);
			diafin = parseInt(vuelosCol[i].diafin);
			horfin = parseInt(vuelosCol[i].horafin);
			minfin = parseInt(vuelosCol[i].minfin);
			
			idEvt = parseInt(vuelosCol[i].id);
			operador = vuelosCol[i].operador;
			nrovuelo = vuelosCol[i].nrovuelo;
			org = vuelosCol[i].origen;
			dst = vuelosCol[i].destino;
			des = vuelosCol[i].descripcion;
			tipo = parseInt(vuelosCol[i].tipo);
			status = parseInt(vuelosCol[i].status);
			
			vcap = vuelosCol[i].capitan;
			vcop = vuelosCol[i].copiloto;
			vjcab = vuelosCol[i].jefecab;
			vtri1 = vuelosCol[i].trip01;
			vtri2 = vuelosCol[i].trip02;
			vtri3 = vuelosCol[i].trip03;
			vdesp = vuelosCol[i].desp;
			vmec = vuelosCol[i].mec;
			
			lisopesol = vuelosCol[i].opesol;
			lismansol = vuelosCol[i].mansol;
			lissegsol = vuelosCol[i].segsol;
			lisadmsol = vuelosCol[i].admsol;

			lisopeeje = vuelosCol[i].opeeje;
			lismaneje = vuelosCol[i].maneje;
			lissegeje = vuelosCol[i].segeje;
			lisadmeje = vuelosCol[i].admeje;
			
			txtopesol = vuelosCol[i].opesoltxt;
			txtmansol = vuelosCol[i].mansoltxt;
			txtsegsol = vuelosCol[i].segsoltxt;
			txtadmsol = vuelosCol[i].admsoltxt;
			
			txtopeeje = vuelosCol[i].opeejetxt;
			txtmaneje = vuelosCol[i].manejetxt;
			txtsegeje = vuelosCol[i].segejetxt;
			txtadmeje = vuelosCol[i].admejetxt;
			
			usercancel = vuelosCol[i].usercancel;
			txtcancel = vuelosCol[i].txtcancel;
			log = vuelosCol[i].log;

			var evtx:Evento = new Evento(anoini,mesini,diaini,horini,minini,anofin,mesfin,diafin,horfin,minfin);
			evtx.setId(idEvt);
			evtx.setStatus(status);
			
			if(evtx!=null && evtx.validDate(aano,ames,adia) && status < 1000){
				
				if(tipo == 0){
					
					evtx.setVuelo();
					evtx.setnroVuelo(nrovuelo);
					evtx.setOperador(operador);
					evtx.setOrigen(org);
					evtx.setDestino(dst);
					evtx.setDescripcion(des);
					evtx.setCap(vcap);
					evtx.setCop(vcop);
					evtx.setJcab(vjcab);
					evtx.setTri1(vtri1);
					evtx.setTri2(vtri2);
					evtx.setTri3(vtri3);
					evtx.setDesp(vdesp);
					evtx.setMec(vmec);

					if(lisopesol != null && lisopesol != ''){
						evtx.setListaOpe(lisopesol,0);
					}
					if(lismansol != null && lismansol != ''){
						evtx.setListaMan(lismansol,0);
					}
					if(lissegsol != null && lissegsol != ''){
						evtx.setListaSeg(lissegsol,0);
					}
					if(lisadmsol != null && lisadmsol != ''){
						evtx.setListaAdm(lisadmsol,0);
					}
					
					
					if(lisopeeje != null && lisopeeje != ''){
						evtx.setListaOpe(lisopeeje,1);
					}
					if(lismaneje != null && lismaneje != ''){
						evtx.setListaMan(lismaneje,1);
					}
					if(lissegeje != null && lissegeje != ''){
						evtx.setListaSeg(lissegeje,1);
					}
					if(lisadmeje != null && lisadmeje != ''){
						evtx.setListaAdm(lisadmeje,1);
					}
					
					if(txtopesol != null && txtopesol != ''){
						evtx.setTxtOpe(txtopesol,0);
					}
					if(txtmansol != null && txtmansol != ''){
						evtx.setTxtMan(txtmansol,0);
					}
					if(txtsegsol != null && txtsegsol != ''){
						evtx.setTxtSeg(txtsegsol,0);
					}
					if(txtadmsol != null && txtadmsol != ''){
						evtx.setTxtAdm(txtadmsol,0);
					}
					if(txtopeeje != null && txtopeeje != ''){
						evtx.setTxtOpe(txtopeeje,1);
					}
					if(txtmaneje != null && txtmaneje != ''){
						evtx.setTxtMan(txtmaneje,1);
					}
					if(txtsegeje != null && txtsegeje != ''){
						evtx.setTxtSeg(txtsegeje,1);
					}
					if(txtadmeje != null && txtadmeje != ''){
						evtx.setTxtAdm(txtadmeje,1);
					}
					if(usercancel != null && usercancel != ''){
						evtx.setUserCancel(usercancel);
					}
					if(txtcancel != null && txtcancel != ''){
						evtx.setTxtCancel(txtcancel);
					}
					if(log!=null && log != ''){
						evtx.setLog(log);
					}
	
					asize = eventos.length;
					eventos[asize]=evtx;
					eventos[asize].draw(aano,ames,adia,contenido.width).addEventListener(MouseEvent.CLICK,editEvento);
					
				}
				else if(tipo==1){
					
					evtx.setMantenimiento();
					evtx.setDescripcion(des);
					asize = mantenimientos.length;
					mantenimientos[asize]=evtx;					
					mantenimientos[asize].draw(aano,ames,adia,contenido.width).addEventListener(MouseEvent.CLICK,editarMantenimiento);
								
				}
				else{
					
					evtx.setEntrenamiento();
					evtx.setDescripcion(des);
					asize = entrenamientos.length;
					entrenamientos[asize]=evtx;
					entrenamientos[asize].draw(aano,ames,adia,contenido.width).addEventListener(MouseEvent.CLICK,editarEntrenamiento);
					
				}
			}
		}

		//cargo los tripulantes en el array
		tri = new Array();
		cap = new Array();
		mec = new Array();
		desp = new Array();
		
		var tipotri:String;
		
		for(var j:int=0;j<tripulantesCol.length;j++){
			
			tipotri = tripulantesCol[j].tipo;
			
			if(tipotri=="tri"){

				tri[tri.length] = {label: tripulantesCol[j].nombres+" "+tripulantesCol[j].apellidos, data: tripulantesCol[j].id};
				
			}
			if(tipotri=="pil"){

				cap[cap.length] = {label: tripulantesCol[j].nombres+" "+tripulantesCol[j].apellidos, data: tripulantesCol[j].id};
				
			}
			if(tipotri=="des"){

				desp[desp.length] = {label: tripulantesCol[j].nombres+" "+tripulantesCol[j].apellidos, data: tripulantesCol[j].id};
				
			}
			if(tipotri=="mec"){

				mec[mec.length] = {label: tripulantesCol[j].nombres+" "+tripulantesCol[j].apellidos, data: tripulantesCol[j].id};
				
			}

		}

	}
}	

public function sizeApp():void {
	_ancho = ExternalInterface.call("eval", "document.documentElement.clientWidth");
	_largo = ExternalInterface.call("eval", "document.documentElement.clientHeight");
	//trace("ancho: " + _ancho);
	//trace("largo: " + _largo);
	conIzq.height = _largo - 150;
	conCentral.height = _largo - 150;
	
}

public function iniciaRed():void{
	
	// inicializa el array de eventos y dibuja la red.
	this.iniciaEventos();
	this.dibujaRed();

}

public function dibujaRed():void{

	//Limpia el cuadro de eventos y redibuja todo, lineas y eventos
	contenido.removeAllChildren();
	contenido.addChild(tabla.drawTable(contenido.width));
	if(conCentral.verticalScrollPosition==0){
		conCentral.verticalScrollPosition = 60*30;
		conIzq.verticalScrollPosition = 60*30;
	}	
	this.drawEventos();
	this.drawMantenimientos();
	this.drawEntrenamientos();
}

public function isGlow(evt:Evento):Boolean{
	var status:int = evt.getStatus();
	var rpt:Boolean = false;
	
	if(status == 10){
		if(ger=='ope'){
			if(!evt.isListaOpeReady(0)){
				rpt=true;
			}
			else{
				rpt=false;
			}
		}
		if(ger=='man'){
			if(!evt.isListaManReady(0)){
				rpt=true;
			}
			else{
				rpt=false;
			}
		}
		if(ger=='seg'){
			if(!evt.isListaSegReady(0)){
				rpt=true;
			}
			else{
				rpt=false;
			}
		}
		
	}
	else if(status == 20){
		if(ger=='com'){
			rpt=true;
		}
		else{
			rpt=false;
		}
		
	}
	else if((status == 30) || (status == 15)){
		if(ger=='com'){
			rpt=true;
		}
		else{
			rpt=false;
		}
	}
	else if(status == 40){
		if(ger=='adm'){
			rpt=true;
		}
		else{
			rpt=false;
		}
		
	}
	else if(status == 50){

		if(ger=='ope'){
			if(!evt.isListaOpeReady(1)){
				rpt=true;
			}
			else{
				rpt=false;
			}
		}
		if(ger=='man'){
			if(!evt.isListaManReady(1)){
				rpt=true;
			}
			else{
				rpt=false;
			}
		}
		if(ger=='seg'){
			if(!evt.isListaSegReady(1)){
				rpt=true;
			}
			else{
				rpt=false;
			}
		}
		if(ger=='adm'){
			if(!evt.isListaAdmReady(1)){
				rpt=true;
			}
			else{
				rpt=false;
			}
		}
	}
	else if((status == 17) || (status == 100)){
		if(ger=='ope2'){
			rpt=true;
		}
		else{
			rpt=false;
		}
		
	}
	else{
		rpt = false;
	}
	
	return rpt;
}	


public function drawEventos():void{
	
	//dibuja todos los eventos en el array de eventos
	//array de eventos
	
	for(var i:int=0; i<eventos.length; i++){
		var evtx:Evento = eventos[i]; 
		if(evtx.validDate(aano,ames,adia)){
			contenido.addChild(evtx.draw(aano,ames,adia,contenido.width));
			//aqui le agregamos la sombra y brillo a los eventos
			evtx.efectosEvento(isGlow(evtx));
		}
	}
	
}

public function drawMantenimientos():void{

	//dibuja todos los eventos en el array de eventos
	//array de eventos
	
	for(var i:uint=0; i<mantenimientos.length; i++){
		var evtx:Evento = mantenimientos[i]; 
		if(evtx.validDate(aano,ames,adia)){
			contenido.addChild(evtx.draw(aano,ames,adia,contenido.width));
		}
	}
	
}

public function drawEntrenamientos():void{
	
	//dibuja todos los eventos en el array de eventos
	//array de eventos
	
	for(var i:uint=0; i<entrenamientos.length; i++){
		var evtx:Evento = entrenamientos[i]; 
		if(evtx.validDate(aano,ames,adia)){
			contenido.addChild(evtx.draw(aano,ames,adia,contenido.width));
		}
	}
	
}

public function dibujaFecha():void{
	
	//dibuja la columna de fecha de acuerdo al dia actual.
	//var a:int = int(globalSession[2]);
	//var m:int = int(globalSession[3])-1;
	//var d:int = int(globalSession[4]);
	//mx.controls.Alert.show(a.toString());
	contenidoIzq.addChild(tabla.drawFecha(aano,ames,adia));
	
}
public function dibujaHora():void{
	
	//dibuja la fila superior del titulo de la hora.
	//trace("El CONSUP: " + conSup.width);
	//trace("El contenidosup: " + contenidoSup.width);
	contenidoSup.addChild(tabla.drawHora(contenido.width));
	
}

public function dragScroll(e:ScrollEvent):void{
	
	// amarra el scroll central a la fila y columna de titulo.
	if(e.direction == ScrollEventDirection.VERTICAL){
		conIzq.verticalScrollPosition = e.position;
	}
	if(e.direction == ScrollEventDirection.HORIZONTAL){
		conSup.horizontalScrollPosition = e.position;
	}
	
}

//funciones para llamar a la ventana popup del nuevo evento
private function nuevoEvento():void
{
	//Crea un nuevo popup para añadir un evento
	ceWindow = PopUpManager.createPopUp(this,CrearEvento,true) as CrearEvento;
	PopUpManager.centerPopUp(ceWindow);
	ceWindow.title = "Nuevo Vuelo";
	ceWindow.fechaI.selectedDate = new Date(a,m,d);
	ceWindow.fechaF.selectedDate = new Date(a,m,d);
	ceWindow.addEventListener(CloseEvent.CLOSE,cierraNEVT);
}

private function nuevoEntrenamiento():void{
	capWin = PopUpManager.createPopUp(this,CrearEntrenamiento,true) as CrearEntrenamiento;
	PopUpManager.centerPopUp(capWin);
	capWin.title = "Nuevo Entrenamiento";
	capWin.fechaI.selectedDate = new Date(a,m,d);
	capWin.fechaF.selectedDate = new Date(a,m,d);
	capWin.addEventListener(CloseEvent.CLOSE,cierraEntrena);
}

private function cierraEntrena(e:Event):void{

	if(capWin.evento.text=="0000"){
		var ai:int = capWin.fechaI.selectedDate.getFullYear();
		var mei:int = capWin.fechaI.selectedDate.getMonth() +1;
		var di:int = capWin.fechaI.selectedDate.getDate();
		var hi:int = capWin.horaI.value;
		var mi:int = capWin.minI.value;
		
		var af:int = capWin.fechaF.selectedDate.getFullYear();
		var mef:int = capWin.fechaF.selectedDate.getMonth() +1;
		var df:int = capWin.fechaF.selectedDate.getDate();
		var hf:int = capWin.horaF.value;
		var mf:int = capWin.minF.value;
		
		var evtNuevo:Object = new Object();
		
		var evt:Evento = new Evento(ai,mei,di,hi,mi,af,mef,df,hf,mf);
		evt.setEntrenamiento();
		if(evt.draw(aano,ames,adia,contenido.width)!=null){
			var solapa:int = validEvent(evt);
			if(solapa==0 || solapa==2){
				if(solapa==2){
					Alert.show("Esta modificacion afecta eventos existentes");
				}
				evt.setDescripcion(capWin.descripcion.text);
				evtNuevo['wfcvuelo[tipo]'] = evt.getTipo().toString();
				evtNuevo['wfcvuelo[cabequipo_id]'] = equipoActual.toString();
				evtNuevo['wfcvuelo[anoini]'] = evt.getAnoIni().toString();
				evtNuevo['wfcvuelo[mesini]'] = evt.getMesIni().toString();
				evtNuevo['wfcvuelo[diaini]'] = evt.getDiaIni().toString();
				evtNuevo['wfcvuelo[horaini]'] = evt.getHorIni().toString();
				evtNuevo['wfcvuelo[minini]'] = evt.getMinIni().toString();
				evtNuevo['wfcvuelo[anofin]'] = evt.getAnoFin().toString();
				evtNuevo['wfcvuelo[mesfin]'] = evt.getMesFin().toString();
				evtNuevo['wfcvuelo[diafin]'] = evt.getDiaFin().toString();
				evtNuevo['wfcvuelo[horafin]'] = evt.getHorFin().toString();
				evtNuevo['wfcvuelo[minfin]'] = evt.getMinFin().toString();
				evtNuevo['wfcvuelo[operador]'] = 'Capacitacion';
				evtNuevo['wfcvuelo[origen]'] = evt.getOrigen();
				evtNuevo['wfcvuelo[destino]'] = evt.getDestino();
				evtNuevo['wfcvuelo[descripcion]'] = evt.getDescripcion();
				evtNuevo['wfcvuelo[status]'] = evt.getStatus();
				evtNuevo['wfcvuelo[capitan]'] = "0";
				evtNuevo['wfcvuelo[copiloto]'] = "0";
				evtNuevo['wfcvuelo[jefecab]'] = "0";
				evtNuevo['wfcvuelo[trip01]'] = "0";
				evtNuevo['wfcvuelo[trip02]'] = "0";
				evtNuevo['wfcvuelo[trip03]'] = "0";
				evtNuevo['wfcvuelo[desp]'] = "0";
				evtNuevo['wfcvuelo[mec]'] = "0";
				nuevoEventoBD.send(evtNuevo);
				PopUpManager.removePopUp(capWin);
				capWin = null;
			}
			else{
				capWin.log.text = "La fecha se solapa con un Evento existente. \n";
				capWin.evento.text = "9999";// reinicializo la variable de estado del popup
			}
		}
	}
	else{
		PopUpManager.removePopUp(capWin);
		capWin = null;
	}
}

private function nuevoMantenimiento():void{
	//Crea un nuevo popup para añadir un evento
	mWindow = PopUpManager.createPopUp(this,CrearMantenimiento,true) as CrearMantenimiento;
	PopUpManager.centerPopUp(mWindow);
	mWindow.title = "Nuevo Mantenimiento";
	mWindow.fechaI.selectedDate = new Date(a,m,d);
	mWindow.fechaF.selectedDate = new Date(a,m,d);
	mWindow.addEventListener(CloseEvent.CLOSE,cierraMTT);
}

private function buscarEvento(id:Number):Evento{
	
	for(var i:Number=0;i<eventos.length;i++){
		var aevt:Evento = eventos[i];
		var aid:Number = aevt.getId();
		if(aid==id){
			return eventos[i];
		}
	}
	return null;
}

private function buscarMantenimiento(id:Number):Evento{
	
	for(var i:Number=0;i<mantenimientos.length;i++){
		var aevt:Evento = mantenimientos[i];
		var aid:Number = aevt.getId();
		if(aid==id){
			return mantenimientos[i];
		}
	}
	return null;
}

private function buscarEntrenamiento(id:Number):Evento{
	
	for(var i:Number=0;i<entrenamientos.length;i++){
		var aevt:Evento = entrenamientos[i];
		var aid:Number = aevt.getId();
		if(aid==id){
			return entrenamientos[i];
		}
	}
	return null;
}


private function buscarPosEvento(id:Number):int{
	
	for(var i:int=0;i<eventos.length;i++){
		var aevt:Evento = eventos[i];
		var aid:Number = aevt.getId();
		if(aid==id){
			return i;
		}
	}
	return -1;
}

private function buscarPosMantenimiento(id:Number):int{
	
	for(var i:int=0;i<mantenimientos.length;i++){
		var aevt:Evento = mantenimientos[i];
		var aid:Number = aevt.getId();
		if(aid==id){
			return i;
		}
	}
	return -1;
}

private function buscarPosEntrenamiento(id:Number):int{
	
	for(var i:int=0;i<entrenamientos.length;i++){
		var aevt:Evento = entrenamientos[i];
		var aid:Number = aevt.getId();
		if(aid==id){
			return i;
		}
	}
	return -1;
}


private function editarMantenimiento(e:Event):void{
	var id:Number = parseInt(e.currentTarget.id);
	var evt:Evento = buscarMantenimiento(id);
	if(ger=='man'){
		if(evt!= null){
			mWindow = PopUpManager.createPopUp(this,CrearMantenimiento,true) as CrearMantenimiento;
			PopUpManager.centerPopUp(mWindow);
			mWindow.title = "Editar Mantenimiento";
			mWindow.fechaI.selectedDate = new Date(evt.getAnoIni(),evt.getMesIni()-1,evt.getDiaIni());
			mWindow.fechaF.selectedDate = new Date(evt.getAnoFin(),evt.getMesFin()-1,evt.getDiaFin());
			mWindow.horaI.value = evt.getHorIni();
			mWindow.minI.value = evt.getMinIni();
			mWindow.horaF.value = evt.getHorFin();
			mWindow.minF.value = evt.getMinFin();
			if(evt.getStatus()==0){
				mWindow.tipoMant.selectedValue="Programado";
			}
			else{
				mWindow.tipoMant.selectedValue="No Programado";
			}
			mWindow.descripcion.text = evt.getDescripcion();
			mWindow.btBorrar.visible = true;
			mWindow.addEventListener(CloseEvent.CLOSE,function(e:CloseEvent):void{cierraEditarMantenimiento(e,id)});
			}
	}
	else{
		var cont:String;
		cont='Desde: '+evt.rellCeros(evt.getDiaIni())+'/'+evt.rellCeros(evt.getMesIni())+'/'+evt.rellCeros(evt.getAnoIni())+'-'+evt.rellCeros(evt.getHorIni())+':'+evt.rellCeros(evt.getMinIni())+'\n';
		cont=cont+'Hasta: '+evt.rellCeros(evt.getDiaFin())+'/'+evt.rellCeros(evt.getMesFin())+'/'+evt.rellCeros(evt.getAnoFin())+'-'+evt.rellCeros(evt.getHorFin())+':'+evt.rellCeros(evt.getMinFin())+'\n';
		cont=cont+evt.getDescripcion();
		Alert.show(cont,'Mantenimiento');
	}
}

private function editarEntrenamiento(e:Event):void{
	var id:Number = parseInt(e.currentTarget.id);
	var evt:Evento = buscarEntrenamiento(id);
	if(ger=='cap'){
		if(evt!= null){
			capWin = PopUpManager.createPopUp(this,CrearEntrenamiento,true) as CrearEntrenamiento;
			PopUpManager.centerPopUp(capWin);
			capWin.title = "Editar Entrenamiento";
			capWin.fechaI.selectedDate = new Date(evt.getAnoIni(),evt.getMesIni()-1,evt.getDiaIni());
			capWin.fechaF.selectedDate = new Date(evt.getAnoFin(),evt.getMesFin()-1,evt.getDiaFin());
			capWin.horaI.value = evt.getHorIni();
			capWin.minI.value = evt.getMinIni();
			capWin.horaF.value = evt.getHorFin();
			capWin.minF.value = evt.getMinFin();
			capWin.descripcion.text = evt.getDescripcion();
			capWin.btBorrar.visible = true;
			capWin.addEventListener(CloseEvent.CLOSE,function(e:CloseEvent):void{cierraEditarEntrenamiento(e,id)});
		}
	}
	else
	{
		var cont:String;
		cont='Desde: '+evt.rellCeros(evt.getDiaIni())+'/'+evt.rellCeros(evt.getMesIni())+'/'+evt.rellCeros(evt.getAnoIni())+'-'+evt.rellCeros(evt.getHorIni())+':'+evt.rellCeros(evt.getMinIni())+'\n';
		cont=cont+'Hasta: '+evt.rellCeros(evt.getDiaFin())+'/'+evt.rellCeros(evt.getMesFin())+'/'+evt.rellCeros(evt.getAnoFin())+'-'+evt.rellCeros(evt.getHorFin())+':'+evt.rellCeros(evt.getMinFin())+'\n';
		cont=cont+evt.getDescripcion();
		Alert.show(cont,'Capacitacion');
	}
}
private function buscaIndex(arr:Array, elem:int):int{
	var index:int = -1;
	for(var i:int=0; i<arr.length;i++){
		if(arr[i].data == elem.toString()){
			index = i;
			break;
		}
	}
	return index;
	
} 

private function showInfo(e:Evento,usr:String):void{
	var id:Number;
	iWin = PopUpManager.createPopUp(this,Informacion,true) as Informacion;
	PopUpManager.centerPopUp(iWin);
	id = e.getId();
	var status:int = e.getStatus();
	
	if(usr == 'ope2'){
		iWin.btModif.enabled = true;
		if(status != 15 && status != 17){
			iWin.btnNegar.enabled = true;	
		}
		if(status == 15){
			iWin.btModif.enabled = false;
		}
	}
	if(e.existComments()){
		iWin.btLogs.enabled = true;
	}
	if(usr == 'com'){
		iWin.btModif.enabled = true;
		
		if(status != 15 && status != 17){
				iWin.btnNegar.enabled = true;	
			}
	}
	/*
	if(usr == 'ope'){
		//iWin.btModif.enabled = true;
		//los despachadores pueden modificar el vuelo ????
	}
	*/
	iWin.lOrigen.text = e.getOrigen();
	iWin.lDestino.text = e.getDestino();
	iWin.operador.text = e.getOperador();
	iWin.nrovuelo.text = e.getnroVuelo();
	iWin.lFInicio.text = e.rellCeros(e.getDiaIni())+"/"+e.rellCeros(e.getMesIni())+"/"+e.getAnoIni();
	iWin.lHInicio.text = e.rellCeros(e.getHorIni())+":"+e.rellCeros(e.getMinIni());
	iWin.lFCulmina.text = e.rellCeros(e.getDiaFin())+"/"+e.rellCeros(e.getMesFin())+"/"+e.getAnoFin();
	iWin.lHCulmina.text = e.rellCeros(e.getHorFin())+":"+e.rellCeros(e.getMinFin());
	iWin.descripcion.text = e.getDescripcion();
	if(status==15){
		iWin.lFase.text = "El Vuelo se Encuentra Cancelado.";
		iWin.lEspera0.text = "El Vuelo fue cancelado por:"+e.getUserCancel();
		iWin.lEspera1.text = "Razon: "+e.getTxtCancel();
		iWin.lEspera2.text = "El vuelo esta esperando revision de Gerencia Comercial";
	}
	else if(status==17){
		iWin.lFase.text = "El Vuelo se Encuentra Cancelado.";
		iWin.lEspera0.text = "El Vuelo fue cancelado por:"+e.getUserCancel();
		iWin.lEspera1.text = "Razon: "+e.getTxtCancel();
		iWin.lEspera2.text = "El vuelo esta marcado para borrarlo";
		iWin.lEspera3.text = "Esperando borrado por Gerencia Operaciones";
	}
	else if((status<50) && (status != 15) && (status != 17)){
		iWin.lFase.text = "Vuelo activo en fase de Solicitud";
		if(status==10){
			if(e.isListaOpeReady(0)){
				iWin.lEspera0.text = "Operaciones Listo";
				//cambia color del label azul
				iWin.lEspera0.setStyle('color',0x0000ff);
			}
			else{
				iWin.lEspera0.text = "Esperando por Operaciones";
			}
			if(e.isListaManReady(0)){
				iWin.lEspera1.text = "Mantenimiento Listo";
				//cambia color del label azul
				iWin.lEspera1.setStyle('color',0x0000ff);
			}
			else{
				iWin.lEspera1.text = "Esperando por Mantenimiento";
			}
			if(e.isListaSegReady(0)){
				iWin.lEspera2.text = "Seguridad Listo";
				//cambia color del label azul
				iWin.lEspera2.setStyle('color',0x0000ff);
			}
			else{
				iWin.lEspera2.text = "Esperando por Seguridad";
			}
		}
		else if(status == 40){
			iWin.lEspera0.text = "Esperando por Administracion";
		}
		else if(status == 20 || status == 30){
			iWin.lEspera0.text = "Esperando por Comercial";
		}
		else{
			iWin.lEspera0.text = "Status solicitud desconocido";
		}
	}
	else{
		iWin.lFase.text = "Vuelo activo en fase de Preparacion";
		//cambia color del label azul
		iWin.lFase.setStyle('color',0x0000ff);
		
		if(status == 50){
			if(e.isListaOpeReady(1)){
				iWin.lEspera0.text = "Operaciones Listo";
				//cambia color del label azul
				iWin.lEspera0.setStyle('color',0x0000ff);
				iWin.btTripul.enabled = true;
			}
			else{
				iWin.lEspera0.text = "Esperando por Operaciones";
			}
			if(e.isListaManReady(1)){
				iWin.lEspera1.text = "Mantenimiento Listo";
				//cambia color del label azul
				iWin.lEspera1.setStyle('color',0x0000ff);
			}
			else{
				iWin.lEspera1.text = "Esperando por Mantenimiento";
			}
			if(e.isListaSegReady(1)){
				iWin.lEspera2.text = "Seguridad Listo";
				//cambia color del label azul
				iWin.lEspera2.setStyle('color',0x0000ff);
			}
			else{
				iWin.lEspera2.text = "Esperando por Seguridad";
			}
			if(e.isListaAdmReady(1)){
				iWin.lEspera3.text = "Administracion Listo";
				//cambia color del label azul
				iWin.lEspera3.setStyle('color',0x0000ff);
			}
			else{
				iWin.lEspera3.text = "Esperando por Administracion";
			}
			
		}
		else if(status == 100){
			iWin.lEspera0.text = "Esperando Autorizacion Gerencia Operaciones";
			iWin.btTripul.enabled = true;
		}
		else if(status == 110){
			iWin.lEspera0.text = "El Vuelo esta listo para despegar";
				//cambia color del label azul
				iWin.lEspera0.setStyle('color',0x0000ff);
				iWin.btTripul.enabled = true;
		}
		else{
			iWin.lEspera0.text = "Status de ejecucion desconocido";
		}
	}
	
	
	iWin.addEventListener(CloseEvent.CLOSE,function(e:CloseEvent):void{closeInfo(id)});	
	
}
private function closeInfo(id:Number):void{
	var accion:String;
	accion = iWin.evento.text
	if(accion == '5555'){
		modifEvento(id);
	}
	if(accion == '2000'){
		//verlistas
	}
	if(accion == '2001'){
		verLogs(id);
	}
	if(accion == '2002'){
		verTripuls(id);
	}
	if(accion == '9999'){
		var evt:Evento = buscarEvento(id);
		var evtUpdate:Object = new Object();
			evt.setStatus(15);
			evt.setListaOpe('pppppp',0);
			evt.setListaMan('pppppp',0);
			evt.setListaSeg('pppppp',0);
			evt.setListaAdm('pppppp',0);
			evt.setListaOpe('pppppp',1);
			evt.setListaMan('pppppp',1);
			evt.setListaSeg('pppppp',1);
			evt.setListaAdm('pppppp',1);
			evt.setCap(0);
			evt.setCop(0);
			evt.setJcab(0);
			evt.setTri1(0);
			evt.setTri2(0);
			evt.setTri3(0);
			evt.setDesp(0);
			evt.setMec(0);
			evt.setUserCancel(login);
			evt.setTxtCancel(iWin.jText.text);
			evtUpdate['id'] = evt.getId().toString();
			evtUpdate['wfcvuelo[capitan]'] = evt.getCap().toString();
			evtUpdate['wfcvuelo[copiloto]'] = evt.getCop().toString();
			evtUpdate['wfcvuelo[jefecab]'] = evt.getJcab().toString();
			evtUpdate['wfcvuelo[trip01]'] = evt.getTri1().toString();
			evtUpdate['wfcvuelo[trip02]'] = evt.getTri2().toString();
			evtUpdate['wfcvuelo[trip03]'] = evt.getTri3().toString();
			evtUpdate['wfcvuelo[desp]'] = evt.getDesp().toString();
			evtUpdate['wfcvuelo[mec]'] = evt.getMec().toString();
			evtUpdate['wfcvuelo[status]'] = evt.getStatus().toString();
			evtUpdate['wfcvuelo[opesol]'] = evt.getListaOpe(0);
			evtUpdate['wfcvuelo[opeeje]'] = evt.getListaOpe(1);
			evtUpdate['wfcvuelo[opesoltxt]'] = evt.getTxtOpe(0);
			evtUpdate['wfcvuelo[opeejetxt]'] = evt.getTxtOpe(1);
			evtUpdate['wfcvuelo[mansol]'] = evt.getListaMan(0);
			evtUpdate['wfcvuelo[maneje]'] = evt.getListaMan(1);
			evtUpdate['wfcvuelo[mansoltxt]'] = evt.getTxtMan(0);
			evtUpdate['wfcvuelo[manejetxt]'] = evt.getTxtMan(1);
			evtUpdate['wfcvuelo[segsol]'] = evt.getListaSeg(0);
			evtUpdate['wfcvuelo[segeje]'] = evt.getListaSeg(1);
			evtUpdate['wfcvuelo[segsoltxt]'] = evt.getTxtSeg(0);
			evtUpdate['wfcvuelo[segejetxt]'] = evt.getTxtSeg(1);
			evtUpdate['wfcvuelo[admsol]'] = evt.getListaAdm(0);
			evtUpdate['wfcvuelo[admeje]'] = evt.getListaAdm(1);
			evtUpdate['wfcvuelo[admsoltxt]'] = evt.getTxtAdm(0);
			evtUpdate['wfcvuelo[admejetxt]'] = evt.getTxtAdm(1);
			evtUpdate['wfcvuelo[usercancel]'] = evt.getUserCancel();
			evtUpdate['wfcvuelo[txtcancel]'] = evt.getTxtCancel();
			updateEvento.send(evtUpdate);
	}
		PopUpManager.removePopUp(iWin);
		iWin = null;
}

private function verTripuls(oid:Number):void{
	var id:Number = oid;
	var evt:Evento = buscarEvento(id);
	if(evt!=null){
		tWin = PopUpManager.createPopUp(this,VerTripulantes,true) as VerTripulantes;
		PopUpManager.centerPopUp(tWin);
		tWin.cap.text = buscarTripul(evt.getCap());
		tWin.cop.text = buscarTripul(evt.getCop());
		tWin.jcab.text = buscarTripul(evt.getJcab());
		tWin.tri2.text = buscarTripul(evt.getTri1());
		tWin.tri3.text = buscarTripul(evt.getTri2());
		tWin.tri4.text = buscarTripul(evt.getTri3());
		tWin.desp.text = buscarTripul(evt.getDesp());
		tWin.mec.text = buscarTripul(evt.getMec());
		tWin.addEventListener(CloseEvent.CLOSE,cierraTripuls);
	}
	
}

private function cierraTripuls(e:CloseEvent):void{
	
	PopUpManager.removePopUp(tWin);
	tWin = null;		
	
}

private function buscarTripul(id:Number):String{
	
	var nombres:String = "Ninguno";
	
	for(var j:int=0;j<tripulantesCol.length;j++){

		if(tripulantesCol[j].id == id){		
			nombres=tripulantesCol[j].nombres+" "+tripulantesCol[j].apellidos;
			break;
		}

	}
	return nombres;
}


private function verLogs(oid:Number):void{
	var id:Number = oid;
	var evt:Evento = buscarEvento(id);
	if(evt!= null){
		vlWin = PopUpManager.createPopUp(this,Verlogs,true) as Verlogs;
		PopUpManager.centerPopUp(vlWin);
		vlWin.copesol.text = evt.getTxtOpe(0);
		vlWin.cmansol.text = evt.getTxtMan(0);
		vlWin.csegsol.text = evt.getTxtSeg(0);
		vlWin.clog.text = evt.getLog();
		vlWin.copeeje.text = evt.getTxtOpe(1);
		vlWin.cmaneje.text = evt.getTxtMan(1);
		vlWin.csegeje.text = evt.getTxtSeg(1);
		vlWin.cadmeje.text = evt.getTxtAdm(1);
		if(ger=='ope2' && evt.getStatus()<50){
			vlWin.copesol.editable = true;
		}
		vlWin.addEventListener(CloseEvent.CLOSE,function(e:CloseEvent):void{cierraVerLogs(id)});
		}
}

private function cierraVerLogs(oid:Number):void{
	var id:Number = oid;
	var evt:Evento = buscarEvento(id);
	if (vlWin.copesol.text != evt.getTxtOpe(0)){
		evt.setTxtOpe(vlWin.copesol.text,0);
		var evtUpdate:Object = new Object();
		evtUpdate['id'] = evt.getId().toString();
		evtUpdate['wfcvuelo[opesoltxt]'] = evt.getTxtOpe(0);
		updateEvento.send(evtUpdate);
		
	}
	PopUpManager.removePopUp(vlWin);
	vlWin = null;
}

private function editEvento(e:Event):void{ //cola de mensajes principal para procesar el comportamiento de clicks sobre eventos

	var id:Number = parseInt(e.currentTarget.id);
	var evt:Evento = buscarEvento(id);
	var status:int = evt.getStatus();
	
	if(ger=='vic'){
		showInfo(evt,ger);
	}
	else if(ger == "com"){
		//comercial afecta el proceso en el paso 0 al iniciarlo y en el status 30 despues de administracion
		//para verificar la aceptacion por parte del cliente de vuelo.
		if(evt.getStatus()==30 || evt.getStatus()==20){
			iniciarConfirmacion(evt);
		}
		else if(evt.getStatus()==15){
			modifEvento(id);
		}
		else{
			showInfo(evt,ger);
		}
	}
	else if(ger == "man"){
		//mantenimiento afecta al proceso en el status 10 y status 50 para su lista de chequeo
		if(evt.getStatus()==10 && !evt.isListaManReady(0)){
			listaChMan(evt,0);
		}
		else if(evt.getStatus()==50 && !evt.isListaManReady(1)){
			listaChMan(evt,1);
		}
		else{
			showInfo(evt,ger);
		}
	}
	else if(ger == "ope"){
		//operaciones afecta al proceso en el status 10 y el status 50 para su lista de chequeo
		if(evt.getStatus()==10 && !evt.isListaOpeReady(0)){
			listaChOpe(evt,0);
		}
		else if(evt.getStatus()==50 && !evt.isListaOpeReady(1)){
			listaChOpe(evt,1);
		}
		else{
			showInfo(evt,ger);
		}
	}
	else if(ger == "ope2"){
		//operaciones2 supervisor afecta al proceso en el status 100 para autorizar el vuelo
		if(evt.getStatus()==17){
			modifEvento(id);
		}
		else if(evt.getStatus()==100){
			iniciarConfirmacion(evt);
		}
		else{
			showInfo(evt,ger);
		}
	}
	else if(ger == "adm"){
		//administracion afecta el proceso en los status 20,40,50
		//para enviar la cotizacion, confirmar el pago inicial y la lista de cheque de la ejecucion
		if(evt.getStatus()==40){
			iniciarConfirmacion(evt);
		}
		else if(evt.getStatus()==50 && !evt.isListaAdmReady(1)){
			listaChAdm(evt,1);
		}
		else{
			showInfo(evt,ger);
		}
	}
	else if(ger == "seg"){
		//seguridad afecta el proceso en el paso 10 y 100 para sus listas de chequeo
		if(evt.getStatus()==10 && !evt.isListaSegReady(0)){
			listaChSeg(evt,0);
		}
		else if(evt.getStatus()==50 && !evt.isListaSegReady(1)){
			listaChSeg(evt,1);
		}
		else{
			showInfo(evt,ger);
		}
	}
	else if(ger == "tec",ger){
		//solo puede ver ...
		showInfo(evt,ger);
		
	}
}

private function iniciarConfirmacion(e:Evento):void{
	
	var status:int = e.getStatus();
	var id:Number = e.getId();
	cWin = PopUpManager.createPopUp(this,Confirmacion,true) as Confirmacion;
	PopUpManager.centerPopUp(cWin);
	cWin.evento.text = "1111";
	cWin.chkb.label = "Llamar a soporte";
	
	
	if(status==20){
		//confirmacion administracion envio de cotizacion.
		cWin.chkb.label = "La cotizacion ya fue hecha y enviada.";
		
		if(e.getTxtOpe(0).length>0 || e.getTxtMan(0).length>0 || e.getTxtSeg(0).length>0){
			cWin.btVerLog.enabled = true;
			cWin.txtlog = '';
			if(e.getTxtOpe(0).length>0){
				cWin.txtlog = 'Operaciones: '+e.getTxtOpe(0);
			}
			if(e.getTxtMan(0).length>0){
				cWin.txtlog = cWin.txtlog+'\n'+'Mantenimiento: '+e.getTxtMan(0);
			}
			if(e.getTxtSeg(0).length>0){
				cWin.txtlog = cWin.txtlog+'\n'+'Seguridad: '+e.getTxtSeg(0);
			}
		}
	}
	if(status==30){
		//Comercial verifica la aceptacion del vuelo.
		cWin.chkb.label = "El Cliente acepto el vuelo.";
		if(e.getLog().length>0){
			cWin.btVerLog.enabled = true;
			cWin.txtlog = e.getLog();
		}
	}
	if(status==40){
		//Administracion verifica la firma del contrato.
		cWin.chkb.label = "Ya el contrato ha sido firmado.";
		if(e.getLog().length>0){
			cWin.btVerLog.enabled = true;
			cWin.txtlog = e.getLog();
		}
	}
	if(status==100){
		//supervisor de operaciones pone el vuelo en go.
		if(e.getTxtOpe(1).length>0 || e.getTxtMan(1).length>0 || e.getTxtSeg(1).length>0){
			cWin.btVerLog.enabled = true;
			cWin.txtlog = '';
			if(e.getTxtOpe(1).length>0){
				cWin.txtlog = 'Operaciones: '+e.getTxtOpe(1);
			}
			if(e.getTxtMan(1).length>0){
				cWin.txtlog = cWin.txtlog+'\n'+'Mantenimiento: '+e.getTxtMan(1);
			}
			if(e.getTxtSeg(1).length>0){
				cWin.txtlog = cWin.txtlog+'\n'+'Seguridad: '+e.getTxtSeg(1);
			}
			if(e.getTxtAdm(1).length>0){
				cWin.txtlog = cWin.txtlog+'\n'+'Administracion: '+e.getTxtAdm(1);
			}
		}
		cWin.chkb.label = "El Avion esta listo para despegar.";
	}


	cWin.addEventListener(CloseEvent.CLOSE,function(e:CloseEvent):void{cierraConfirmacion(id)});	
	
}

private function cierraConfirmacion(id:Number):void{

	var evt:Evento = buscarEvento(id);
	var status:int = evt.getStatus();

	if(cWin.evento.text=='0000' || cWin.evento.text=='9999'){
		
		var evtUpdate:Object = new Object();
		
		if(cWin.tComent.text.length>0){
			var ll:String='';
			if (evt.getLog().length>0){
				ll=evt.getLog();
			}
			evt.setLog(ll+' - '+cWin.tComent.text);		
		}

		if(cWin.evento.text=='9999'){
			//marco el evento para cancelarlo.
			evt.setStatus(15);
			evt.setListaOpe('pppppp',0);
			evt.setListaMan('pppppp',0);
			evt.setListaSeg('pppppp',0);
			evt.setListaAdm('pppppp',0);
			evt.setListaOpe('pppppp',1);
			evt.setListaMan('pppppp',1);
			evt.setListaSeg('pppppp',1);
			evt.setListaAdm('pppppp',1);
			evt.setCap(0);
			evt.setCop(0);
			evt.setJcab(0);
			evt.setTri1(0);
			evt.setTri2(0);
			evt.setTri3(0);
			evt.setDesp(0);
			evt.setMec(0);
			evt.setUserCancel(login+':'+ger);
			evt.setTxtCancel(cWin.tjusti.text);
		}
		else{
			if(status == 20){
				evt.setStatus(40);
			}
			if(status == 30){
				evt.setStatus(40);
			}
			if(status == 40){
				evt.setStatus(50);
			}
			if(status == 100){
				evt.setStatus(110);
			}
			
			
		}
		evtUpdate['id'] = evt.getId().toString();
		evtUpdate['wfcvuelo[capitan]'] = evt.getCap().toString();
		evtUpdate['wfcvuelo[copiloto]'] = evt.getCop().toString();
		evtUpdate['wfcvuelo[jefecab]'] = evt.getJcab().toString();
		evtUpdate['wfcvuelo[trip01]'] = evt.getTri1().toString();
		evtUpdate['wfcvuelo[trip02]'] = evt.getTri2().toString();
		evtUpdate['wfcvuelo[trip03]'] = evt.getTri3().toString();
		evtUpdate['wfcvuelo[desp]'] = evt.getDesp().toString();
		evtUpdate['wfcvuelo[mec]'] = evt.getMec().toString();
		evtUpdate['wfcvuelo[status]'] = evt.getStatus().toString();
		evtUpdate['wfcvuelo[opesol]'] = evt.getListaOpe(0);
		evtUpdate['wfcvuelo[mansol]'] = evt.getListaMan(0);
		evtUpdate['wfcvuelo[segsol]'] = evt.getListaSeg(0);
		evtUpdate['wfcvuelo[admsol]'] = evt.getListaAdm(0);
		evtUpdate['wfcvuelo[opeeje]'] = evt.getListaOpe(1);
		evtUpdate['wfcvuelo[maneje]'] = evt.getListaMan(1);
		evtUpdate['wfcvuelo[segeje]'] = evt.getListaSeg(1);
		evtUpdate['wfcvuelo[admeje]'] = evt.getListaAdm(1);
		evtUpdate['wfcvuelo[opesoltxt]'] = evt.getTxtOpe(0);
		evtUpdate['wfcvuelo[mansoltxt]'] = evt.getTxtMan(0);
		evtUpdate['wfcvuelo[segsoltxt]'] = evt.getTxtSeg(0);
		evtUpdate['wfcvuelo[admsoltxt]'] = evt.getTxtAdm(0);
		evtUpdate['wfcvuelo[opeejetxt]'] = evt.getTxtOpe(1);
		evtUpdate['wfcvuelo[manejetxt]'] = evt.getTxtMan(1);
		evtUpdate['wfcvuelo[segejetxt]'] = evt.getTxtSeg(1);
		evtUpdate['wfcvuelo[admejetxt]'] = evt.getTxtAdm(1);
		evtUpdate['wfcvuelo[usercancel]'] = evt.getUserCancel();
		evtUpdate['wfcvuelo[txtcancel]'] = evt.getTxtCancel();
		evtUpdate['wfcvuelo[log]'] = evt.getLog();

		updateEvento.send(evtUpdate);
				
	}
	
	if(cWin.evento.text == "2001"){
		//abro la ventana de informacion
		showInfo(evt,ger);
	}
	
	PopUpManager.removePopUp(cWin);
	cWin = null;		

	
}


private function listaChOpe(evt:Evento,t:int):void{
	var id:int = evt.getId();
	lWin = PopUpManager.createPopUp(this,ListaChequeo,true) as ListaChequeo;
	PopUpManager.centerPopUp(lWin);



	if(t==0){
		lWin.title = "Lista Chequeo Operaciones - Solicitud";
		lWin.cCap.enabled = false;
		lWin.cCop.enabled = false;
		lWin.cJcab.enabled = false;
		lWin.cTrip1.enabled = false;
		lWin.cTrip2.enabled = false;
		lWin.cTrip3.enabled = false;
		lWin.cMec.enabled = false;
		lWin.cDesp.enabled = false;
		lWin.rcap.enabled = false;
		lWin.rcop.enabled = false;
		lWin.rjcab.enabled = false;
		lWin.rtri1.enabled = false;
		lWin.rtri2.enabled = false;
		lWin.rtri3.enabled = false;
		lWin.rdesp.enabled = false;
		lWin.rmec.enabled = false;
		lWin.editFH.enabled = true;
		lWin.nrovuelo.enabled = true;
	}
	else{
		lWin.title = "Lista Chequeo Operaciones - Preparacion";

		lWin.cCap.dataProvider = cap;
		lWin.cCap.selectedIndex = buscaIndex(cap,evt.getCap());
		lWin.cCop.dataProvider = cap;
		lWin.cCop.selectedIndex = buscaIndex(cap,evt.getCop());
		lWin.cJcab.dataProvider = tri;
		lWin.cJcab.selectedIndex = buscaIndex(tri,evt.getJcab());
		lWin.cTrip1.dataProvider = tri;
		lWin.cTrip1.selectedIndex = buscaIndex(tri,evt.getTri1());
		lWin.cTrip2.dataProvider = tri;
		lWin.cTrip2.selectedIndex = buscaIndex(tri,evt.getTri2());
		lWin.cTrip3.dataProvider = tri;
		lWin.cTrip3.selectedIndex = buscaIndex(tri,evt.getTri3());
		lWin.cDesp.dataProvider = desp;
		lWin.cDesp.selectedIndex = buscaIndex(desp,evt.getDesp());
		lWin.cMec.dataProvider = mec;
		lWin.cMec.selectedIndex = buscaIndex(mec,evt.getMec());
		lWin.editFH.enabled = false;
		lWin.nrovuelo.enabled = true;

	}
	var num:int = evt.getNumOpe(t);
	lWin.lFecha.text = evt.getDiaIni()+"/"+evt.getMesIni()+"/"+evt.getAnoIni()+"-"+evt.getHorIni()+":"+evt.getMinIni()+" - "+evt.getDiaFin()+"/"+evt.getMesFin()+"/"+evt.getAnoFin()+"-"+evt.getHorFin()+":"+evt.getMinFin();
	lWin.lRuta.text = evt.getOrigen()+"/"+evt.getDestino();
	lWin.descripcion.text = evt.getDescripcion();
	lWin.nrovuelo.text = evt.getnroVuelo();
	lWin.evento.text='1111';
	lWin.ch1.visible=false;
	lWin.ch2.visible=false;
	lWin.ch3.visible=false;
	lWin.ch4.visible=false;
	lWin.ch5.visible=false;
	lWin.ch6.visible=false;
	lWin.txtProceso.text = evt.getTxtOpe(t);
	for(var i:int=1;i<=num;i++){
		if(i==1){
			lWin.ch1.visible=true;
			lWin.ch1.label = evt.getTexListaOpe(i,t);
			lWin.ch1.selected=evt.getItemListaOpe(i,t);
			if(t==1){
				lWin.ch1.enabled = false;
			}
			lWin.verifTripul();
		}
		if(i==2){
			lWin.ch2.visible=true;
			lWin.ch2.label = evt.getTexListaOpe(i,t);
			lWin.ch2.selected=evt.getItemListaOpe(i,t);
		}
		if(i==3){
			lWin.ch3.visible=true;
			lWin.ch3.label = evt.getTexListaOpe(i,t);
			lWin.ch3.selected=evt.getItemListaOpe(i,t);
		}
		if(i==4){
			lWin.ch4.visible=true;
			lWin.ch4.label = evt.getTexListaOpe(i,t);
			lWin.ch4.selected=evt.getItemListaOpe(i,t);
		}
		if(i==5){
			lWin.ch5.visible=true;
			lWin.ch5.label = evt.getTexListaOpe(i,t);
			lWin.ch5.selected=evt.getItemListaOpe(i,t);
		}
		if(i==6){
			lWin.ch6.visible=true;
			lWin.ch6.label = evt.getTexListaOpe(i,t);
			lWin.ch6.selected=evt.getItemListaOpe(i,t);
		}
	}
	lWin.addEventListener(CloseEvent.CLOSE,function(e:CloseEvent):void{cierraListaCH(id)});	
}


private function listaChMan(evt:Evento,t:int):void{
	var id:int = evt.getId();
	lWin = PopUpManager.createPopUp(this,ListaChequeo,true) as ListaChequeo;
	PopUpManager.centerPopUp(lWin);
	
	lWin.cCap.enabled = false;
	lWin.cCop.enabled = false;
	lWin.cJcab.enabled = false;
	lWin.cTrip1.enabled = false;
	lWin.cTrip2.enabled = false;
	lWin.cTrip3.enabled = false;
	lWin.cMec.enabled = false;
	lWin.cDesp.enabled = false;
	lWin.rcap.enabled = false;
	lWin.rcop.enabled = false;
	lWin.rjcab.enabled = false;
	lWin.rtri1.enabled = false;
	lWin.rtri2.enabled = false;
	lWin.rtri3.enabled = false;
	lWin.rdesp.enabled = false;
	lWin.rmec.enabled = false;
	lWin.editFH.enabled = false;

	
	if(t==0){
		lWin.title = "Lista Chequeo Mantenimiento - Solicitud";
	}
	else{
		lWin.title = "Lista Chequeo Mantenimiento - Preparacion";
	}
	var num:int = evt.getNumMan(t);
	lWin.lFecha.text = evt.getDiaIni()+"/"+evt.getMesIni()+"/"+evt.getAnoIni()+"-"+evt.getHorIni()+":"+evt.getMinIni()+" - "+evt.getDiaFin()+"/"+evt.getMesFin()+"/"+evt.getAnoFin()+"-"+evt.getHorFin()+":"+evt.getMinFin();
	lWin.lRuta.text = evt.getOrigen()+"/"+evt.getDestino();
	lWin.descripcion.text = evt.getDescripcion();
	lWin.evento.text='1111';
	lWin.ch1.visible=false;
	lWin.ch2.visible=false;
	lWin.ch3.visible=false;
	lWin.ch4.visible=false;
	lWin.ch5.visible=false;
	lWin.ch6.visible=false;
	lWin.txtProceso.text = evt.getTxtMan(t);
	for(var i:int=1;i<=num;i++){
		if(i==1){
			lWin.ch1.visible=true;
			lWin.ch1.label = evt.getTexListaMan(i,t);
			lWin.ch1.selected=evt.getItemListaMan(i,t);
		}
		if(i==2){
			lWin.ch2.visible=true;
			lWin.ch2.label = evt.getTexListaMan(i,t);
			lWin.ch2.selected=evt.getItemListaMan(i,t);
		}
		if(i==3){
			lWin.ch3.visible=true;
			lWin.ch3.label = evt.getTexListaMan(i,t);
			lWin.ch3.selected=evt.getItemListaMan(i,t);
		}
		if(i==4){
			lWin.ch4.visible=true;
			lWin.ch4.label = evt.getTexListaMan(i,t);
			lWin.ch4.selected=evt.getItemListaMan(i,t);
		}
		if(i==5){
			lWin.ch5.visible=true;
			lWin.ch5.label = evt.getTexListaMan(i,t);
			lWin.ch5.selected=evt.getItemListaMan(i,t);
		}
		if(i==6){
			lWin.ch6.visible=true;
			lWin.ch6.label = evt.getTexListaMan(i,t);
			lWin.ch6.selected=evt.getItemListaMan(i,t);
		}
	}
	lWin.addEventListener(CloseEvent.CLOSE,function(e:CloseEvent):void{cierraListaCH(id)});	
}


private function listaChSeg(evt:Evento,t:int):void{
	var id:int = evt.getId();
	lWin = PopUpManager.createPopUp(this,ListaChequeo,true) as ListaChequeo;
	PopUpManager.centerPopUp(lWin);

	lWin.cCap.enabled = false;
	lWin.cCop.enabled = false;
	lWin.cJcab.enabled = false;
	lWin.cTrip1.enabled = false;
	lWin.cTrip2.enabled = false;
	lWin.cTrip3.enabled = false;
	lWin.cMec.enabled = false;
	lWin.cDesp.enabled = false;
	lWin.rcap.enabled = false;
	lWin.rcop.enabled = false;
	lWin.rjcab.enabled = false;
	lWin.rtri1.enabled = false;
	lWin.rtri2.enabled = false;
	lWin.rtri3.enabled = false;
	lWin.rdesp.enabled = false;
	lWin.rmec.enabled = false;
	lWin.editFH.enabled = false;


	if(t==0){
		lWin.title = "Lista Chequeo Seguridad - Solicitud";
	}
	else{
		lWin.title = "Lista Chequeo Seguridad - Preparacion";
	}
	var num:int = evt.getNumSeg(t);
	lWin.lFecha.text = evt.getDiaIni()+"/"+evt.getMesIni()+"/"+evt.getAnoIni()+"-"+evt.getHorIni()+":"+evt.getMinIni()+" - "+evt.getDiaFin()+"/"+evt.getMesFin()+"/"+evt.getAnoFin()+"-"+evt.getHorFin()+":"+evt.getMinFin();
	lWin.lRuta.text = evt.getOrigen()+"/"+evt.getDestino();
	lWin.descripcion.text = evt.getDescripcion();
	lWin.evento.text='1111';
	lWin.ch1.visible=false;
	lWin.ch2.visible=false;
	lWin.ch3.visible=false;
	lWin.ch4.visible=false;
	lWin.ch5.visible=false;
	lWin.ch6.visible=false;
	lWin.txtProceso.text = evt.getTxtSeg(t);
	for(var i:int=1;i<=num;i++){
		if(i==1){
			lWin.ch1.visible=true;
			lWin.ch1.label = evt.getTexListaSeg(i,t);
			lWin.ch1.selected=evt.getItemListaSeg(i,t);
		}
		if(i==2){
			lWin.ch2.visible=true;
			lWin.ch2.label = evt.getTexListaSeg(i,t);
			lWin.ch2.selected=evt.getItemListaSeg(i,t);
		}
		if(i==3){
			lWin.ch3.visible=true;
			lWin.ch3.label = evt.getTexListaSeg(i,t);
			lWin.ch3.selected=evt.getItemListaSeg(i,t);
		}
		if(i==4){
			lWin.ch4.visible=true;
			lWin.ch4.label = evt.getTexListaSeg(i,t);
			lWin.ch4.selected=evt.getItemListaSeg(i,t);
		}
		if(i==5){
			lWin.ch5.visible=true;
			lWin.ch5.label = evt.getTexListaSeg(i,t);
			lWin.ch5.selected=evt.getItemListaSeg(i,t);
		}
		if(i==6){
			lWin.ch6.visible=true;
			lWin.ch6.label = evt.getTexListaSeg(i,t);
			lWin.ch6.selected=evt.getItemListaSeg(i,t);
		}
	}
	lWin.addEventListener(CloseEvent.CLOSE,function(e:CloseEvent):void{cierraListaCH(id)});	
}

private function listaChAdm(evt:Evento,t:int):void{
	var id:int = evt.getId();
	lWin = PopUpManager.createPopUp(this,ListaChequeo,true) as ListaChequeo;
	PopUpManager.centerPopUp(lWin);

	lWin.cCap.enabled = false;
	lWin.cCop.enabled = false;
	lWin.cJcab.enabled = false;
	lWin.cTrip1.enabled = false;
	lWin.cTrip2.enabled = false;
	lWin.cTrip3.enabled = false;
	lWin.cMec.enabled = false;
	lWin.cDesp.enabled = false;
	lWin.rcap.enabled = false;
	lWin.rcop.enabled = false;
	lWin.rjcab.enabled = false;
	lWin.rtri1.enabled = false;
	lWin.rtri2.enabled = false;
	lWin.rtri3.enabled = false;
	lWin.rdesp.enabled = false;
	lWin.rmec.enabled = false;
	lWin.editFH.enabled = false;


	if(t==0){
		lWin.title = "Lista Chequeo Administracion - Solicitud";
	}
	else{
		lWin.title = "Lista Chequeo Administracion - Preparacion";
	}
	var num:int = evt.getNumAdm(t);
	lWin.lFecha.text = evt.getDiaIni()+"/"+evt.getMesIni()+"/"+evt.getAnoIni()+"-"+evt.getHorIni()+":"+evt.getMinIni()+" - "+evt.getDiaFin()+"/"+evt.getMesFin()+"/"+evt.getAnoFin()+"-"+evt.getHorFin()+":"+evt.getMinFin();
	lWin.lRuta.text = evt.getOrigen()+"/"+evt.getDestino();
	lWin.evento.text='1111';
	lWin.descripcion.text = evt.getDescripcion();
	lWin.ch1.visible=false;
	lWin.ch2.visible=false;
	lWin.ch3.visible=false;
	lWin.ch4.visible=false;
	lWin.ch5.visible=false;
	lWin.ch6.visible=false;
	lWin.txtProceso.text = evt.getTxtAdm(t);
	for(var i:int=1;i<=num;i++){
		if(i==1){
			lWin.ch1.visible=true;
			lWin.ch1.label = evt.getTexListaAdm(i,t);
			lWin.ch1.selected=evt.getItemListaAdm(i,t);
		}
		if(i==2){
			lWin.ch2.visible=true;
			lWin.ch2.label = evt.getTexListaAdm(i,t);
			lWin.ch2.selected=evt.getItemListaAdm(i,t);
		}
		if(i==3){
			lWin.ch3.visible=true;
			lWin.ch3.label = evt.getTexListaAdm(i,t);
			lWin.ch3.selected=evt.getItemListaAdm(i,t);
		}
		if(i==4){
			lWin.ch4.visible=true;
			lWin.ch4.label = evt.getTexListaAdm(i,t);
			lWin.ch4.selected=evt.getItemListaAdm(i,t);
		}
		if(i==5){
			lWin.ch5.visible=true;
			lWin.ch5.label = evt.getTexListaAdm(i,t);
			lWin.ch5.selected=evt.getItemListaAdm(i,t);
		}
		if(i==6){
			lWin.ch6.visible=true;
			lWin.ch6.label = evt.getTexListaAdm(i,t);
			lWin.ch6.selected=evt.getItemListaAdm(i,t);
		}
	}
	lWin.addEventListener(CloseEvent.CLOSE,function(e:CloseEvent):void{cierraListaCH(id)});	
}

private function cierraListaCH(id:int):void{

	var evt:Evento = buscarEvento(id);
	if(lWin.evento.text=='0000' || lWin.evento.text=='9999'){
		var status:int = evt.getStatus();
		if(lWin.evento.text == '0000'){
			
			if(status == 10){
				if(ger=='ope'){
					procCheckBoxOpe(evt,0);
				}
				if(ger=='man'){
					procCheckBoxMan(evt,0);
				}
				if(ger=='seg'){
					procCheckBoxSeg(evt,0);
				}
				
				if(evt.isListaOpeReady(0) && evt.isListaManReady(0) && evt.isListaSegReady(0)){
					evt.setStatus(30);
				}
				
			}
			if(status == 50){
				if(ger=='ope'){
					procCheckBoxOpe(evt,1);
				}
				if(ger=='man'){
					procCheckBoxMan(evt,1);
				}
				if(ger=='seg'){
					procCheckBoxSeg(evt,1);
				}
				if(ger=='adm'){
					procCheckBoxAdm(evt,1);
				}
				
				if(evt.isListaOpeReady(1) && evt.isListaManReady(1) && evt.isListaSegReady(1) && evt.isListaAdmReady(1)){
					evt.setStatus(100);
				}
				
			}
		}
		var evtUpdate:Object = new Object();
		if(lWin.evento.text=='9999'){
			//marco el evento para cancelarlo.
			evt.setStatus(15);
			evt.setListaOpe('pppppp',0);
			evt.setListaMan('pppppp',0);
			evt.setListaSeg('pppppp',0);
			evt.setListaAdm('pppppp',0);
			evt.setListaOpe('pppppp',1);
			evt.setListaMan('pppppp',1);
			evt.setListaSeg('pppppp',1);
			evt.setListaAdm('pppppp',1);
			evt.setCap(0);
			evt.setCop(0);
			evt.setJcab(0);
			evt.setTri1(0);
			evt.setTri2(0);
			evt.setTri3(0);
			evt.setDesp(0);
			evt.setMec(0);
			evt.setUserCancel(login);
			evt.setTxtCancel(lWin.jText.text);
		}
		evtUpdate['id'] = evt.getId().toString();
		evtUpdate['wfcvuelo[capitan]'] = evt.getCap().toString();
		evtUpdate['wfcvuelo[copiloto]'] = evt.getCop().toString();
		evtUpdate['wfcvuelo[jefecab]'] = evt.getJcab().toString();
		evtUpdate['wfcvuelo[trip01]'] = evt.getTri1().toString();
		evtUpdate['wfcvuelo[trip02]'] = evt.getTri2().toString();
		evtUpdate['wfcvuelo[trip03]'] = evt.getTri3().toString();
		evtUpdate['wfcvuelo[desp]'] = evt.getDesp().toString();
		evtUpdate['wfcvuelo[mec]'] = evt.getMec().toString();
		evtUpdate['wfcvuelo[status]'] = evt.getStatus().toString();
		evtUpdate['wfcvuelo[nrovuelo]'] = evt.getnroVuelo();
		if(ger == 'ope' || lWin.evento.text=='9999'){
			evtUpdate['wfcvuelo[opesol]'] = evt.getListaOpe(0);
			evtUpdate['wfcvuelo[opeeje]'] = evt.getListaOpe(1);
			evtUpdate['wfcvuelo[opesoltxt]'] = evt.getTxtOpe(0);
			evtUpdate['wfcvuelo[opeejetxt]'] = evt.getTxtOpe(1);
		}
		if(ger == 'man' || lWin.evento.text=='9999'){
			evtUpdate['wfcvuelo[mansol]'] = evt.getListaMan(0);
			evtUpdate['wfcvuelo[maneje]'] = evt.getListaMan(1);
			evtUpdate['wfcvuelo[mansoltxt]'] = evt.getTxtMan(0);
			evtUpdate['wfcvuelo[manejetxt]'] = evt.getTxtMan(1);
			
		}
		if(ger == 'seg' || lWin.evento.text=='9999'){
			evtUpdate['wfcvuelo[segsol]'] = evt.getListaSeg(0);
			evtUpdate['wfcvuelo[segeje]'] = evt.getListaSeg(1);
			evtUpdate['wfcvuelo[segsoltxt]'] = evt.getTxtSeg(0);
			evtUpdate['wfcvuelo[segejetxt]'] = evt.getTxtSeg(1);
			
		}
		if(ger == 'adm' || lWin.evento.text=='9999'){
			evtUpdate['wfcvuelo[admsol]'] = evt.getListaAdm(0);
			evtUpdate['wfcvuelo[admeje]'] = evt.getListaAdm(1);
			evtUpdate['wfcvuelo[admsoltxt]'] = evt.getTxtAdm(0);
			evtUpdate['wfcvuelo[admejetxt]'] = evt.getTxtAdm(1);
		}
		if(lWin.evento.text=='9999'){
			evtUpdate['wfcvuelo[usercancel]'] = evt.getUserCancel();
			evtUpdate['wfcvuelo[txtcancel]'] = evt.getTxtCancel();
		}
		updateEvento.send(evtUpdate);
		PopUpManager.removePopUp(lWin);
		lWin = null;
				
	}
	else if(lWin.evento.text=='5555'){ // quiero editar el vuelo
	// aqui llamo a editar vuelo.
		PopUpManager.removePopUp(lWin);
		lWin = null;
		modifEvento(id);
	}
	else if(lWin.evento.text=='4141'){//quiero ver la informacion del vuelo
		PopUpManager.removePopUp(lWin);
		lWin = null;
		showInfo(evt,ger);
	}
	else{
		PopUpManager.removePopUp(lWin);
		lWin = null;
	}		
}

private function procCheckBoxOpe(evt:Evento,t:int):void{
	var num:int = evt.getNumOpe(t);

	if(t==1){
		
		var cap:String="0";
		var cop:String="0";
		var jcab:String="0";
		var tri1:String="0";
		var tri2:String="0";
		var tri3:String="0";
		var desp:String="0";
		var mec:String="0";
	
		if ( lWin.cCap.selectedIndex > -1){
			cap = lWin.cCap.selectedItem.data;
		}
		else{
			cap = "0";
		}
		if ( lWin.cCop.selectedIndex > -1){
			cop = lWin.cCop.selectedItem.data;
		}
		else{
			cop = "0";
		}
		if ( lWin.cJcab.selectedIndex > -1){
			jcab = lWin.cJcab.selectedItem.data;
		}
		else{
			jcab = "0";
		}
		if ( lWin.cTrip1.selectedIndex > -1){
			tri1 = lWin.cTrip1.selectedItem.data;
		}
		else{
			tri1 = "0";
		}
		if ( lWin.cTrip2.selectedIndex > -1){
			tri2 = lWin.cTrip2.selectedItem.data;
		}
		else{
			tri2 = "0";
		}
		if ( lWin.cTrip3.selectedIndex > -1){
			tri3 = lWin.cTrip3.selectedItem.data;
		}
		else{
			tri3 = "0";
		}
		if ( lWin.cDesp.selectedIndex > -1){
			desp = lWin.cDesp.selectedItem.data;
		}
		else{
			desp = "0";
		}
		if ( lWin.cMec.selectedIndex > -1){
			mec = lWin.cMec.selectedItem.data;
		}
		else{
			mec = "0";
		}
	
		evt.setCap(parseInt(cap));
		evt.setCop(parseInt(cop));
		evt.setJcab(parseInt(jcab));
		evt.setTri1(parseInt(tri1));
		evt.setTri2(parseInt(tri2));
		evt.setTri3(parseInt(tri3));
		evt.setDesp(parseInt(desp));
		evt.setMec(parseInt(mec));
	
	}

////

	for(var i:int=1;i<=num;i++){
		if(i==1){
			evt.setItemListaOpe(i,lWin.ch1.selected,t);
		}
		if(i==2){
			evt.setItemListaOpe(i,lWin.ch2.selected,t);
		}
		if(i==3){
			evt.setItemListaOpe(i,lWin.ch3.selected,t);
		}
		if(i==4){
			evt.setItemListaOpe(i,lWin.ch4.selected,t);
		}
		if(i==5){
			evt.setItemListaOpe(i,lWin.ch5.selected,t);
		}
		if(i==6){
			evt.setItemListaOpe(i,lWin.ch6.selected,t);
		}
	}
	if(lWin.jText.text.length>0){
		evt.setTxtCancel(lWin.jText.text);
		evt.setUserCancel(login+':'+ger);
	}
	evt.setTxtOpe(lWin.txtProceso.text,t);
	evt.setnroVuelo(lWin.nrovuelo.text);
	
}


private function procCheckBoxMan(evt:Evento,t:int):void{
	var num:int = evt.getNumMan(t);
	for(var i:int=1;i<=num;i++){
		if(i==1){
			evt.setItemListaMan(i,lWin.ch1.selected,t);
		}
		if(i==2){
			evt.setItemListaMan(i,lWin.ch2.selected,t);
		}
		if(i==3){
			evt.setItemListaMan(i,lWin.ch3.selected,t);
		}
		if(i==4){
			evt.setItemListaMan(i,lWin.ch4.selected,t);
		}
		if(i==5){
			evt.setItemListaMan(i,lWin.ch5.selected,t);
		}
		if(i==6){
			evt.setItemListaMan(i,lWin.ch6.selected,t);
		}
	}
	if(lWin.jText.text.length>0){
		evt.setTxtCancel(lWin.jText.text);
		evt.setUserCancel(login+':'+ger);
	}
	evt.setTxtMan(lWin.txtProceso.text,t);
	
}

private function procCheckBoxSeg(evt:Evento,t:int):void{
	var num:int = evt.getNumSeg(t);
	for(var i:int=1;i<=num;i++){
		if(i==1){
			evt.setItemListaSeg(i,lWin.ch1.selected,t);
		}
		if(i==2){
			evt.setItemListaSeg(i,lWin.ch2.selected,t);
		}
		if(i==3){
			evt.setItemListaSeg(i,lWin.ch3.selected,t);
		}
		if(i==4){
			evt.setItemListaSeg(i,lWin.ch4.selected,t);
		}
		if(i==5){
			evt.setItemListaSeg(i,lWin.ch5.selected,t);
		}
		if(i==6){
			evt.setItemListaSeg(i,lWin.ch6.selected,t);
		}
	}
	if(lWin.jText.text.length>0){
		evt.setTxtCancel(lWin.jText.text);
		evt.setUserCancel(login+':'+ger);
	}
	evt.setTxtSeg(lWin.txtProceso.text,t);
	
}


private function procCheckBoxAdm(evt:Evento,t:int):void{
	var num:int = evt.getNumAdm(t);
	for(var i:int=1;i<=num;i++){
		if(i==1){
			evt.setItemListaAdm(i,lWin.ch1.selected,t);
		}
		if(i==2){
			evt.setItemListaAdm(i,lWin.ch2.selected,t);
		}
		if(i==3){
			evt.setItemListaAdm(i,lWin.ch3.selected,t);
		}
		if(i==4){
			evt.setItemListaAdm(i,lWin.ch4.selected,t);
		}
		if(i==5){
			evt.setItemListaAdm(i,lWin.ch5.selected,t);
		}
		if(i==6){
			evt.setItemListaAdm(i,lWin.ch6.selected,t);
		}
	}
	if(lWin.jText.text.length>0){
		evt.setTxtCancel(lWin.jText.text);
		evt.setUserCancel(login+':'+ger);
	}
	evt.setTxtAdm(lWin.txtProceso.text,t);
}

private function modifEvento(oid:Number):void{
	
	var id:Number = oid;
	var evt:Evento = buscarEvento(id);
	if(evt!= null){
		eWindow = PopUpManager.createPopUp(this,EditarEvento,true) as EditarEvento;
		PopUpManager.centerPopUp(eWindow);
		eWindow.title = "Editar Vuelo";
		eWindow.fechaI.selectedDate = new Date(evt.getAnoIni(),evt.getMesIni()-1,evt.getDiaIni());
		eWindow.fechaF.selectedDate = new Date(evt.getAnoFin(),evt.getMesFin()-1,evt.getDiaFin());
		eWindow.horaI.value = evt.getHorIni();
		eWindow.minI.value = evt.getMinIni();
		eWindow.horaF.value = evt.getHorFin();
		eWindow.minF.value = evt.getMinFin();
		eWindow.operador.text = evt.getOperador();
		eWindow.nrovuelo.text = evt.getnroVuelo();
		eWindow.rutaI.text = evt.getOrigen();
		eWindow.rutaF.text = evt.getDestino();
		eWindow.descripcion.text = evt.getDescripcion();
		if(ger=='com' || ger=='ope2'){
			eWindow.btBorrar.enabled = false;
			eWindow.reinicia.enabled = false;
		}
		if(ger=='com' && evt.getStatus()==15){
			eWindow.btBorrar.enabled = true;
			eWindow.reinicia.enabled = true;
		}
		if(ger=='ope2' && evt.getStatus()==17){
			eWindow.btBorrar.enabled = true;
		}
		if(evt.getStatus()==17){
			eWindow.btAceptar.enabled = false;
			eWindow.fechaI.enabled = false;
			eWindow.fechaF.enabled = false;
			eWindow.horaI.enabled = false;
			eWindow.minI.enabled = false;
			eWindow.horaF.enabled = false;
			eWindow.minF.enabled = false;
			eWindow.rutaI.enabled = false;
			eWindow.rutaF.enabled = false;
		}
		eWindow.addEventListener(CloseEvent.CLOSE,function(e:CloseEvent):void{cierraEditar(e,id)});
		}
	
	}

private function tripulIguales(evt1:Evento, evt2:Evento):Boolean{
	if(evt1.getCap()==evt2.getCap() && evt1.getCop()==evt2.getCop() && evt1.getJcab()==evt2.getJcab() && evt1.getTri1()==evt2.getTri1()){
		if(evt1.getTri2()==evt2.getTri2() && evt1.getTri3()==evt2.getTri3() && evt1.getDesp()==evt2.getDesp() && evt1.getMec()==evt2.getMec()){
			return true;
		}
		else{
			return false;
		}
		
	}
	else{
		return false;
	}
}
	
private function eventosIguales(evt1:Evento, evt2:Evento):Boolean{
	//retorna verdad si los eventos son iguales.
	if((evt1.getAnoIni()==evt2.getAnoIni())&&(evt1.getMesIni()==evt2.getMesIni())&&(evt1.getDiaIni()==evt2.getDiaIni())){
		if((evt1.getAnoFin()==evt2.getAnoFin())&&(evt1.getMesFin()==evt2.getMesFin())&&(evt1.getDiaFin()==evt2.getDiaFin())){
			if((evt1.getHorIni()==evt2.getHorIni())&&(evt1.getHorFin()==evt2.getHorFin())&&(evt1.getMinIni()==evt2.getMinIni())&&(evt1.getMinFin()==evt2.getMinFin())){

				if(evt1.isVuelo() && evt2.isVuelo()){
					if((evt1.getStatus()==evt2.getStatus())&&(evt1.getOrigen()==evt2.getOrigen())&&(evt1.getDestino()==evt2.getDestino() && tripulIguales(evt1,evt2))&&(evt1.getDescripcion()==evt2.getDescripcion())&&(evt1.getOperador()==evt2.getOperador())&&(evt1.getnroVuelo()==evt2.getnroVuelo())){
						return true;
					}
					else{
						return false;
					}
				}
				else{
					if(!evt1.isVuelo()&&!evt2.isVuelo()){
						if((evt1.getDescripcion()==evt2.getDescripcion())&&(evt1.getStatus()==evt2.getStatus())){
							return true;
						}
						else{
							return false;
						}
					}
					else{
						return false;
					}
				}

			}
			else{
				return false;
			}
		}
		else{
			return false;
		}
	}
	else{
		return false;
	}
}	
	
private function cierraEditarMantenimiento(e:Event, id:Number):void{

		var pos:int = buscarPosMantenimiento(id);
		var evt:Evento = buscarMantenimiento(id);
		var evtN:Evento;
		if(mWindow.evento.text=="0000"){
			var ai:int = mWindow.fechaI.selectedDate.getFullYear();
			var mei:int = mWindow.fechaI.selectedDate.getMonth() +1;
			var di:int = mWindow.fechaI.selectedDate.getDate();
			var hi:int = mWindow.horaI.value;
			var mi:int = mWindow.minI.value;
	
			var af:int = mWindow.fechaF.selectedDate.getFullYear();
			var mef:int = mWindow.fechaF.selectedDate.getMonth() +1;
			var df:int = mWindow.fechaF.selectedDate.getDate();
			var hf:int = mWindow.horaF.value;
			var mf:int = mWindow.minF.value;
			var tipoMant:String = mWindow.tipoMant.selectedValue.toString();
			
			var evtUpdate:Object = new Object();

			evtN = new Evento(ai,mei,di,hi,mi,af,mef,df,hf,mf);
			evtN.setMantenimiento();
			evtN.setDescripcion(mWindow.descripcion.text);
			if(tipoMant=="Programado"){
				evtN.setStatus(0);
			}
			else{
				evtN.setStatus(1);
			}
			
			evtN.setId(evt.getId());
			if(eventosIguales(evt,evtN)){
				//eWindow.ldescripcion.visible = false;
				//eWindow.descripcion.visible = false;
				mWindow.btBorrar.visible = false;
				PopUpManager.removePopUp(mWindow);
				mWindow = null;					
			}
			else{
				var solapa:int=editValidMantenimiento(evtN,pos);
				
		        evtUpdate['id'] = evtN.getId().toString();
		        evtUpdate['wfcvuelo[tipo]'] = evtN.getTipo().toString();
		        evtUpdate['wfcvuelo[cabequipo_id]'] = equipoActual.toString();
		        evtUpdate['wfcvuelo[anoini]'] = evtN.getAnoIni().toString();
		        evtUpdate['wfcvuelo[mesini]'] = evtN.getMesIni().toString();
		        evtUpdate['wfcvuelo[diaini]'] = evtN.getDiaIni().toString();
		        evtUpdate['wfcvuelo[horaini]'] = evtN.getHorIni().toString();
		        evtUpdate['wfcvuelo[minini]'] = evtN.getMinIni().toString();
		        evtUpdate['wfcvuelo[anofin]'] = evtN.getAnoFin().toString();
		        evtUpdate['wfcvuelo[mesfin]'] = evtN.getMesFin().toString();
		        evtUpdate['wfcvuelo[diafin]'] = evtN.getDiaFin().toString();
		        evtUpdate['wfcvuelo[horafin]'] = evtN.getHorFin().toString();
		        evtUpdate['wfcvuelo[minfin]'] = evtN.getMinFin().toString();
				evtUpdate['wfcvuelo[operador]'] = 'Mantenimiento';
		        evtUpdate['wfcvuelo[origen]'] = evtN.getOrigen();
		        evtUpdate['wfcvuelo[destino]'] = evtN.getDestino();
		        evtUpdate['wfcvuelo[descripcion]'] = evtN.getDescripcion();
		        evtUpdate['wfcvuelo[status]'] = evtN.getStatus();
		        evtUpdate['wfcvuelo[capitan]'] = "0";
		        evtUpdate['wfcvuelo[copiloto]'] = "0";
		        evtUpdate['wfcvuelo[jefecab]'] = "0";
		       	evtUpdate['wfcvuelo[trip01]'] = "0";
		        evtUpdate['wfcvuelo[trip02]'] = "0";
		        evtUpdate['wfcvuelo[trip03]'] = "0";
		        evtUpdate['wfcvuelo[desp]'] = "0";
		        evtUpdate['wfcvuelo[mec]'] = "0";
				
				
				if(solapa==0){
					//eWindow.ldescripcion.visible = false;
					//eWindow.descripcion.visible = false;
					mWindow.btBorrar.visible = false;
					//dibujaRed();
					PopUpManager.removePopUp(mWindow);
					mWindow = null;	
			        updateEvento.send(evtUpdate);
				}
				else{
					if(solapa==1 || solapa==3){
						//eWindow.ldescripcion.visible = false;
						//eWindow.descripcion.visible = false;
						mWindow.btBorrar.visible = false;
						//dibujaRed();
						PopUpManager.removePopUp(mWindow);
						mWindow = null;	
						Alert.show('Este cambio afecta \n a uno o mas Eventos', 'Alerta', Alert.OK, this, null, iconoAlerta, Alert.OK);
				        updateEvento.send(evtUpdate);
					}
					if(solapa==2){
						mWindow.log.text = "La fecha se solapa con un Mantenimiento existente. \n";
						mWindow.evento.text = "9999";// reinicializo la variable de estado del popup
					}
				}
			}
			
		}
		else{
			if(mWindow.evento.text=="1111"){
				deleteEvento.send({id:id});
				//mantenimientos.splice(pos,1);
				//dibujaRed();	
			}
			//eWindow.ldescripcion.visible = false;
			//eWindow.descripcion.visible = false;
			mWindow.btBorrar.visible = false;
			PopUpManager.removePopUp(mWindow);
			mWindow = null;	
		}
	
}

private function cierraEditarEntrenamiento(e:Event, id:Number):void{
	
	var pos:int = buscarPosEntrenamiento(id);
	var evt:Evento = buscarEntrenamiento(id);
	var evtN:Evento;
	if(capWin.evento.text=="0000"){
		var ai:int = capWin.fechaI.selectedDate.getFullYear();
		var mei:int = capWin.fechaI.selectedDate.getMonth() +1;
		var di:int = capWin.fechaI.selectedDate.getDate();
		var hi:int = capWin.horaI.value;
		var mi:int = capWin.minI.value;
		
		var af:int = capWin.fechaF.selectedDate.getFullYear();
		var mef:int = capWin.fechaF.selectedDate.getMonth() +1;
		var df:int = capWin.fechaF.selectedDate.getDate();
		var hf:int = capWin.horaF.value;
		var mf:int = capWin.minF.value;
		
		var evtUpdate:Object = new Object();
		
		evtN = new Evento(ai,mei,di,hi,mi,af,mef,df,hf,mf);
		evtN.setEntrenamiento();
		evtN.setDescripcion(capWin.descripcion.text);
		
		evtN.setId(evt.getId());
		if(eventosIguales(evt,evtN)){
			//eWindow.ldescripcion.visible = false;
			//eWindow.descripcion.visible = false;
			capWin.btBorrar.visible = false;
			PopUpManager.removePopUp(capWin);
			capWin = null;					
		}
		else{
			var solapa:int=editValidEntrenamiento(evtN,pos);
			
			evtUpdate['id'] = evtN.getId().toString();
			evtUpdate['wfcvuelo[tipo]'] = evtN.getTipo().toString();
			evtUpdate['wfcvuelo[cabequipo_id]'] = equipoActual.toString();
			evtUpdate['wfcvuelo[anoini]'] = evtN.getAnoIni().toString();
			evtUpdate['wfcvuelo[mesini]'] = evtN.getMesIni().toString();
			evtUpdate['wfcvuelo[diaini]'] = evtN.getDiaIni().toString();
			evtUpdate['wfcvuelo[horaini]'] = evtN.getHorIni().toString();
			evtUpdate['wfcvuelo[minini]'] = evtN.getMinIni().toString();
			evtUpdate['wfcvuelo[anofin]'] = evtN.getAnoFin().toString();
			evtUpdate['wfcvuelo[mesfin]'] = evtN.getMesFin().toString();
			evtUpdate['wfcvuelo[diafin]'] = evtN.getDiaFin().toString();
			evtUpdate['wfcvuelo[horafin]'] = evtN.getHorFin().toString();
			evtUpdate['wfcvuelo[minfin]'] = evtN.getMinFin().toString();
			evtUpdate['wfcvuelo[operador]'] = 'Capacitacion';
			evtUpdate['wfcvuelo[origen]'] = evtN.getOrigen();
			evtUpdate['wfcvuelo[destino]'] = evtN.getDestino();
			evtUpdate['wfcvuelo[descripcion]'] = evtN.getDescripcion();
			evtUpdate['wfcvuelo[status]'] = "0";
			evtUpdate['wfcvuelo[capitan]'] = "0";
			evtUpdate['wfcvuelo[copiloto]'] = "0";
			evtUpdate['wfcvuelo[jefecab]'] = "0";
			evtUpdate['wfcvuelo[trip01]'] = "0";
			evtUpdate['wfcvuelo[trip02]'] = "0";
			evtUpdate['wfcvuelo[trip03]'] = "0";
			evtUpdate['wfcvuelo[desp]'] = "0";
			evtUpdate['wfcvuelo[mec]'] = "0";
			
			
			if(solapa==0 || solapa==2){
				if(solapa==2){
					Alert.show("Esta modificacion afecta eventos existentes");
				}
				//eWindow.ldescripcion.visible = false;
				//eWindow.descripcion.visible = false;
				capWin.btBorrar.visible = false;
				//dibujaRed();
				PopUpManager.removePopUp(capWin);
				capWin = null;	
				updateEvento.send(evtUpdate);
			}
			else{
				if(solapa==3 || solapa==1){
					capWin.log.text = "La fecha se solapa con un Entrenamiento existente. \n";
					capWin.evento.text = "9999";// reinicializo la variable de estado del popup
				}
				
			}
		}
		
	}
	else{
		if(capWin.evento.text=="1111"){
			deleteEvento.send({id:id});
			//mantenimientos.splice(pos,1);
			//dibujaRed();	
		}
		//eWindow.ldescripcion.visible = false;
		//eWindow.descripcion.visible = false;
		capWin.btBorrar.visible = false;
		PopUpManager.removePopUp(capWin);
		capWin = null;	
	}
	
}






private function cierraEditar(e:Event, id:Number):void{

		var pos:int = buscarPosEvento(id);
		var evt:Evento = buscarEvento(id);
		var status:int = evt.getStatus();
		var evtN:Evento;
		var reinicia:Boolean = false;

		if(eWindow.evento.text=="0000" || eWindow.evento.text=='1111'){
			var ai:int = eWindow.fechaI.selectedDate.getFullYear();
			var mei:int = eWindow.fechaI.selectedDate.getMonth() +1;
			var di:int = eWindow.fechaI.selectedDate.getDate();
			var hi:int = eWindow.horaI.value;
			var mi:int = eWindow.minI.value;
	
			var af:int = eWindow.fechaF.selectedDate.getFullYear();
			var mef:int = eWindow.fechaF.selectedDate.getMonth() +1;
			var df:int = eWindow.fechaF.selectedDate.getDate();
			var hf:int = eWindow.horaF.value;
			var mf:int = eWindow.minF.value;
			reinicia = eWindow.reinicia.selected;
			
			
			var evtUpdate:Object = new Object();

			evtN = new Evento(ai,mei,di,hi,mi,af,mef,df,hf,mf);
			evtN.setVuelo();
			evtN.setnroVuelo(eWindow.nrovuelo.text);
			evtN.setOperador(eWindow.operador.text);
			evtN.setOrigen(eWindow.rutaI.text);
			evtN.setDestino(eWindow.rutaF.text);
			evtN.setDescripcion(eWindow.descripcion.text);
			evtN.setId(evt.getId());
			if(reinicia){
				evtN.setStatus(10);
			}
			else{
				evtN.setStatus(evt.getStatus());
			}
			evtN.setUserCancel(evt.getUserCancel());
			evtN.setTxtCancel(evt.getTxtCancel());
			if(eWindow.evento.text=="1111"){
				//deleteEvento.send({id:id});
				if(evt.getStatus()==15){
					evtN.setStatus(17);
				}
				else if(evt.getStatus()==17){
					evtN.setStatus(1001);
				}
			}
			
			if(eventosIguales(evt,evtN) && !reinicia){
				PopUpManager.removePopUp(eWindow);
				eWindow = null;					
			}
			else{
				var edpos:int = editValidVuelo(evtN,pos);
				if(edpos==0)
				{
		            evtUpdate['id'] = evtN.getId().toString();
		            evtUpdate['wfcvuelo[tipo]'] = evtN.getTipo().toString();
		            evtUpdate['wfcvuelo[cabequipo_id]'] = equipoActual.toString();
		            evtUpdate['wfcvuelo[anoini]'] = evtN.getAnoIni().toString();
		            evtUpdate['wfcvuelo[mesini]'] = evtN.getMesIni().toString();
		            evtUpdate['wfcvuelo[diaini]'] = evtN.getDiaIni().toString();
		            evtUpdate['wfcvuelo[horaini]'] = evtN.getHorIni().toString();
		            evtUpdate['wfcvuelo[minini]'] = evtN.getMinIni().toString();
		            evtUpdate['wfcvuelo[anofin]'] = evtN.getAnoFin().toString();
		            evtUpdate['wfcvuelo[mesfin]'] = evtN.getMesFin().toString();
		            evtUpdate['wfcvuelo[diafin]'] = evtN.getDiaFin().toString();
		            evtUpdate['wfcvuelo[horafin]'] = evtN.getHorFin().toString();
		            evtUpdate['wfcvuelo[minfin]'] = evtN.getMinFin().toString();
					evtUpdate['wfcvuelo[nrovuelo]'] = evtN.getnroVuelo();
					evtUpdate['wfcvuelo[operador]'] = evtN.getOperador();
		            evtUpdate['wfcvuelo[origen]'] = evtN.getOrigen();
		            evtUpdate['wfcvuelo[destino]'] = evtN.getDestino();
		            evtUpdate['wfcvuelo[status]'] = evtN.getStatus();
		            evtUpdate['wfcvuelo[descripcion]'] = evtN.getDescripcion();
		            if(reinicia){
			            evtUpdate['wfcvuelo[capitan]'] = '';
			            evtUpdate['wfcvuelo[copiloto]'] = '';
			            evtUpdate['wfcvuelo[jefecab]'] = '';
			            evtUpdate['wfcvuelo[trip01]'] = '';
			            evtUpdate['wfcvuelo[trip02]'] = '';
			            evtUpdate['wfcvuelo[trip03]'] = '';
			            evtUpdate['wfcvuelo[desp]'] = '';
			            evtUpdate['wfcvuelo[mec]'] = '';
			            evtUpdate['wfcvuelo[opesol]'] = 'pppppp';
			            evtUpdate['wfcvuelo[mansol]'] = 'pppppp';
			            evtUpdate['wfcvuelo[segsol]'] = 'pppppp';
			            evtUpdate['wfcvuelo[admsol]'] = 'pppppp';
			            evtUpdate['wfcvuelo[opeeje]'] = 'pppppp';
			            evtUpdate['wfcvuelo[maneje]'] = 'pppppp';
			            evtUpdate['wfcvuelo[segeje]'] = 'pppppp';
			            evtUpdate['wfcvuelo[admeje]'] = 'pppppp';
			            evtUpdate['wfcvuelo[opesoltxt]'] = '';
			            evtUpdate['wfcvuelo[mansoltxt]'] = '';
			            evtUpdate['wfcvuelo[segsoltxt]'] = '';
			            evtUpdate['wfcvuelo[admsoltxt]'] = '';
			            evtUpdate['wfcvuelo[opeejetxt]'] = '';
			            evtUpdate['wfcvuelo[manejetxt]'] = '';
			            evtUpdate['wfcvuelo[segejetxt]'] = '';
			            evtUpdate['wfcvuelo[admejetxt]'] = '';
		            }
		            evtUpdate['wfcvuelo[usercancel]'] = evtN.getUserCancel();
		            evtUpdate['wfcvuelo[txtcancel]'] = evtN.getTxtCancel();

		            updateEvento.send(evtUpdate);

					//dibujaRed();
					PopUpManager.removePopUp(eWindow);
					eWindow = null;	
				}
				else{
					//eWindow.log.text = "";
					eWindow.log.text = "La fecha se solapa con un evento existente. \n";
					eWindow.evento.text = "9999";// reinicializo la variable de estado del popup
				}
			}
			
		}
		else if(eWindow.evento.text=="4141"){
			PopUpManager.removePopUp(eWindow);
			eWindow = null;	
			showInfo(evt,ger);
		}
		else{
			PopUpManager.removePopUp(eWindow);
			eWindow = null;	
		}
}


private function cierraNEVT(e:Event):void
{
	if(ceWindow.evento.text=="0000"){
		var ai:int = ceWindow.fechaI.selectedDate.getFullYear();
		var mei:int = ceWindow.fechaI.selectedDate.getMonth() +1;
		var di:int = ceWindow.fechaI.selectedDate.getDate();
		var hi:int = ceWindow.horaI.value;
		var mi:int = ceWindow.minI.value;

		var af:int = ceWindow.fechaF.selectedDate.getFullYear();
		var mef:int = ceWindow.fechaF.selectedDate.getMonth() +1;
		var df:int = ceWindow.fechaF.selectedDate.getDate();
		var hf:int = ceWindow.horaF.value;
		var mf:int = ceWindow.minF.value;
		var cap:String="0";
		var cop:String="0";
		var jcab:String="0";
		var tri1:String="0";
		var tri2:String="0";
		var tri3:String="0";
		var desp:String="0";
		var mec:String="0";
		

		var evtNuevo:Object = new Object();
				
		var evt:Evento = new Evento(ai,mei,di,hi,mi,af,mef,df,hf,mf);
			evt.setVuelo();
		if(evt.draw(aano,ames,adia,contenido.width)!=null){
			var solapa:int = validEvent(evt);
			if(solapa==0){
				
					evt.setnroVuelo(ceWindow.nrovuelo.text);
					evt.setOperador(ceWindow.operador.text);
					evt.setOrigen(ceWindow.rutaI.text);
					evt.setDestino(ceWindow.rutaF.text);
					evt.setDescripcion(ceWindow.descripcion.text);
					
		            evtNuevo['wfcvuelo[tipo]'] = evt.getTipo().toString();
		            evtNuevo['wfcvuelo[cabequipo_id]'] = equipoActual.toString();
		            evtNuevo['wfcvuelo[anoini]'] = evt.getAnoIni().toString();
		            evtNuevo['wfcvuelo[mesini]'] = evt.getMesIni().toString();
		            evtNuevo['wfcvuelo[diaini]'] = evt.getDiaIni().toString();
		            evtNuevo['wfcvuelo[horaini]'] = evt.getHorIni().toString();
		            evtNuevo['wfcvuelo[minini]'] = evt.getMinIni().toString();
		            evtNuevo['wfcvuelo[anofin]'] = evt.getAnoFin().toString();
		            evtNuevo['wfcvuelo[mesfin]'] = evt.getMesFin().toString();
		            evtNuevo['wfcvuelo[diafin]'] = evt.getDiaFin().toString();
		            evtNuevo['wfcvuelo[horafin]'] = evt.getHorFin().toString();
		            evtNuevo['wfcvuelo[minfin]'] = evt.getMinFin().toString();
					evtNuevo['wfcvuelo[nrovuelo]'] = evt.getnroVuelo();
					evtNuevo['wfcvuelo[operador]'] = evt.getOperador();
		            evtNuevo['wfcvuelo[origen]'] = evt.getOrigen();
		            evtNuevo['wfcvuelo[destino]'] = evt.getDestino();
		            evtNuevo['wfcvuelo[descripcion]'] = evt.getDescripcion();
		            evtNuevo['wfcvuelo[capitan]'] = cap;
		            evtNuevo['wfcvuelo[copiloto]'] = cop;
		            evtNuevo['wfcvuelo[jefecab]'] = jcab;
		            evtNuevo['wfcvuelo[trip01]'] = tri1;
		            evtNuevo['wfcvuelo[trip02]'] = tri2;
		            evtNuevo['wfcvuelo[trip03]'] = tri3;
		            evtNuevo['wfcvuelo[desp]'] = desp;
		            evtNuevo['wfcvuelo[mec]'] = mec;
		            evtNuevo['wfcvuelo[status]']="10"; //status de proceso colocado.
		            evtNuevo['wfcvuelo[opesol]'] = evt.getListaOpe(0);
		            evtNuevo['wfcvuelo[mansol]'] = evt.getListaMan(0);
		            evtNuevo['wfcvuelo[segsol]'] = evt.getListaSeg(0);
		            evtNuevo['wfcvuelo[admsol]'] = evt.getListaAdm(0);
		            evtNuevo['wfcvuelo[opeeje]'] = evt.getListaOpe(1);
		            evtNuevo['wfcvuelo[maneje]'] = evt.getListaMan(1);
		            evtNuevo['wfcvuelo[segeje]'] = evt.getListaSeg(1);
		            evtNuevo['wfcvuelo[admeje]'] = evt.getListaAdm(1);
		            evtNuevo['wfcvuelo[opesoltxt]'] = '';
		            evtNuevo['wfcvuelo[mansoltxt]'] = '';
		            evtNuevo['wfcvuelo[segsoltxt]'] = '';
		            evtNuevo['wfcvuelo[admsoltxt]'] = '';
		            evtNuevo['wfcvuelo[opeejetxt]'] = '';
		            evtNuevo['wfcvuelo[manejetxt]'] = '';
		            evtNuevo['wfcvuelo[segejetxt]'] = '';
		            evtNuevo['wfcvuelo[admejetxt]'] = '';
					nuevoEventoBD.send(evtNuevo);

					ceWindow.lruta.visible = false;
					ceWindow.la.visible = false;
					ceWindow.lde.visible = false;
					ceWindow.rutaI.visible = false;
					ceWindow.rutaF.visible = false;
				
				//dibujaRed();
				PopUpManager.removePopUp(ceWindow);
				ceWindow = null;
			}
			else{
				ceWindow.log.text = "La fecha se solapa con un evento existente. \n";
				ceWindow.evento.text = "9999";// reinicializo la variable de estado del popup
			}
		}
	}
	else{
		PopUpManager.removePopUp(ceWindow);
		ceWindow = null;
	}
	
}

private function cierraMTT(e:Event):void
{
	if(mWindow.evento.text=="0000"){
		var ai:int = mWindow.fechaI.selectedDate.getFullYear();
		var mei:int = mWindow.fechaI.selectedDate.getMonth() +1;
		var di:int = mWindow.fechaI.selectedDate.getDate();
		var hi:int = mWindow.horaI.value;
		var mi:int = mWindow.minI.value;

		var af:int = mWindow.fechaF.selectedDate.getFullYear();
		var mef:int = mWindow.fechaF.selectedDate.getMonth() +1;
		var df:int = mWindow.fechaF.selectedDate.getDate();
		var hf:int = mWindow.horaF.value;
		var mf:int = mWindow.minF.value;
		var tipoMant:String = mWindow.tipoMant.selectedValue.toString();
		//mx.controls.Alert.show(tipoMant);
		

		var evtNuevo:Object = new Object();
				
		var evt:Evento = new Evento(ai,mei,di,hi,mi,af,mef,df,hf,mf);
			evt.setMantenimiento();
			if(tipoMant=="Programado"){
				evt.setStatus(0);
			}
			else{
				evt.setStatus(1);
			}
			
		if(evt.draw(aano,ames,adia,contenido.width)!=null){
			var solapa:int = validEvent(evt);
			if(solapa==0){

					evt.setDescripcion(mWindow.descripcion.text);
		            evtNuevo['wfcvuelo[tipo]'] = evt.getTipo().toString();
		            evtNuevo['wfcvuelo[cabequipo_id]'] = equipoActual.toString();
		            evtNuevo['wfcvuelo[anoini]'] = evt.getAnoIni().toString();
		            evtNuevo['wfcvuelo[mesini]'] = evt.getMesIni().toString();
		            evtNuevo['wfcvuelo[diaini]'] = evt.getDiaIni().toString();
		            evtNuevo['wfcvuelo[horaini]'] = evt.getHorIni().toString();
		            evtNuevo['wfcvuelo[minini]'] = evt.getMinIni().toString();
		            evtNuevo['wfcvuelo[anofin]'] = evt.getAnoFin().toString();
		            evtNuevo['wfcvuelo[mesfin]'] = evt.getMesFin().toString();
		            evtNuevo['wfcvuelo[diafin]'] = evt.getDiaFin().toString();
		            evtNuevo['wfcvuelo[horafin]'] = evt.getHorFin().toString();
		            evtNuevo['wfcvuelo[minfin]'] = evt.getMinFin().toString();
					evtNuevo['wfcvuelo[operador]'] = 'Mantenimiento';
		            evtNuevo['wfcvuelo[origen]'] = evt.getOrigen();
		            evtNuevo['wfcvuelo[destino]'] = evt.getDestino();
		            evtNuevo['wfcvuelo[descripcion]'] = evt.getDescripcion();
		            evtNuevo['wfcvuelo[status]'] = evt.getStatus();
		            evtNuevo['wfcvuelo[capitan]'] = "0";
		            evtNuevo['wfcvuelo[copiloto]'] = "0";
		            evtNuevo['wfcvuelo[jefecab]'] = "0";
		            evtNuevo['wfcvuelo[trip01]'] = "0";
		            evtNuevo['wfcvuelo[trip02]'] = "0";
		            evtNuevo['wfcvuelo[trip03]'] = "0";
		            evtNuevo['wfcvuelo[desp]'] = "0";
		            evtNuevo['wfcvuelo[mec]'] = "0";
					nuevoEventoBD.send(evtNuevo);
					PopUpManager.removePopUp(mWindow);
					mWindow = null;
			}
			else{
				//aqui introducir messagebox para avisar que existe un solapamiento
				if(solapa==1 || solapa==3){
				evt.setDescripcion(mWindow.descripcion.text);
			    evtNuevo['wfcvuelo[tipo]'] = evt.getTipo().toString();
			    evtNuevo['wfcvuelo[cabequipo_id]'] = equipoActual.toString();
			    evtNuevo['wfcvuelo[anoini]'] = evt.getAnoIni().toString();
			    evtNuevo['wfcvuelo[mesini]'] = evt.getMesIni().toString();
			    evtNuevo['wfcvuelo[diaini]'] = evt.getDiaIni().toString();
			    evtNuevo['wfcvuelo[horaini]'] = evt.getHorIni().toString();
			    evtNuevo['wfcvuelo[minini]'] = evt.getMinIni().toString();
			    evtNuevo['wfcvuelo[anofin]'] = evt.getAnoFin().toString();
			    evtNuevo['wfcvuelo[mesfin]'] = evt.getMesFin().toString();
			    evtNuevo['wfcvuelo[diafin]'] = evt.getDiaFin().toString();
			    evtNuevo['wfcvuelo[horafin]'] = evt.getHorFin().toString();
			    evtNuevo['wfcvuelo[minfin]'] = evt.getMinFin().toString();
				evtNuevo['wfcvuelo[operador]'] = 'Mantenimiento';
			    evtNuevo['wfcvuelo[origen]'] = evt.getOrigen();
			    evtNuevo['wfcvuelo[destino]'] = evt.getDestino();
			    evtNuevo['wfcvuelo[descripcion]'] = evt.getDescripcion();
		        evtNuevo['wfcvuelo[status]'] = evt.getStatus();
			    evtNuevo['wfcvuelo[capitan]'] = "0";
			    evtNuevo['wfcvuelo[copiloto]'] = "0";
			    evtNuevo['wfcvuelo[jefecab]'] = "0";
			    evtNuevo['wfcvuelo[trip01]'] = "0";
			    evtNuevo['wfcvuelo[trip02]'] = "0";
			    evtNuevo['wfcvuelo[trip03]'] = "0";
			    evtNuevo['wfcvuelo[desp]'] = "0";
			    evtNuevo['wfcvuelo[mec]'] = "0";
						
				nuevoEventoBD.send(evtNuevo);						
						
				PopUpManager.removePopUp(mWindow);
				mWindow = null;
				Alert.show('Este cambio afecta \n a uno o mas Eventos', 'Alerta', Alert.OK, this, null, iconoAlerta, Alert.OK);
				}
				else{
					mWindow.log.text = "La fecha se solapa con un mantenimiento existente. \n";
					mWindow.evento.text = "9999";// reinicializo la variable de estado del popup
					}
				}
			}
		}
	else{
		PopUpManager.removePopUp(mWindow);
		mWindow = null;
	}
	
}

private function editValidVuelo(evt:Evento, evtActual:int):int{
	//se usa solo para los vuelos en la edicion y retorna
	//falso: en caso de que exista un solapamiento con algun vuelo o mantenimiento
	//verdad: si no existe ningun solapamiento
	//esta funcion difiere de validVuelo en que no toma en cuenta el evento que se esta editando
	
	for(var i:int=0; i < eventos.length; i++){
		if(i!=evtActual){
			if(verificaSolapamiento(evt, eventos[i])){
				return 1;
			}
		}
	}
	for(var j:int=0; j < mantenimientos.length; j++){
			if(verificaSolapamiento(evt, mantenimientos[j])){
				return 2;
			}
	}

	for(var k:int=0; k < entrenamientos.length; k++){
		if(verificaSolapamiento(evt, entrenamientos[k])){
			return 3;
		}
	}

	return 0;
}

private function editValidMantenimiento(evt:Evento, evtActual:int):int{
	//se usa solo para los mantenimientos en la edicion y retorna
	//0: si no existe solapamiento
	//1: en caso de que exista un solapamiento con algun vuelo
	//2: si no existe ningun solapamiento o esta solapado con un mantenimiento
	//esta funcion difiere de validVuelo en que no toma en cuenta el evento que se esta editando
	
	for(var k:int=0; k < entrenamientos.length; k++){
		if(verificaSolapamiento(evt, entrenamientos[k])){
			return 3;
		}
	}
	for(var i:int=0; i < eventos.length; i++){
			if(verificaSolapamiento(evt, eventos[i])){
				return 1;
			}
	}
	for(var j:int=0; j < mantenimientos.length; j++){
		if(j!=evtActual){
			if(verificaSolapamiento(evt, mantenimientos[j])){
				return 2;
			}
		}
	}
	
	return 0;
}

private function editValidEntrenamiento(evt:Evento, evtActual:int):int{
	//se usa solo para los mantenimientos en la edicion y retorna
	//0: si no existe solapamiento
	//1: en caso de que exista un solapamiento con algun vuelo
	//2: si no existe ningun solapamiento o esta solapado con un mantenimiento
	//esta funcion difiere de validVuelo en que no toma en cuenta el evento que se esta editando
	
	for(var k:int=0; k < entrenamientos.length; k++){
		if(k!=evtActual){
			if(verificaSolapamiento(evt, entrenamientos[k])){
				return 3;
			}
		}
	}

	for(var i:int=0; i < eventos.length; i++){
		if(verificaSolapamiento(evt, eventos[i])){
			return 1;
		}
	}
	for(var j:int=0; j < mantenimientos.length; j++){
		if(verificaSolapamiento(evt, mantenimientos[j])){
			return 2;
		}
	}
	
	return 0;
}


private function validEvent(evt:Evento):int{
	//verifica solapamientos en todos los eventos contra en evento que se esta agregando
	// en caso de ser un mantenimiento se debe proceder de manera diferente
	// enviando correos a los involucrados debido a que los mantenimientos tienen prioridad superior.
	//devuelve 0 si no existe solapamiento de eventos
	//1 si se esta solapando con un evento
	//2 si se esta solapando con un mantenimiento
	for(var i:int=0; i < eventos.length; i++){
		if(verificaSolapamiento(evt, eventos[i])){
			return 1;
		}
	}
	for(var k:int=0; k < entrenamientos.length; k++){
		if(verificaSolapamiento(evt, entrenamientos[k])){
			return 3;
		}
	}
	for(var j:int=0; j < mantenimientos.length; j++){
		if(verificaSolapamiento(evt, mantenimientos[j])){
			return 2;
		}
	}
	
	return 0;
}

private function verificaSolapamiento(ev1:Evento, ev2:Evento):Boolean{
	//funcion que retorna verdad en caso de que exista un solapamiento entre eventos
	var f1a:Number = ev1.getMilisFecIni();
	var f1b:Number = ev1.getMilisFecFin();
	var f2a:Number = ev2.getMilisFecIni();
	var f2b:Number = ev2.getMilisFecFin();
	if(estaEntre(f1a,f2a,f2b) || estaEntre(f1b,f2a,f2b) || estaEntre(f2a,f1a,f1b) || estaEntre(f2b,f1a,f1b)){
		return true;
	} 
	return false;
}

private function estaEntre(n:Number,a:Number,b:Number):Boolean{
	// funcion que retorna verdad si n esta entre a y b
	if((n>=a) && (n<=b)){
		return true;
	}
	else{
		return false;
	}
}

         // Display a selected item's label field and index for change events.
private function cambioEquipo(event:Event):void {
	equipoActual = event.currentTarget.selectedItem.data;
	buscarVuelos(equipoActual);
	//mx.controls.Alert.show("Equipo Actual: "+equipoActual);
}

private function ayuda():void{
	aWin = PopUpManager.createPopUp(this,Ayudax,true) as Ayudax;
	PopUpManager.centerPopUp(aWin);
	aWin.addEventListener(CloseEvent.CLOSE,cierraAyuda);	
}

private function cierraAyuda(e:CloseEvent):void{

	PopUpManager.removePopUp(aWin);
	aWin = null;		
	
}


