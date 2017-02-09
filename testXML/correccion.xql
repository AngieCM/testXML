xquery version "3.0";
declare option exist:serialize "method=xhtml media-type=text/html indent=yes";
let $unused := ""

let $tipeText := for $tipeText  in collection('/db/apps/testXML/preguntesxml')/questions/question[type="text"] 
    for $pregunta in request:get-parameter-names()
        return
            if($pregunta = $tipeText/@id) then
    <question id="{$tipeText/@id}">{$tipeText/type}{$tipeText/title}{$tipeText/answer}<respuesta>{request:get-parameter($pregunta, '')}</respuesta>{
        if($tipeText/answer = request:get-parameter($pregunta, ''))then 
    	    <puntos>1</puntos>
    	else
    		<puntos>0</puntos>
    	}
    </question>
    else
    $unused

let $tipeSelect := for $tipeSelect in collection('/db/apps/testXML/preguntesxml')/questions/question[type="select"] 
    for $pregunta in request:get-parameter-names()
        return
            if($pregunta = $tipeSelect/@id) then
    <question id="{$tipeSelect/@id}">{$tipeSelect/type}{$tipeSelect/title}{$tipeSelect/answer}<respuesta>{request:get-parameter($pregunta, '')}</respuesta>{
    	if($tipeSelect/answer = request:get-parameter($pregunta, ''))then 
    		<puntos>1</puntos>
    	else
    		<puntos>0</puntos>
    	}
    </question>
    else
    $unused

let $tipeCheck :=for  $tipeCheck in collection('/db/apps/testXML/preguntesxml')/questions/question[type="checkbox"] 
    for $pregunta in request:get-parameter-names()
        return
            if($pregunta = $tipeCheck/@id) then
    <question id="{$tipeCheck/@id}">{$tipeCheck/type}{$tipeCheck/title}{$tipeCheck/answer}<respuesta>{request:get-parameter($pregunta, '')}</respuesta>{
    	if($tipeCheck/answer = request:get-parameter($pregunta, ''))then 
    		<puntos>1</puntos>
    	else
    		<puntos>0</puntos>
    	}
    </question>
    else
     $unused
     
let $tipeMulti :=for  $tipeMulti in collection('/db/apps/testXML/preguntesxml')/questions/question[type="multiple"] 
    for $pregunta in request:get-parameter-names()
        return
            if($pregunta = $tipeMulti/@id) then
    <question id="{$tipeMulti/@id}">{$tipeMulti/type}{$tipeMulti/title}{$tipeMulti/answer}<respuesta>{request:get-parameter($pregunta, '')}     </respuesta>{
    	if($tipeMulti/answer = request:get-parameter($pregunta, ''))then 
    		<puntos>1</puntos>
    	else
    		<puntos>0</puntos>
    	}
    </question>
     else
    $unused     

let $typeRadio := for $typeRadio in collection('/db/apps/testXML/preguntesxml')/questions/question[type="radio"] 
    for $pregunta in request:get-parameter-names()
        return
            if($pregunta = $typeRadio/@id) then
    <question id="{$typeRadio/@id}">{$typeRadio/type}{$typeRadio/title}{$typeRadio/answer}<respuesta>{request:get-parameter($pregunta, '')}</respuesta>{
    	if($typeRadio/answer = request:get-parameter($pregunta, ''))then 
    	    <puntos>1</puntos>
    	else
    		<puntos>0</puntos>
    	}
    </question>
     else
    $unused
   
let $questions := <questions>
    {$tipeText}
    {$tipeSelect}
    {$tipeCheck}
    {$tipeMulti}
    {$typeRadio}
                </questions>
let  $questions :=  $questions 

return transform:transform($questions, doc("/db/apps/testXML/presentacion.xsl"), ())