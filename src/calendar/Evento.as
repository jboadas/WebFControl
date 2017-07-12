package calendar
{
	import flash.filters.DropShadowFilter;
	import flash.filters.GlowFilter;
	
	import mx.core.UIComponent;

	public class Evento extends UIComponent
	{
		private var _ev:UIComponent;
		private var _id:Number;
		//fecha de inicio.
		private var _ai:int; 	//año
		private var _mei:int;	//mes
		private var _di:int;	//dia
		private var _hi:int;	//hora
		private var _mi:Number;	//minutos
		//fecha de final
		private var _af:int;
		private var _mef:int;
		private var _df:int;
		private var _hf:int;
		private var _mf:Number;
		//Datos del evento
		private var _nrovuelo:String;
		private var _operador:String;
		private var _origen:String;
		private var _destino:String;
		private var _tipoEvento:uint;
		private var _status:int;
		private var _descripcion:String;
		//Datos del personal
		private var _cap:int;
		private var _cop:int;
		private var _jcab:int;
		private var _tri1:int;
		private var _tri2:int;
		private var _tri3:int;
		private var _desp:int;
		private var _mec:int;
		
		//listas de chequeo
		//cantidad de items en las de solicitud
		private var _nopesol:int;
		private var _nmansol:int;
		private var _nsegsol:int;
		private var _nadmsol:int;
		
		//cantidad de items en las de ejecucuio
		private var _nopeeje:int;
		private var _nmaneje:int;
		private var _nsegeje:int;
		private var _nadmeje:int;
		
		//variables texto que contienen las listas de chequeo
		// p: pendiente
		// l: listo
		//solicitud
		private var _sopesol:String;
		private var _smansol:String;
		private var _ssegsol:String;
		private var _sadmsol:String;
		//ejecucion
		private var _sopeeje:String;
		private var _smaneje:String;
		private var _ssegeje:String;
		private var _sadmeje:String;
		
		//mensajes de texto del proceso
		private var _topesol:String;
		private var _tmansol:String;
		private var _tsegsol:String;
		private var _tadmsol:String;
		
		private var _topeeje:String;
		private var _tmaneje:String;
		private var _tsegeje:String;
		private var _tadmeje:String;
		
		//en caso de que se cancele el proceso se guarda el usuario que lo cancelo
		//y una justificacion escrita.
		private var _usercancel:String;
		private var _txtcancel:String;
		
		//registro log de comentarios sobre el proceso
		private var _log:String
		
		public function Evento(ai:int,mei:int,di:int,hi:int,mi:int,af:int,mef:int,df:int,hf:int,mf:int)
		{
			
			_ai = ai;
			_mei = mei;
			_di = di;
			_hi = hi;
			_mi = mi;
			
			_af = af;
			_mef = mef;
			_df = df;
			_hf = hf;
			_mf = mf;
			
			_nrovuelo = '0000'
			_operador = 'OPE';
			_origen = "ORG";
			_destino = "DST";
			_descripcion = "Descripcion";
			
			
			//tipo de evento:
			// 0 si es un vuelo
			// 1 si es un mantenimiento
			// 2 si es entrenamiento
			_tipoEvento = 0;
			_status = 0;
			_ev = new UIComponent();
			_id = 0;
			
			_cap = 0;
			_cop = 0;
			_jcab = 0;
			_tri1 = 0;
			_tri2 = 0;
			_tri3 = 0;
			_desp = 0;
			_mec = 0;
			
			//inicializa la cantidad de items de chequeo por lista
			
			_nopesol = 5;
			_sopesol = "ppppp"; //pone todos pendientes p = pendiente l = listo
			_nmansol = 1;
			_smansol = "ppppp";
			_nsegsol = 2;
			_ssegsol = "ppppp";
			_nadmsol = 2;
			_sadmsol = "ppppp";
			
			_nopeeje = 4;
			_sopeeje = "ppppp"; //pone todos pendientes
			_nmaneje = 4;
			_smaneje = "ppppp"; //pone todos pendientes
			_nsegeje = 5;
			_ssegeje = "ppppp"; //pone todos pendientes
			_nadmeje = 4;			
			_sadmeje = "ppppp"; //pone todos pendientes
			
			_topesol = '';
			_tmansol = '';
			_tsegsol = '';
			_tadmsol = '';
			
			_topeeje = '';
			_tmaneje = '';
			_tsegeje = '';
			_tadmeje = '';
			
			_usercancel = '';
			_txtcancel = '';
			
			_log = '';
			
			super();
		}
		//getter y setters de las principales variables de la clase
		
		public function getId():Number{
			return _id;
		}
		public function setId(n:Number):void{
			_id = n;
		}
		public function getAnoIni():int{
			return _ai;
		}
		public function setAnoIni(ai:int):void{
			_ai = ai;
		}
		public function getMesIni():int{
			return _mei
		}
		public function setMesIni(mei:int):void{
			_mei=mei;
		}
		public function getDiaIni():int{
			return _di;
		}
		public function setDiaIni(di:int):void{
			_di = di;
		}
		public function getHorIni():int{
			return _hi;
		}
		public function setHorIni(hi:int):void{
			_hi = hi;
		}
		public function getMinIni():int{
			return _mi;
		}
		public function setMinIni(mi:int):void{
			_mi = mi;
		}
		public function getAnoFin():int{
			return _af;
		}
		public function setAnoFin(af:int):void{
			_af = af;
		}
		public function getMesFin():int{
			return _mef
		}
		public function setMesFin(mef:int):void{
			_mef=mef;
		}
		public function getDiaFin():int{
			return _df;
		}
		public function setDiaFin(df:int):void{
			_df = df;
		}
		public function getHorFin():int{
			return _hf;
		}
		public function setHorFin(hf:int):void{
			_hf = hf;
		}
		public function getMinFin():int{
			return _mf;
		}
		public function setMinFin(mf:int):void{
			_mf = mf;
		}
		public function setnroVuelo(nro:String):void{
			_nrovuelo = nro;
		}
		public function getnroVuelo():String{
			return _nrovuelo;
		}
		public function setOperador(ope:String):void{
			_operador = ope;
		}
		public function getOperador():String{
			return _operador;
		}
		public function setOrigen(org:String):void{
			_origen = org;
		}
		public function getOrigen():String{
			return _origen;
		}
		public function setDestino(des:String):void{
			_destino = des;
		}
		public function getDestino():String{
			return _destino;
		}
		public function setDescripcion(desc:String):void{
			_descripcion = desc;
		}
		public function getDescripcion():String{
			return _descripcion;
		}
		public function setStatus(st:int):void{
			_status = st;
		}
		public function getStatus():int{
			return _status;
		}
		public function setCap(cap:int):void{
			_cap = cap;
		}
		public function getCap():int{
			return _cap;
		}
		public function setCop(cop:int):void{
			_cop = cop;
		}
		public function getCop():int{
			return _cop;
		}
		public function setJcab(jcab:int):void{
			_jcab = jcab;
		}
		public function getJcab():int{
			return _jcab;
		}
		public function setTri1(tri1:int):void{
			_tri1 = tri1;
		}
		public function getTri1():int{
			return _tri1;
		}
		public function setTri2(tri2:int):void{
			_tri2 = tri2;
		}
		public function getTri2():int{
			return _tri2;
		}
		public function setTri3(tri3:int):void{
			_tri3 = tri3;
		}
		public function getTri3():int{
			return _tri3;
		}
		public function setDesp(desp:int):void{
			_desp = desp;
		}
		public function getDesp():int{
			return _desp;
		}
		public function setMec(mec:int):void{
			_mec = mec;
		}
		public function getMec():int{
			return _mec;
		}
		
		public function getItemListaOpe(nItem:int,tipo:int):Boolean{
			//retorna true si el item esta listo
			if(tipo==0){
				if(_sopesol.charAt(nItem-1)=='l'){
					return true;
				}
				else{
					return false;
				}
			}
			else{
				if(_sopeeje.charAt(nItem-1)=='l'){
					return true;
				}
				else{
					return false;
				}
			}
		}
		public function getItemListaMan(nItem:int,tipo:int):Boolean{
			//retorna true si el item esta listo
			if(tipo==0){
				if(_smansol.charAt(nItem-1)=='l'){
					return true;
				}
				else{
					return false;
				}
			}
			else{
				if(_smaneje.charAt(nItem-1)=='l'){
					return true;
				}
				else{
					return false;
				}
			}
		}
		public function getItemListaSeg(nItem:int,tipo:int):Boolean{
			//retorna true si el item esta listo
			if(tipo==0){
				if(_ssegsol.charAt(nItem-1)=='l'){
					return true;
				}
				else{
					return false;
				}
			}
			else{
				if(_ssegeje.charAt(nItem-1)=='l'){
					return true;
				}
				else{
					return false;
				}
			}
		}
		public function getItemListaAdm(nItem:int,tipo:int):Boolean{
			//retorna true si el item esta listo
			if(tipo==0){
				if(_sadmsol.charAt(nItem-1)=='l'){
					return true;
				}
				else{
					return false;
				}
			}
			else{
				if(_sadmeje.charAt(nItem-1)=='l'){
					return true;
				}
				else{
					return false;
				}
			}
		}
		public function setItemListaOpe(nItem:int,listo:Boolean,tipo:int):void{
			// cambia el status de un item de la lista a listo
			//en la posicion nItem
			//tipo solicitud = 0 ejecucion = 1
			//listo= true esta listo false en caso contrario
			var lista:String='';
			var numel:int =0;
			if(tipo==0){
				lista = _sopesol;
				numel = _nopesol;
				_sopesol = trataLista(lista,numel,listo,nItem);		
			}
			else{
				lista = _sopeeje;
				numel = _nopeeje;
				_sopeeje = trataLista(lista,numel,listo,nItem);		
			}
		}
		public function setItemListaMan(nItem:int,listo:Boolean,tipo:int):void{
			// cambia el status de un item de la lista a listo
			//en la posicion nItem
			//tipo solicitud = 0 ejecucion = 1
			//listo= true esta listo false en caso contrario
			var lista:String='';
			var numel:int =0;
			if(tipo==0){
				lista = _smansol;
				numel = _nmansol;
				_smansol = trataLista(lista,numel,listo,nItem);		
			}
			else{
				lista = _smaneje;
				numel = _nmaneje;
				_smaneje = trataLista(lista,numel,listo,nItem);		
			}
		}
		public function setItemListaSeg(nItem:int,listo:Boolean,tipo:int):void{
			// cambia el status de un item de la lista a listo
			//en la posicion nItem
			//tipo solicitud = 0 ejecucion = 1
			//listo= true esta listo false en caso contrario
			var lista:String='';
			var numel:int =0;
			if(tipo==0){
				lista = _ssegsol;
				numel = _nsegsol;
				_ssegsol = trataLista(lista,numel,listo,nItem);		
			}
			else{
				lista = _ssegeje;
				numel = _nsegeje;
				_ssegeje = trataLista(lista,numel,listo,nItem);		
			}
		}
		public function setItemListaAdm(nItem:int,listo:Boolean,tipo:int):void{
			// cambia el status de un item de la lista a listo
			//en la posicion nItem
			//tipo solicitud = 0 ejecucion = 1
			//listo= true esta listo false en caso contrario
			var lista:String='';
			var numel:int =0;
			if(tipo==0){
				lista = _sadmsol;
				numel = _nadmsol;
				_sadmsol = trataLista(lista,numel,listo,nItem);		
			}
			else{
				lista = _sadmeje;
				numel = _nadmeje;
				_sadmeje = trataLista(lista,numel,listo,nItem);		
			}
		}
		
		public function trataLista(lista:String,numel:int,listo:Boolean,nItem:int):String{
			//funcion que coloca la bandera de status en el string 
			//que se guarda en la base de datos.
			var elems:Array = new Array;
			for(var i:int = 0; i<numel; i++){
				elems[i] = lista.charAt(i);
			}
			if(listo==true){
				elems[nItem-1] = 'l'; 
			}else{
				elems[nItem-1] = 'p'; 
			}
			lista = '';
			for(var j:int = 0; j<numel; j++){
				lista = lista + elems[j];
			}
			return lista;
		}		

		public function setListaOpe(l:String,t:int):void{
			if(t==0){
				_sopesol = l;
			}
			else{
				_sopeeje = l;
			}
		}
		public function setListaMan(l:String,t:int):void{
			if(t==0){
				_smansol = l;
			}
			else{
				_smaneje = l;
			}
		}
		public function setListaSeg(l:String,t:int):void{
			if(t==0){
				_ssegsol = l;
			}
			else{
				_ssegeje = l;
			}
		}
		public function setListaAdm(l:String,t:int):void{
			if(t==0){
				_sadmsol = l;
			}
			else{
				_sadmeje = l;
			}
		}
		
		public function getListaOpe(t:int):String{
			if(t==0){
				return _sopesol;
			}
			else{
				return _sopeeje;
			}
		}

		public function getListaMan(t:int):String{
			if(t==0){
				return _smansol;
			}
			else{
				return _smaneje;
			}
		}
		public function getListaSeg(t:int):String{
			if(t==0){
				return _ssegsol;
			}
			else{
				return _ssegeje;
			}
		}
		public function getListaAdm(t:int):String{
			if(t==0){
				return _sadmsol;
			}
			else{
				return _sadmeje;
			}
		}
		public function isListaOpeReady(tipo:int):Boolean{
			var cont:int=0;
			if(tipo==0){
				for(var i:int=0;i<_nopesol;i++){
					if(_sopesol.charAt(i)=='l'){
						cont += 1;
					}
				}
				if(cont == _nopesol){
					return true;
				}
				else{
					return false;
				}
			}
			else{
				for(var j:int=0;j<_nopeeje;j++){
					if(_sopeeje.charAt(j)=='l'){
						cont += 1;
					}
				}
				if(cont == _nopeeje){
					return true;
				}
				else{
					return false;
				}
			}
		}
		public function isListaManReady(tipo:int):Boolean{
			var cont:int=0;
			if(tipo==0){
				for(var i:int=0;i<_nmansol;i++){
					if(_smansol.charAt(i)=='l'){
						cont += 1;
					}
				}
				if(cont == _nmansol){
					return true;
				}
				else{
					return false;
				}
			}
			else{
				for(var j:int=0;j<_nmaneje;j++){
					if(_smaneje.charAt(j)=='l'){
						cont += 1;
					}
				}
				if(cont == _nmaneje){
					return true;
				}
				else{
					return false;
				}
			}
		}
		public function isListaSegReady(tipo:int):Boolean{
			var cont:int=0;
			if(tipo==0){
				for(var i:int=0;i<_nsegsol;i++){
					if(_ssegsol.charAt(i)=='l'){
						cont += 1;
					}
				}
				if(cont == _nsegsol){
					return true;
				}
				else{
					return false;
				}
			}
			else{
				for(var j:int=0;j<_nsegeje;j++){
					if(_ssegeje.charAt(j)=='l'){
						cont += 1;
					}
				}
				if(cont == _nsegeje){
					return true;
				}
				else{
					return false;
				}
			}
		}
		public function isListaAdmReady(tipo:int):Boolean{
			var cont:int=0;
			if(tipo==0){
				for(var i:int=0;i<_nadmsol;i++){
					if(_sadmsol.charAt(i)=='l'){
						cont += 1;
					}
				}
				if(cont == _nadmsol){
					return true;
				}
				else{
					return false;
				}
			}
			else{
				for(var j:int=0;j<_nadmeje;j++){
					if(_sadmeje.charAt(j)=='l'){
						cont += 1;
					}
				}
				if(cont == _nadmeje){
					return true;
				}
				else{
					return false;
				}
			}
		}

		public function getNumOpe(tipo:int):int{
			if(tipo==0){
				return _nopesol;
			}
			else{
				return _nopeeje;
			}
		}
		
		public function getNumMan(tipo:int):int{
			if(tipo==0){
				return _nmansol;
			}
			else{
				return _nmaneje;
			}
		}
		public function getNumSeg(tipo:int):int{
			if(tipo==0){
				return _nsegsol;
			}
			else{
				return _nsegeje;
			}
		}
		public function getNumAdm(tipo:int):int{
			if(tipo==0){
				return _nadmsol;
			}
			else{
				return _nadmeje;
			}
		}
		
		public function getTxtOpe(tipo:int):String{
			if(tipo==0){
				return _topesol;
			}
			else{
				return _topeeje;
			}
		}

		public function getTxtMan(tipo:int):String{
			if(tipo==0){
				return _tmansol;
			}
			else{
				return _tmaneje;
			}
		}

		public function getTxtSeg(tipo:int):String{
			if(tipo==0){
				return _tsegsol;
			}
			else{
				return _tsegeje;
			}
		}
		public function getTxtAdm(tipo:int):String{
			if(tipo==0){
				return _tadmsol;
			}
			else{
				return _tadmeje;
			}
		}
		
		public function setTxtOpe(txt:String, tipo:int):void{
			if(tipo==0){
				_topesol=txt;
			}
			else{
				_topeeje=txt;
			}
		}
		
		public function setTxtMan(txt:String, tipo:int):void{
			if(tipo==0){
				_tmansol=txt;
			}
			else{
				_tmaneje=txt;
			}
		}

		public function setTxtSeg(txt:String, tipo:int):void{
			if(tipo==0){
				_tsegsol=txt;
			}
			else{
				_tsegeje=txt;
			}
		}

		public function setTxtAdm(txt:String, tipo:int):void{
			if(tipo==0){
				_tadmsol=txt;
			}
			else{
				_tadmeje=txt;
			}
		}

		public function existComments():Boolean{
			//funcion que retorna verdad si existe algun comentario de las listas de chequeo
			if(_topesol.length == 0 && _topeeje.length == 0 && _tmansol.length == 0 && _tmaneje.length == 0){
				if(_tsegsol.length == 0 && _tsegeje.length == 0 && _tadmsol.length == 0 && _tadmeje.length == 0){
					return false
				}
				else{
					return true;
				}
			}
			else{
				return true;
			}
		}

		public function getTexListaOpe(num:int,tipo:int):String{
			var liss:Array = new Array();
			var lise:Array = new Array();
			//fase de solicitud
			liss[0] = "Calcular tiempos de vuelo";
			liss[1] = "Calcular millas sobre cada pais";
			liss[2] = "Calcular consumo de combustible";
			liss[3] = "Verificar cantidad de pasajeros";
			liss[4] = "Verificar limitaciones de carga";
			//fase de ejecucion
			lise[0] = "Verificar tripulaciones completas";
			lise[1] = "Solicitar viaticos";
			lise[2] = "Elaborar la solicitud de combustible";
			lise[3] = "Solicitar permisos de vuelo";
			
			if(tipo == 0){
				if(liss.length != _nopesol){
					return "Las listas no coinciden";
				}
				else if(num>liss.length){
					return "La lista no existe";
				}
				else{
					return liss[num-1];
				}				
			}
			else{
				if(lise.length != _nopeeje){
					return "Las listas no coinciden";
				}
				else if(num>lise.length){
					return "La lista no existe";
				}
				else{
					return lise[num-1];
				}				
			}
		}

		public function getTexListaMan(num:int,tipo:int):String{
			var liss:Array = new Array();
			var lise:Array = new Array();
			//fase de solicitud
			liss[0] = "Verificar los permisos";
			//fase de ejecucion
			lise[0] = "Designar TMA para el vuelo";
			lise[1] = "Coordinar equipos en tierra";
			lise[2] = "Efectuar contactos tecnicos en el destino";
			lise[3] = "Verificar los repuestos en el avion";
			
			if(tipo == 0){
				if(liss.length != _nmansol){
					return "Las listas no coinciden";
				}
				else if(num>liss.length){
					return "La lista no existe";
				}
				else{
					return liss[num-1];
				}				
			}
			else{
				if(lise.length != _nmaneje){
					return "Las listas no coinciden";
				}
				else if(num>lise.length){
					return "La lista no existe";
				}
				else{
					return lise[num-1];
				}				
			}
		}

		public function getTexListaSeg(num:int,tipo:int):String{
			var liss:Array = new Array();
			var lise:Array = new Array();
			//fase de solicitud
			liss[0] = "Operaciones";
			liss[1] = "Comercial";
			//fase de ejecucion
			lise[0] = "Operaciones";
			lise[1] = "Comercial";
			lise[2] = "Mantenimiento";
			lise[3] = "Aspectos Administrativos";
			lise[4] = "Dpto. Avsec";
			
			if(tipo == 0){
				if(liss.length != _nsegsol){
					return "Las listas no coinciden";
				}
				else if(num>liss.length){
					return "La lista no existe";
				}
				else{
					return liss[num-1];
				}				
			}
			else{
				if(lise.length != _nsegeje){
					return "Las listas no coinciden";
				}
				else if(num>lise.length){
					return "La lista no existe";
				}
				else{
					return lise[num-1];
				}				
			}
		}

		public function getTexListaAdm(num:int,tipo:int):String{
			var liss:Array = new Array();
			var lise:Array = new Array();
			//fase de solicitud
			liss[0] = "Generar cotizacion";
			liss[1] = "Verificar deposito inicial";
			//fase de ejecucion
			lise[0] = "Pagar Viaticos";
			lise[1] = "Entregar bolsas de trabajo";
			lise[2] = "Cancelar los permisos";
			lise[3] = "Confirmar pago del 100%";
			
			if(tipo == 0){
				if(liss.length != _nadmsol){
					return "Las listas no coinciden";
				}
				else if(num>liss.length){
					return "La lista no existe";
				}
				else{
					return liss[num-1];
				}				
			}
			else{
				if(lise.length != _nadmeje){
					return "Las listas no coinciden";
				}
				else if(num>lise.length){
					return "La lista no existe";
				}
				else{
					return lise[num-1];
				}				
			}
		}

		
		//funcion que retorna la cantidad de milisegundos de una fecha dada
		public function getMilis(ano:int,mes:int,dia:int,hora:int,min:int):Number{
			var fecha:Date = new Date(ano,mes-1,dia,hora,min);
			return fecha.getTime();
		}
		
		//retorna la cantidad de milisegundos de la fecha de inicio del evento
		public function getMilisFecIni():Number{
			return getMilis(_ai,_mei,_di,_hi,_mi);
		}

		//retorna la cantidad de milisegundos de la fecha final del evento
		public function getMilisFecFin():Number{
			return getMilis(_af,_mef,_df,_hf,_mf);
		}

		//los tipos de eventos pueden ser vuelos o mantenimientos
		//cambia el tipo de evento a vuelo.
		public function setVuelo():void{
			_tipoEvento = 0;
		}
		//cambia el tipo de evento a mantenimiento
		public function setMantenimiento():void{
			_tipoEvento = 1;
		}
		public function setEntrenamiento():void{
			_tipoEvento = 2;
		}
		//retorna verdad si el evento es un vuelo
		public function isVuelo():Boolean{
			if(_tipoEvento == 0){
				return true;
			}
			else{
				return false;
			}
		}
		//retorna el tipo de evento 0 si es vuelo 1 si es mantenimiento
		public function getTipo():int{
			return _tipoEvento;
		}
		
		public function setUserCancel(u:String):void{
			_usercancel = u;
		}
		public function getUserCancel():String{
			if(_usercancel==null || _usercancel==''){
				return "none";
			}
			else{
				return _usercancel;
			}
		}
		public function setTxtCancel(t:String):void{
			_txtcancel = t;
		}
		public function getTxtCancel():String{
			if(_txtcancel==null || _txtcancel==''){
				return "none";
			}
			else{
				return _txtcancel;
			}
		}
		public function setLog(l:String):void{
			_log = l;
		}
		public function getLog():String{
			return _log;
		}
		
		//retorna verdad si la fecha es valida 
		//verifica solapamientos de las fechas de inicio y final asi como los bordes del periodo
		public function validDate(a:int,m:int,d:int):Boolean{
			var today:Date = new Date(a,m,d);
			var dia:int = today.getDate();
			var mes:int = today.getMonth()+1;
			var year:Number = today.getFullYear();
			var millisecondsPerDay:int = 1000 * 60 * 60 * 24;
			var fFinal:Date = new Date();
			fFinal.setTime(today.getTime() + (365*millisecondsPerDay));
			var diaf:int = fFinal.getDate();
			var mesf:int = fFinal.getMonth()+1;
			var yearf:Number = fFinal.getFullYear();
			 
			
			if(comparaFecha(year,mes,dia,_ai,_mei,_di) && comparaFecha(_af,_mef,_df,yearf,mesf,diaf) && comparaFecha(_ai,_mei,_di,_af,_mef,_df)){  // todo validar las condiciones para que la fecha sea valida.
				if(fechasIguales(_ai,_mei,_di,_af,_mef,_df)){
					if(comparaHoras(_hi,_mi,_hf,_mf)){
						return true;
					}
					else{
						return false;
					}
					
				}
				else{
					return true;
				}
			}
			else{
				return false;
			}
			
		}
		
		public function comparaFecha(ano1:int, mes1:int, dia1:int, ano2:int, mes2:int, dia2:int ):Boolean{
 			// devuelve verdad en caso que fecha1 sea menor o igual que fecha 2
 			//Valores de retorno
 			//Falso: fecha1(ano1,mes1,dia1) es mayor que fecha2(ano2,mes2,dia2)
			//Verdad: fecha1 es igual a la fecha2
			//Verdad: fecha1 es menor que fecha2
 			
 			var ano:int;
 			var mes:int;
 			var dia:int;
 			ano = ano1 - ano2;//comparo los años.
 			mes = mes1 - mes2;//comparo los meses.
 			dia = dia1 - dia2;//comparo los dias.
 			if(ano < 0)  return true;
 			else if(ano > 0) return false;
 			else if(mes < 0) return true;
 			else if(mes > 0) return false;
 			else if(dia < 0) return true;
 			else if(dia > 0) return false;
 			else    return true;
		}
		
		//retorna verdad si dos fechas son iguales
		public function fechasIguales(ano1:int, mes1:int, dia1:int, ano2:int, mes2:int, dia2:int):Boolean{
 			var ano:int;
 			var mes:int;
 			var dia:int;
 			ano = ano1 - ano2;//comparo los años.
 			mes = mes1 - mes2;//comparo los meses.
 			dia = dia1 - dia2;//comparo los dias.
			if(ano==0 && mes==0 && dia==0){
				return true;
			}
			else{
				return false;
			}			
		}
		
		//retorna verdad si 2 horas son diferentes
		public function comparaHoras(h1:int,m1:int,h2:int,m2:int):Boolean{
			//retorna verdad siempre que la segunda hora sea mayor que la primera
			var hora:int;
			var min:int;
			hora = h1 - h2;
			min = m1-m2;
			if(hora < 0) return true; //en caso de que la segunda hora sea mayor retorno verdad
			else if(hora > 0 ) return false;
			else if(min < 0) return true;
			else if(min > 0) return false;
			else return false; //en caso de que las horas sean iguales retorna falso
		}
		
		public function rellCeros(dig:int):String{
			if(dig<10)
			{
				return '0'+dig.toString();
			}
			else
			{
				return dig.toString();
			}
		}
				
		//funcion que se encarga de dibujar el componente
		public function draw(a:int,m:int,d:int, ancho:int):UIComponent{
			
			var tttemp:String;
			var color:int;
			//var anchoC:int = 32;
			var anchoC:int = ancho / 24;
			var altoC:int = 30;
			var fil:int = 0;
			var horas:int = calcHoras();
			//var numFilas:int = ((_hi+horas)/24);
			var numFilas:int = calcDias();
			var altoM:int = 10; // margen inferior de la fila
			var yM:int = 0; //margen superior de la fila
			
			//0 si es un vuelo y en caso contrario es un mantenimiento
			if(_tipoEvento == 0){
				if(_status < 50){
					color = 0x0098FF;
				}
				else{
					color = 0x000066;
				}
				if(_status == 110){
					color = 0x00FF00;
				}
				if((_status == 15) || (_status == 17)){
					color = 0x999999
				}
			}
			else if(_tipoEvento == 1){
				// por defecto coloca el mantenimiento programado
				color = 0xCC6600;
				if (_status != 0){ // si el mantenimiento no esta programado
					color = 0xCC0000;
				}
				yM = 5;
				altoM = 10;
			}
			else{
				// Capacitacion Tiene un solo color
				color = 0x550055;
				yM = 5;
				altoM = 19;
				
			}
			
			
			
			if(validDate(a,m,d)){
				fil = calcIniFila(a,m,d);
				//var shadow:DropShadowFilter = new DropShadowFilter();

				_ev.graphics.lineStyle(3,0x000000);
				_ev.graphics.beginFill(color,1);
				if(numFilas<1){
					_ev.graphics.drawRoundRect((_hi*anchoC)+((anchoC/60)*_mi),(fil*altoC)+yM,((_hf*anchoC)+((anchoC/60)*_mf)-((_hi*anchoC)+((anchoC/60)*_mi))),altoC-altoM,5,5);
					//_ev.graphics.drawRoundRect((_hi*anchoC)+(_mi/2),(fil*altoC)+yM,((_hf*anchoC)+(_mf/2))-((_hi*anchoC)+(_mi/2)),altoC-altoM,10,10);
					//_ev.graphics.drawRect((_hi*anchoC)+(_mi/2),(fil*altoC)+yM,((_hf*anchoC)+(_mf/2))-((_hi*anchoC)+(_mi/2)),altoC-altoM);
				}
				else{
					//for para dibujar varias lineas, eventos que duran varios dias
					for(var i:int=0;i<=numFilas;i++){
						if(i==0){
							_ev.graphics.drawRoundRect((_hi*anchoC)+((anchoC/60)*_mi),(fil*altoC)+yM,(((24-_hi)*anchoC)-((anchoC/60)*_mi)),altoC-altoM,5,5);
						}
						if(i==numFilas){
							_ev.graphics.drawRoundRect(0,((fil+i)*altoC)+yM,((_hf*anchoC)+((anchoC/60)*_mf)),altoC-altoM,5,5);
						}
						if((i!=0)&&(i!=numFilas)){
							_ev.graphics.drawRoundRect(0,((fil+i)*altoC)+yM,(24*anchoC),altoC-altoM,5,5);
						}
					}				
				}
				_ev.graphics.endFill();
				if(this.isVuelo()){
					if(_operador==null){
						_operador = "Sin Operador";
					}
				 	if(_operador==null){
						_nrovuelo = '0000';
					}
					tttemp ='Despegue: '+rellCeros(_di)+'/'+rellCeros(_mei)+'/'+_ai.toString()+'-'+rellCeros(_hi)+':'+rellCeros(_mi)+'\n';
					tttemp = tttemp+'Aterrizaje: '+rellCeros(_df)+'/'+rellCeros(_mef)+'/'+_af.toString()+'-'+rellCeros(_hf)+':'+rellCeros(_mf)+'\n';
					tttemp = tttemp +'Operador: '+_operador+'\n'+'Ruta: '+_origen+" / "+_destino;
					_ev.toolTip= tttemp;
					//_ev.filters = [shadow];
				}
				else{
					tttemp ='Desde: '+rellCeros(_di)+'/'+rellCeros(_mei)+'/'+_ai.toString()+'-'+rellCeros(_hi)+':'+rellCeros(_mi)+'\n';
					tttemp = tttemp+'Hasta: '+rellCeros(_df)+'/'+rellCeros(_mef)+'/'+_af.toString()+'-'+rellCeros(_hf)+':'+rellCeros(_mf)+'\n';
					tttemp = tttemp+_descripcion;
					_ev.toolTip = tttemp;
					//_ev.filters = [shadow];
				}
				
				_ev.id = this.getId().toString();
				return _ev; 			
				
			}
			else{
				return null;
			}
			
		}
		
		// funcion que aplica el filtro glow a el evento actual
		public function efectosEvento(sn:Boolean):void{
			var shadow:DropShadowFilter = new DropShadowFilter();
			var glow:GlowFilter = new GlowFilter();
			glow.color = 0xFFFF99;
			glow.alpha = 1;
			glow.blurX = 25;
			glow.blurY = 25;

			if(sn==true){
				
				_ev.filters = [glow];	
			}
			else{
				//_ev.filters = [shadow];
			}

		}
		//funcion utilitaria para calcular una fila de inicio del evento en la tabla
		public function calcIniFila(a1:int,m1:int,d1:int):int{
			
			var millisecondsPerDay:int = 1000 * 60 * 60 * 24;
			var today:Date = new Date(a1,m1,d1);
			var hoy:Date = new Date(today.getFullYear(),today.getMonth(),today.getDate());
			var fechaEv:Date = new Date(_ai,_mei-1,_di);
			var cantMili:Number = fechaEv.getTime() - hoy.getTime();
			var cantDias:int = cantMili/millisecondsPerDay;
			return cantDias;
		
		}
		
		//esta funcion se usa para verificar que la cantidad de filas sea igual o mayor que 1
		public function calcHoras():int{
			
			var milisPorHora:int = 1000 * 60 * 60;
			var milisPorDia:int = milisPorHora * 24;
			
			var fechaI:Date = new Date(_ai,_mei,_di,_hi,_mi);
			var fechaF:Date = new Date(_af,_mef,_df,_hf,_mf);
			var cantMili:Number = fechaF.getTime() - fechaI.getTime();
			var horas:int = cantMili/milisPorHora;
			return (horas);
			
		}
		
		public function calcDias():int{

			var milisPorHora:int = 1000 * 60 * 60;
			var milisPorDia:int = milisPorHora * 24;
			
			var fechaI:Date = new Date(_ai,_mei,_di);
			var fechaF:Date = new Date(_af,_mef,_df);
			var cantMili:Number = fechaF.getTime() - fechaI.getTime();
			var dias:int = cantMili/milisPorDia;
			if((!fechasIguales(_ai,_mei,_di,_af,_mef,_df)) && (dias == 0)){
				dias = 1;
			}
			return (dias);
			
		}

	}
}