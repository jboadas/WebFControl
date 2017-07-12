package lib{

	public class validaciones{
	
		public function validDate(_ai:int, _mei:int, _di:int, _af:int, _mef:int, _df:int):Boolean{
				var today:Date = new Date() ;
				today.setDate(today.getDate() - 60);
				var dia:uint = today.getDate();
				var mes:uint = today.getMonth()+1;
				var year:Number = today.getFullYear();
				var millisecondsPerDay:int = 1000 * 60 * 60 * 24;
				var fFinal:Date = new Date();
				fFinal.setTime(today.getTime() + (365*millisecondsPerDay));
				var diaf:uint = fFinal.getDate();
				var mesf:uint = fFinal.getMonth()+1;
				var yearf:Number = fFinal.getFullYear();
				 
				
				if(comparaFecha(year,mes,dia,_ai,_mei,_di) && comparaFecha(_af,_mef,_df,yearf,mesf,diaf) && comparaFecha(_ai,_mei,_di,_af,_mef,_df)){  // todo validar las condiciones para que la fecha sea valida.
					return true;
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
						
	}
}
