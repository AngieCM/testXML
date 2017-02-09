function gestionarXml(dadesXml){
    var xmlDoc = dadesXml.responseXML;
    var maxNode = xmlDoc.getElementsByTagName("title").length;
    var pregunta = null;
    var tipo = null;
    var id = null;
    var cargaOpcion = null;
    var opciones = null;
    var html = "";

    for(i=0; i<maxNode;i++) {
        pregunta = xmlDoc.getElementsByTagName("title")[i].childNodes[0].nodeValue;
        tipo = xmlDoc.getElementsByTagName("type")[i].childNodes[0].nodeValue;
        id = xmlDoc.getElementsByTagName("question")[i].getAttribute("id");

        html += "<tr>";
		html += "<td style=\"width: auto;\">";
		
		if(tipo == "text"){
		   html += "<fieldset>"
		   html += "<label>"+pregunta+"<\/label>"
		   html += "<br/>"
		   html += "<input type=\"text\" name=\""+id+"\"\/>"; 
		   html += "<br/>"
		   html += "</fieldset>"
		   html += "<br/>"
		   
		} else if (tipo == "select"){
		    cargaOpcion = xmlDoc.getElementById(id).getElementsByTagName('option').length;
		    html += "<hr/>"
            html += "<label>"+pregunta+"<\/label><br/>";
            html += "<select name=\""+id+"\">"
            for (j = 0; j < cargaOpcion; j++) { 
                opciones = xmlDoc.getElementById(id).getElementsByTagName('option')[j].childNodes[0].nodeValue;
                html += "<option type=\"select\" name=\"option\" value=\""+j+"\">"+opciones+"<br/>";
            } 
             html += "</select>"
             html += "<br/>"
		    
		} else if (tipo == "checkbox"){
		    cargaOpcion = xmlDoc.getElementById(id).getElementsByTagName('option').length;
		    html += "<hr/>"
            html += "<label>"+pregunta+"<\/label><br/>";
            for (j = 0; j < cargaOpcion; j++) { 
                opciones = xmlDoc.getElementById(id).getElementsByTagName('option')[j].childNodes[0].nodeValue;
                html += "<input type=\"checkbox\" name=\""+id+"\" value=\""+j+"\">"+opciones+"<br/>";
            } 
            
		} else if (tipo == "multiple"){
		    cargaOpcion = xmlDoc.getElementById(id).getElementsByTagName('option').length;
		    html += "<hr/>"
            html += "<label>"+pregunta+"<\/label><br/>";
            html += "<select multiple name=\""+id+"\">"
            for (j = 0; j < cargaOpcion; j++) { 
                opciones = xmlDoc.getElementById(id).getElementsByTagName('option')[j].childNodes[0].nodeValue;
                html += "<option type=\"select\" name=\"option\" value=\""+j+"\">"+opciones+"<br/>";
            } 
            html += "</select>"
            html += "<br/>"

		} else if (tipo == "radio"){
		    cargaOpcion = xmlDoc.getElementById(id).getElementsByTagName('option').length;
		    html += "<hr/>"
            html += "<label>"+pregunta+"<\/label><br/>";
            for (j = 0; j < cargaOpcion; j++) { 
                opciones = xmlDoc.getElementById(id).getElementsByTagName('option')[j].childNodes[0].nodeValue;
                html += "<input type=\"radio\" name=\""+id+"\"  value=\""+j+"\">"+opciones+"<br/>";
            }
		}

		html += "<\/td>";
        html += "<\/tr>";
    }  
    document.getElementById("preguntas").innerHTML = html;
}

//******************************************************************************
window.onload = function(){
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            gestionarXml(this);
        }
};

xhttp.open("GET", "result.xql", true);
xhttp.send();
}

function contruirXmlRespuestas(){
    var arrayId = xmlIdPreguntas.split("#");
    var xmlRespuestas = null;
    var respuesta = null;
    xmlRespuestas = "<Resultados>";

    for (i = 0; i < arrayId.length; i++) { 
        if(document.getElementById(arrayId[i]) != null){
           respuesta = document.getElementById(arrayId[i]).value;
           xmlRespuestas += "<Respuesta id=\""+arrayId[i]+"\">"+respuesta+"<\/Respuesta>"; 
        }
    }
    xmlRespuestas += "</Resultados>";
    alert(xmlRespuestas);
    document.getElementById("resultadoxml").value = xmlRespuestas;
    document.formulariopreguntas.submit();
}