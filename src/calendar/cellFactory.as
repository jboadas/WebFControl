package calendar
{
	
	import mx.controls.Label;
	import mx.core.UIComponent;

	public class cellFactory extends UIComponent{
		
		private var _cols:int;
		private var _rows:int;
		private var _anchoC:int;
		private var _altoC:int;
		private var _origX:int;
		private var _origY:int;
		private var _colorBG:Number;
		private var _colorFG:Number;
		private var _colorLine:Number;
		private var _colorRVuelo:uint;
		
		public function cellFactory()
		{
			super();
			_cols = 24;
			_rows = 365;
			//_anchoC = 32;
			_anchoC = 10;
			_altoC = 30;
			_origX = 0;
			_origY = 0;
			//_colorBG = 0xACC2D5;
			_colorBG = 0xAB8E7E;
			//_colorFG = 0x9BB3CB;
			_colorFG = 0x7EABAB;
			_colorLine = 0x000000;
			_colorRVuelo = 0x0FEBAA;
		}
		
		//measure no funciona se asigna el tamaño manual de acuerdo a este calculo.
		override protected function measure():void {
		    super.measure();

		        this.measuredWidth = _anchoC*_cols;
		        this.measuredHeight = _altoC*_rows;
		        this.width = this.measuredMinWidth;
		        this.height = this.measuredHeight;
		}
		
		public function drawTable(cuwidth:int):UIComponent{
		
			_anchoC = cuwidth / _cols;
			var tabla:UIComponent = new UIComponent();
			var color:Number=_colorFG;
			
			for(var i:uint=0;i<=_rows;i++){
				
				var linHor01:UIComponent =  new UIComponent();
				if(color==_colorFG){
					color=_colorBG
				}
				else{
					color=_colorFG
				}
				linHor01.graphics.lineStyle();
				linHor01.graphics.beginFill(color,1);
				linHor01.graphics.drawRect(_origX,_origY+(i*_altoC),_anchoC*(_cols),_altoC);
				linHor01.graphics.endFill();
				tabla.addChild(linHor01);
			}
			
			for(var j:uint=0;j<=_cols;j++){
				
				var linVer:UIComponent = new UIComponent();
				linVer.graphics.lineStyle();
				linVer.graphics.beginFill(_colorLine,1);
				linVer.graphics.drawRect(j*_anchoC,0,1,_rows*_altoC);
				linVer.graphics.endFill();
				linVer.toolTip=(j+1).toString();
				tabla.addChild(linVer);
				
			}

			return tabla;
		
		}

		public function drawFecha(ano:int,mes:int,dia:int):UIComponent{
		//dibuja las etiquetas de fecha en el panel izquierdo
			var tabla:UIComponent = new UIComponent();
			var color:Number=_colorFG;
			var hoy:Date = new Date();
			//esta fecha debe venir del servidor
			var diaEs:Date = new Date(ano,mes,dia);
			var millisecondsPerDay:int = 1000 * 60 * 60 * 24; // la cantidad de milisegundos por dia
			var nomdia:String = new String;

			
			for(var i:uint=0;i<=_rows;i++){
				
				var linHor01:UIComponent =  new UIComponent();
				if(color==_colorFG){
					color=_colorBG
				}
				else{
					color=_colorFG
				}
				linHor01.graphics.lineStyle();
				linHor01.graphics.beginFill(color,1);
				linHor01.graphics.drawRect(_origX,_origY+(i*_altoC),90,_altoC);
				linHor01.graphics.endFill();
				linHor01.toolTip=(i+1).toString();
				tabla.addChild(linHor01);
				var fecha:Label = new Label();
				// con setTime le asigno la fecha en milisegundos
				// getTime me da la fecha y hora actual en milisegundos y le sumo los milisegundos
				// por dia multiplicado por la cantidad de dias que necesito (i). y asi me calcula
				// los siguientes dias      
				hoy.setTime(diaEs.getTime() + (i*millisecondsPerDay));
				//creo la etiqueta del dia que se esta procesando
				nomdia = nombreDia(hoy.getDay());
				fecha.text=nomdia+"-"+hoy.getDate().toString()+"/"+(hoy.getMonth()+1).toString()+"/"+hoy.getFullYear().toString();
				fecha.x = _origX;
				fecha.y = _origY+(i*_altoC);
				fecha.height = _altoC;
				fecha.width = 90;
				fecha.setStyle("fontSize",9);
				fecha.setStyle("color","Black");
				fecha.toolTip = fecha.text;
				tabla.addChild(fecha);
			}


			return tabla;
		
		}
		
		public function nombreDia(ndia:int):String{
			
			var sdia:String = new String;
			if(ndia == 0){
				sdia = "Do";
			}
			else if(ndia == 1){
				sdia = "Lu";
			}
			else if(ndia == 2){
				sdia = "Ma";
			}
			else if(ndia == 3){
				sdia = "Mi";
			}
			else if(ndia == 4){
				sdia = "Ju";
			}
			else if(ndia == 5){
				sdia = "Vi";
			}
			else{
				sdia = "Sa";
			}
			return sdia;
		}
		
		public function drawHora(cuwidth:int):UIComponent{
		
			
			_anchoC = cuwidth / _cols;
			var tabla:UIComponent = new UIComponent();
			
			for(var j:uint=0;j<=_cols;j++){
				
				var linVer:UIComponent = new UIComponent();
				linVer.graphics.lineStyle();
				linVer.graphics.beginFill(_colorLine,1);
				linVer.graphics.drawRect(j*_anchoC,0,1,50);
				linVer.graphics.endFill();
				linVer.toolTip=(j+1).toString();
				tabla.addChild(linVer);
				if(j!=24){
					var hora:Label = new Label();
					hora.text = getHora(j);
					hora.x = _origX+(j*_anchoC);
					hora.y = _origY+10;
					hora.height = 50;
					hora.width = _anchoC;
					hora.setStyle("fontSize",20);
					hora.toolTip = hora.text;
					tabla.addChild(hora);
				}
				
				
			}

			return tabla;
		
		}
		
		public function getHora(i:int):String{
			
			//var sHora:String = "00:00";
			var sHora:String = "00";
			
			/*
			if(i<24){
				
				if(i<20){
					sHora = (i+5).toString()+":00";
				}
				else{
					sHora = (i-19).toString()+":00";
				}
			}*/
			
			if(i<10){

				//sHora = "0"+i.toString()+":00";
				sHora = "0"+i.toString();
				
			}
			else{

				//sHora = i.toString()+":00";
				sHora = i.toString();
				
			}
			
			return sHora;
		}		
		
		public function getRowHeight():int{
			return _altoC;
		}
		
		public function getColWidth():int{
			return _anchoC;
		}
		
		
	}
}