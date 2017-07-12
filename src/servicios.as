// ActionScript file
import flash.events.TimerEvent;
import flash.external.ExternalInterface;
import flash.net.URLRequest;

import mx.collections.ArrayCollection;
import mx.controls.Alert;
import mx.managers.CursorManager;
import mx.rpc.events.FaultEvent;
import mx.rpc.events.InvokeEvent;
import mx.rpc.events.ResultEvent;
import mx.utils.ObjectProxy;

[Bindable]
private var equiposCol:ArrayCollection;

private function salir():void{
	//aqui redirigimos a la pagina principal de la intranet
	var url:String = "/principal/bienvenida";
	var request:URLRequest = new URLRequest(url);
	navigateToURL(request, "_self");
	
}

private function prohibir():void{
	//aqui redirigimos a la pagina principal de la intranet
	//var url:String = "/principal/bienvenida";
	var url:String = dirServer;
	var request:URLRequest = new URLRequest(url);
	navigateToURL(request, "_self");
	
}

private function buscarSession():void{
	
	getSession.send();

}

private function buscarEquipos():void{
	
	//Llama al servicio HTML para traer los datos en XML
	listEquipos.send();
	
}


private function sessionInvokeHandler(event:InvokeEvent):void{

	// Muestra el cursor del mouse ocupado
	CursorManager.setBusyCursor();

}
            
private function sessionResultHandler(event:ResultEvent):void{

	var sessionCol:ArrayCollection = new ArrayCollection();
	var haySession:Boolean = false;
	if( event.result.status  == null ) {
		//mx.controls.Alert.show("No Existe Session !");
		haySession = false;
		prohibir();
	}
	else if ( event.result.status is ObjectProxy ) {
		sessionCol =  new ArrayCollection( [event.result.status] );
		//mx.controls.Alert.show("Tiene exactamente 1 item");
		login=sessionCol[0].login;
		ger=sessionCol[0].gerencia;
		a=int(sessionCol[0].ano);
		m=int(sessionCol[0].mes)-1;
		d=int(sessionCol[0].dia);
		aano=int(sessionCol[0].aano);
		ames=int(sessionCol[0].ames)-1;
		adia=int(sessionCol[0].adia);
		Alert.show("Login: "+login+" \nGerencia: "+nomGer(ger)+"\nFecha: "+d.toString()+"/"+(m+1).toString()+"/"+a.toString(),'Bienvenido');
		//Alert.show(adia.toString()+"/"+(ames+1).toString()+"/"+aano.toString(),'Mes Atras');

		iGer.text = nomGer(ger);
		
		iLogin.text = login;
			//equiposCol[i].id});
		haySession = true;
	}
	else {
		mx.controls.Alert.show("La Session Tiene mas de un Item !",'Error');
	}
		CursorManager.removeBusyCursor();
		if(haySession){
			dibujaFecha();
			buscarEquipos();
		}
}

private function nomGer(lger:String):String{

	var res:String;
	
	if(lger=='ope' || lger=='ope2'){
		res = 'Operaciones';
	}
	else if(lger=='man'){
		res = 'Mantenimiento';
	}
	else if(lger=='adm'){
		res = 'Administracion';
	}
	else if(lger=='com'){
		res = 'Comercial';
	}
	else if(lger=='seg'){
		res = 'Seguridad';
	}
	else if(lger=='tec'){
		res = 'Tecnologia';
	}
	else if(lger=='vic'){
		res = 'Vicepresidencia'
	}
	else if(lger=='cap'){
		res = 'Capacitacion'
	}
	else{
		res = 'Desconocida';
	}
	
	return res;
	
}

private function sessionFaultHandler(event:FaultEvent):void{

	// There was an error in loading the XML
	//Alert.show (event.fault.message); 
	Alert.show("FALLO Imposible acceder a la session...",'Error');
	//Alert.show (event.fault.message);    
	// Hide the busy cursor
	prohibir()
	CursorManager.removeBusyCursor();

}







            
// Cuando se invoca el HTTPService, el servcio llama a esta funcion
// request the XML.
private function lequipInvokeHandler(event:InvokeEvent):void{

	// Muestra el cursor del mouse ocupado
	CursorManager.setBusyCursor();

}
            
// Esta funcion es llamada cualdo se carga el XML satisfactoriamente
private function lequipResultHandler(event:ResultEvent):void{

	var hayVuelos:Boolean = false;
	
	if( event.result.cabequipos.cabequipo  == null ) {
		mx.controls.Alert.show("No Existen Equipos !",'Error');
		hayVuelos = false;
	}
	else if ( event.result.cabequipos.cabequipo is ObjectProxy ) {
		// the response date has only one item
		//mx.controls.Alert.show("Tiene 1 solo Item !");
	
		// Guarda el resultado de la llamada al XML en un ArrayCollection
		equiposCol =  new ArrayCollection( [event.result.cabequipos.cabequipo] );
		//Extrae los datos del array collection y los inserta en el combobox	
		for(var i:int=0; i<equiposCol.length; i++){
			
			comboEquipos.dataProvider.addItem({label: equiposCol[i].nombre, data: equiposCol[i].id});
			//mx.controls.Alert.show(equiposCol[i].nombre);
		}
		hayVuelos = true;
	}
	else {
		//mx.controls.Alert.show("Tiene mas de un Item !");
		// Save a reference to the list of bloggers
		equiposCol = event.result.cabequipos.cabequipo as ArrayCollection;
		for(var j:int=0; j<equiposCol.length; j++){
			comboEquipos.dataProvider.addItem({label: equiposCol[j].nombre, data: equiposCol[j].id});
			//mx.controls.Alert.show(equiposCol[j].nombre);
		}
		hayVuelos = true;
	
	}
		// Cambia el cursor de ocupado
		CursorManager.removeBusyCursor();
		
		if(hayVuelos){
			
			listTripulantes.send();
			
		}

}

private function lequipFaultHandler(event:FaultEvent):void{

	// There was an error in loading the XML
	Alert.show("Imposible acceder ...",'Error');
	//Alert.show (event.fault.message);    
	// Hide the busy cursor
	CursorManager.removeBusyCursor();

}

private function buscarVuelos(v:String):void{
	listVuelos.send({id:v});	
}

            
private function refrescar():void{
	
	buscarVuelos(equipoActual);
	
}

// Cuando se invoca el HTTPService, el servcio llama a esta funcion
// request the XML.
private function lvueloInvokeHandler(event:InvokeEvent):void{

	// Muestra el cursor del mouse ocupado
	CursorManager.setBusyCursor();

}

private function permisosInicio():void{
	btnVuelo.enabled = false;
	btnMantenimiento.enabled = false;
	btnCapacitacion.enabled = false;
	if(ger=='com'){
		btnVuelo.enabled=true;
		//btnProgramas.enabled=true;
	}
	if(ger=='ope' || ger=='ope2'){
		//btnVuelo.enabled = true;
	}
	if(ger=="man"){
		btnMantenimiento.enabled = true;
	}
	if(ger=='cap'){
		btnCapacitacion.enabled = true;
	}
}

// Esta funcion es llamada cualdo se carga el XML satisfactoriamente
private function lvueloResultHandler(event:ResultEvent):void{

/* 	var t:Timer = new Timer(1000,1);
	t.addEventListener(TimerEvent.TIMER,refrescar);
 */			
	if(event.result.hasOwnProperty("nil-classes")){
		
		mx.controls.Alert.show("No Existe ninguna programacion para esta aeronave !",'Informacion');
		vuelosCol = new ArrayCollection();
		iniciaRed()
		permisosInicio();
		CursorManager.removeBusyCursor();
		return;
		
	}
	
	if(event.result != null && !event.result.hasOwnProperty("nil-classes")){

			vuelosCol = new ArrayCollection();
	
			if( event.result.wfcvuelos.wfcvuelo  == null) {
				mx.controls.Alert.show("No Existen Vuelos para esta Aeronave !",'Informacion');
			}
			else if ( event.result.wfcvuelos.wfcvuelo is ObjectProxy ) {
				// the response date has only one item
				//mx.controls.Alert.show("Tiene 1 solo Item !");
				// Guarda el resultado de la llamada al XML en un ArrayCollection
			
				vuelosCol =  new ArrayCollection( [event.result.wfcvuelos.wfcvuelo] );
			
			}
			else {
				//mx.controls.Alert.show("Tiene mas de un Item !");
				// Save a reference to the list of bloggers
				vuelosCol = event.result.wfcvuelos.wfcvuelo as ArrayCollection;
			
			}
				// Cambia el cursor de ocupado
				
				iniciaRed();
				permisosInicio();
						
	}
	CursorManager.removeBusyCursor();
}

private function lvueloFaultHandler(event:FaultEvent):void{

	btnVuelo.enabled = false;
	btnMantenimiento.enabled = false;
	// There was an error in loading the XML
	Alert.show ("Fallo la busqueda de vuelos.",'Error');    
	// Hide the busy cursor
	CursorManager.removeBusyCursor();

}

private function nuevoInvokeHandler(event:InvokeEvent):void{

	// Muestra el cursor del mouse ocupado
	CursorManager.setBusyCursor();

}
            
// Esta funcion es llamada cualdo se carga el XML satisfactoriamente
private function nuevoResultHandler(event:ResultEvent):void{

	CursorManager.removeBusyCursor();
	buscarVuelos(equipoActual);
	// Cambia el cursor de ocupado

}

private function nuevoFaultHandler(event:FaultEvent):void{

	// There was an error in loading the XML
	Alert.show (event.fault.message);    
	// Hide the busy cursor
	CursorManager.removeBusyCursor();

}

private function updateInvokeHandler(event:InvokeEvent):void{

	// Muestra el cursor del mouse ocupado
	CursorManager.setBusyCursor();

}
            
// Esta funcion es llamada cualdo se carga el XML satisfactoriamente
private function updateResultHandler(event:ResultEvent):void{

	CursorManager.removeBusyCursor();
	buscarVuelos(equipoActual);
	// Cambia el cursor de ocupado

}

private function updateFaultHandler(event:FaultEvent):void{

	// There was an error in loading the XML
	Alert.show (event.fault.message);    
	// Hide the busy cursor
	CursorManager.removeBusyCursor();

}
private function deleteInvokeHandler(event:InvokeEvent):void{

	// Muestra el cursor del mouse ocupado
	CursorManager.setBusyCursor();

}
            
// Esta funcion es llamada cualdo se carga el XML satisfactoriamente
private function deleteResultHandler(event:ResultEvent):void{

	CursorManager.removeBusyCursor();
	buscarVuelos(equipoActual);
	// Cambia el cursor de ocupado

}

private function deleteFaultHandler(event:FaultEvent):void{

	// There was an error in loading the XML
	//Alert.show (event.fault.message);    
	// Hide the busy cursor
	CursorManager.removeBusyCursor();
	buscarVuelos(equipoActual);

}

private function ltripulInvokeHandler(event:InvokeEvent):void{

	// Muestra el cursor del mouse ocupado
	CursorManager.setBusyCursor();

}
            
// Esta funcion es llamada cualdo se carga el XML satisfactoriamente
private function ltripulResultHandler(event:ResultEvent):void{

	if(event.result.hasOwnProperty("nil-classes")){
		
		CursorManager.removeBusyCursor();
		return;
		
	}
	
	if(event.result != null && !event.result.hasOwnProperty("nil-classes")){

			tripulantesCol = new ArrayCollection();
	
			if( event.result.wfctripulantes.wfctripulante  == null) {
				mx.controls.Alert.show("No Existe ningun tripulante !",'Error');
			}
			else if ( event.result.wfctripulantes.wfctripulante is ObjectProxy ) {

				// Guarda el listado de tripulantes en un array collection
				tripulantesCol =  new ArrayCollection( [event.result.wfctripulantes.wfctripulante] );
			
			}
			else {

				// Guarda el listado de tripulantes en un array collection
				tripulantesCol = event.result.wfctripulantes.wfctripulante as ArrayCollection;
			
			}
				
	}
	CursorManager.removeBusyCursor();

}

private function ltripulFaultHandler(event:FaultEvent):void{

	// There was an error in loading the XML
	Alert.show ("Ha ocurrido un error", 'Tripulaciones');    
	// Hide the busy cursor
	CursorManager.removeBusyCursor();

}

