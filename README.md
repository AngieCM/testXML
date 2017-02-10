# testXML

Aplicacion con eXist-DB (eXide) que contiene 10 preguntas de 5 tipos de formulario html.

Las preguntas se cargarán mediante el siguiente procedimiento:

- La aplicación busca las preguntas tipo (p.e. tipo test, tipo select, tipo radio, ...), y elige dos de cada.
- Al terminar la prueba, busca las respuestas y corrige automáticamente, para evitar trampas, con XQL (no con javascript).
- El JavaScript recoge el resultado de la prueba (datos del formulario), mira que todo esté cumplimentado y correcto y envía de forma que XQL pueda corregir fácilmente.
- Escribir el resultado en xml
- Mostrar resultado con xslt
- Validación html, css, xml (con dtd)
