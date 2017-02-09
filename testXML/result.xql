xquery version "3.0";
let $tipeText := for $tipeText in collection("/db/apps/testXML/preguntesxml")/questions/question[type="text"]
    order by util:random()
        return <question id="{$tipeText/@id}">{$tipeText/node()[not(name(.)='answer')]}</question>
  
let $tipeSelect := for $tipeSelect in collection("/db/apps/testXML/preguntesxml")/questions/question[type="select"]
    order by util:random()
        return <question id="{$tipeSelect/@id}">{$tipeSelect/node()[not(name(.)='answer')]}</question>
 
let $tipeCheck :=for $tipeCheck in collection("/db/apps/testXML/preguntesxml")/questions/question[type="checkbox"]
    order by util:random()
        return <question id="{$tipeCheck/@id}">{$tipeCheck/node()[not(name(.)='answer')]}</question>
  
let $tipeMulti :=for  $tipeMulti in collection("/db/apps/testXML/preguntesxml")/questions/question[type="multiple"]
    order by util:random()
        return <question id="{$tipeMulti/@id}">{$tipeMulti/node()[not(name(.)='answer')]}</question>
   
let $tipeRadio := for $tipeRadio in collection("/db/apps/testXML/preguntesxml")/questions/question[type="radio"]
    order by util:random()
        return <question id="{$tipeRadio/@id}">{$tipeRadio/node()[not(name(.)='answer')]}</question>
    
let $questions := <questions>
    {$tipeText[position()<3]}
    {$tipeSelect[position()<3]}
    {$tipeCheck[position()<3]}
    {$tipeMulti[position()<3]}
    {$tipeRadio[position()<3]}
                 </questions>
return $questions