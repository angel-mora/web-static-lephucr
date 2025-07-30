---
title: Remove Emojis Using Regex
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary: "\U0001F64B **You:**  regex to remove emojis?"
draft: false
---

# Remove Emojis Using Regex

## ✅ TODOs
- [ ] momento en nuestra vida. Se trata de una configuración tecnológica de la realidad 🖥️, una disposición de las cosas para que la gente actúe y responda frente a ellas de cierto modo. En la era de información, el rostro del totalitarismo se confunde en un virus capitalista 😷 que ciertamente ha dominado la nuda vida: en la sociedad no hay vida así sin más. Corporaciones 🏢, máquinas 🤖 y aparatos ejercen su poder sin ninguna resistencia organizada capaz de proponer una alternativa universal al estado actual de las cosas.
- [ ] grado de interioridad en la vida psíquica de las personas, pues la Ley 📜 ha pasado a ser la norma, a estar completamente internalizada. Nuestras relaciones son espectaculares 🎇 porque están mediadas a través de la representación cibernética 💻 y nuestro deseo bajo el Biopoder, porque la industria farmacopornográfica 💊🔞 se encarga de generar dinero 💰 de la enfermedad y de la frustración sexual. La cibernética es el arte del control 🎮, la disciplina propia de tiempos donde la información 📡 se vuelve la mercancía que más valor produce.
- [ ] es perfecto porque es como es y no pudo haber sido de otra forma porque ya es ✨. No tenemos portal guns 🔫 para desdoblar el espacio tiempo 🌌. Sin haber vivido lo vivido 📖, no entenderíamos lo que hoy tenemos 🌱, y el único terreno donde se puede disputar la realidad es aquí (donde estés) 📍 y a partir de ahora ⏰. En un plano más relativo, diría que al grupo de La Partida nos faltó operatividad 🛠️, puesta en escena 🎭, implementación ⚙️. Es difícil. Muchas cuerpas 💃, muchos deseos ❤️. A veces los dispositivos de poder nos desbordan 🌊, trascienden nuestra capacidad, yacen en el campo de lo inconsciente 😴. Mucho ego 🦚. Me incluyo en todo momento 🙋‍♂️. Sin embargo, La Partida es quizá más ese espíritu que vive en todex y que forma una complicidad en el tiempo 🌈. Quizá.
- [ ] mi corazón 💖 la realización de su forma de vida a las madres que buscan a sus desaparecidos 💔, así como a quienes en lo molecular somos parte del entramado sádico de relaciones de poder 💥 que dan forma a la sociedad 🌐. Todavía sigo creyendo que hay muchas personas que nos faltan 🙏, sin embargo hoy no me siento capaz de enunciar los cánticos tradicionales del activismo 📢. No sufro de sus mismos dolores 💢, ni es mi dolor necesitado para nadie 🚫. No es mi forma particular de habitar el espectáculo 🎭. Sin embargo, todex somos seres sufrientes 😢 pero trascender esa condición escapa a la teoría 📚.
- [ ] s los aspectos de la vida pública y privada.

## 🧠 Full Chat

🙋 **You:**

regex to remove emojis?

---

🤖 **Assistant:**

To remove emojis from a string using regex in Python, you can use the following pattern. This regex pattern matches most common emojis and can be used with the `re` module to substitute them with an empty string.

Here's how you can do it:

```python
import re

def remove_emojis(text):
    emoji_pattern = re.compile(
        "["
        "\U0001F600-\U0001F64F"  # emoticons
        "\U0001F300-\U0001F5FF"  # symbols & pictographs
        "\U0001F680-\U0001F6FF"  # transport & map symbols
        "\U0001F700-\U0001F77F"  # alchemical symbols
        "\U0001F780-\U0001F7FF"  # Geometric Shapes Extended
        "\U0001F800-\U0001F8FF"  # Supplemental Arrows-C
        "\U0001F900-\U0001F9FF"  # Supplemental Symbols and Pictographs
        "\U0001FA00-\U0001FA6F"  # Chess Symbols
        "\U0001FA70-\U0001FAFF"  # Symbols and Pictographs Extended-A
        "\U00002702-\U000027B0"  # Dingbats
        "\U000024C2-\U0001F251"
        "]+",
        flags=re.UNICODE)
    
    return emoji_pattern.sub(r'', text)

# Example usage
text_with_emojis = "Hello 😊! This is a test text with emojis 🚀🌟."
clean_text = remove_emojis(text_with_emojis)
print(clean_text)
```

This function will remove emojis from the input text string. You can adjust the emoji ranges in the pattern if needed, but the provided ranges cover a wide array of common emojis.

---

🙋 **You:**

with ruby or within vscode find and replace?

---

🤖 **Assistant:**

To remove emojis using Ruby or within Visual Studio Code's Find and Replace feature, you can use the following methods:

### In Ruby:

You can use the `gsub` method with a regex pattern similar to the one used in Python.

```ruby
def remove_emojis(text)
  emoji_pattern = /[\u{1F600}-\u{1F64F}\u{1F300}-\u{1F5FF}\u{1F680}-\u{1F6FF}\u{1F700}-\u{1F77F}\u{1F780}-\u{1F7FF}\u{1F800}-\u{1F8FF}\u{1F900}-\u{1F9FF}\u{1FA00}-\u{1FA6F}\u{1FA70}-\u{1FAFF}\u{2702}-\u{27B0}\u{24C2}-\u{1F251}]/

  text.gsub(emoji_pattern, '')
end

# Example usage
text_with_emojis = "Hello 😊! This is a test text with emojis 🚀🌟."
clean_text = remove_emojis(text_with_emojis)
puts clean_text
```

This Ruby method will remove emojis from the input text string.

### In Visual Studio Code (Find and Replace):

To remove emojis using Visual Studio Code's Find and Replace feature, you can use a similar regex pattern. Follow these steps:

1. Open the Find and Replace tool in VS Code (`Ctrl+H` on Windows/Linux, `Cmd+Option+F` on macOS).
2. In the "Find" field, enter the following regex pattern:

```
[\u{1F600}-\u{1F64F}\u{1F300}-\u{1F5FF}\u{1F680}-\u{1F6FF}\u{1F700}-\u{1F77F}\u{1F780}-\u{1F7FF}\u{1F800}-\u{1F8FF}\u{1F900}-\u{1F9FF}\u{1FA00}-\u{1FA6F}\u{1FA70}-\u{1FAFF}\u{2702}-\u{27B0}\u{24C2}-\u{1F251}]
```

3. Make sure to enable regex search by clicking the `.*` button or pressing `Alt+R`.
4. Leave the "Replace" field empty.
5. Click "Replace All" to remove all emojis from your text.

These methods will help you remove emojis from text in Ruby or using Visual Studio Code's Find and Replace feature.

---

🙋 **You:**

Pattern for this text
No vivimos por sino a pesar del capitalismo 🏭, toda relación social está mediada por las mercancías 🛍️. Y el capitalismo ganó hace mucho 💰.

¿Cuáles son las posibilidades de actuar en en el momento más incierto 😕 y más absurdo 🤪 de la Historia desde mi circunstancia específica?

Mientras cientos de activistas marchan religiosamente exigiendo al gobierno 🏛️ (como si hubiera, de hecho, algo ahí que responda al llamado) un mundo más libre 🕊️, más justo ⚖️, más ecológico 🌳, los males propios de nuestro tiempo están presentes en todo momento en nuestra vida. Se trata de una configuración tecnológica de la realidad 🖥️, una disposición de las cosas para que la gente actúe y responda frente a ellas de cierto modo. En la era de información, el rostro del totalitarismo se confunde en un virus capitalista 😷 que ciertamente ha dominado la nuda vida: en la sociedad no hay vida así sin más. Corporaciones 🏢, máquinas 🤖 y aparatos ejercen su poder sin ninguna resistencia organizada capaz de proponer una alternativa universal al estado actual de las cosas.

Vivimos una imperceptible guerra civil 🌐 en la que el enemigo a vencer no está ni siquiera en el montón de idiotas que rigen las corporaciones y los gobiernos nacionales 🏫 sino en una religiosidad 🙏 que profesa simpatía por la dominación mercantil 🛒. La Iglesia de esta fe se llama Estado moderno y en su génesis se encuentra la posibilidad misma de su destitución. En este texto contribuyo a analizar la relación entre Estado, capitalismo y mercados 🌐, así como el funcionamiento de la forma Estado como si se tratase de una ingeniería inversa, de un hackeo 🛠️, pues el Leviatán funciona a partir de máquinas y de aparatos de captura, tiene agentes pagados 💵 que se encargan de cumplir diversas funciones alrededor del proceso de extracción de valor. Además de agentes, posee ejércitos 💂‍♂️, fuerza de trabajo 👷 que alimenta cada día la interacción entre mercados, que a su vez se vuelve el único medio por el cual es posible adquirir los medios de subsistencia. Sin embargo, el virus capitalista 😷 hace de cualquier necesidad un producto y del deseo, interés.

...

Escribí el primer libro 📖. Lo escribimos, más bien. Varias pedas 🍻, mariguaneadas 🌿, debates políticos 🗣️ y así, fueron el caldo de cultivo de esta escrita. Nació en la regadera de un baño cochino 🚽 donde estaban hangueando unex poetex. Apestaba a mona, estuvo cagado. TanLang. Se lo vendí a gente de Wikipolítica en un encuentro en Monterrey.

Fue el primer texto que ahora da forma a esta compilación 📚. El segundo fue un esfuerzo por autopublicar en 2018 📅 que me llevó a tener la oportunidad de trabajar con el gran @aradnix 🤝. Empecé a programar 💻 según yo para poder hacer este libro 📖. Me tomó 5 años 📆. Pero en el proceso terminé lo de la Acción Crítica 💭 para recuperar mi alma de la madre UNAM 🎓.
Así, este libro 📚 presentado también como un repo de GitHub 💻 tiene en su log 📝 el proceso de revisitar ambos textos desde algunas cosas un poco más claras 🔍 y extendidas en relación con la tecnocrítica 🖥️🔍.
Plantar Cara al Pasado para Imaginar el Porvenir 🌱🔮 es básicamente un argumento sobre el futuro de personas que veíamos en Wikipolítica una serie de referencias más de lucha 💪, resistencia ✊ y crítica 🧐.
LEPHUCR 📃 es un intento divulgativo por compartir una suerte de visión 👁️ alrededor de una lucha social en un común con gente de mi generación, en el contexto de México 🇲🇽, desde lo público y ahondando poco en la relación entre la teoría 📚 y mi propia situación actual de programador priviledged 💻🌟 que pasó de la teoría a una forma más cibernética de hacer 🤖. Como una anécdota personal, la referencia que hago al repositorio de Decidim fue lo que me motivó a aprender Ruby on Rails y comenzar mi carrera como programador 💡💼.
Sobre la Acción Crítica 📝 ahonda sobre mi inquietud personal con el movimiento neorreaccionario 🌐 y la derecha alternativa en Estados Unidos 🇺🇸. A partir de algunos síntomas estéticos de la cultura contemporánea, trato de plantear algunos problemas históricos 📜 sobre la crisis del Estado contemporáneo 🏛️. Se centra alrededor de una alternativa al status quo 💡.

Plantar cara fue en marzo 2018 📅. LEPHUCR nunca fue publicado 🚫📚. Muy probablemente pausé en 2020 🔄. Terminé Sobre la Acción Crítica en 2021 🎉. Me parece un largo camino el emprendido desde entonces hasta hoy que escribo más código que otras formas más libres 🚶‍♂️💻. Y que la realidad de mi segmento de mercado me alcanzó 📈. Esta compilación tiene la caca 💩 de mi proceso psicoanalítico 💭 y no pretendo que hable de otro lugar que no sea desde el mío 🗣️. Ha significado para mí la decisión de hacer de La Partida algo ajeno a mí, que me encantaría me rebase 🏃‍♂️. Es quizá por eso que este texto no vio la luz de otras miradas 👀 sino hasta casi 5 años después de haber sido concebido y 3 años de casi terminado ⏳.

Después de repasar estos textos para editarlos en conjunto 📖✂️, me di cuenta de que hay cosas que doy por sentadas 🤔 y no defino explícitamente. Esa multitud a la que me refiero constantemente 👥, esa subjetividad indeterminada, el sé de Tiqqun, estaba compuesta por muchas personas que teníamos un sentimiento 💭 y compartimos una pasión ❤️ por otras formas políticas más... radicales, quizá? que las elecciones 🗳️. Y alimentada mucho mucho mucho por el Comité Invisible 👻 y más adelante por Tiqqun. Y por algunos debates de alto nivel (por lo superficiales) sobre posturas como la de Inventar el Futuro de Nick Srnicek 🌐. El call to action en general es el mismo que el planteado en LEPHUCR. Crear un rizoma de organizaciones con fines que trasciendan la narrativa de la historia contemporánea 🌿🤝.

Tengo que confesar que pasé del tecnosolucionismo 🤖 a la misma conclusión de antes: se necesita una formación colectiva capaz de observar los agenciamientos de captura 🕵️‍♀️ y de accionar en esos contextos. Se necesitar disponer-se. Las conspiraciones se construyen de la astucia constante de sus agentes 🦊. De lo incansable de sus esfuerzos 💪. Y esos esfuerzos son también escritura ✍️, instrucciones, sistemas.

Respecto al tono del texto, esta primera versión transita de una lírica íntima 🎼 hasta un texto mucho más académico 🎓 e impersonal, sin dejar de hacer algunas referencias a mi contexto como escritore 📝. LEPHUCR es un punto intermedio, que pese a que surge de la sensibilidad, sobre una serie de apreciaciones sobre experiencias de mis primeros años de vida universitaria 🏫, tiene como línea discursiva casi total lo público. En ese sentido, está dispuesto al afuera. Un mix débil entre la narrativa de los politólogos sobre la Elección Pública y la estirpe de Saul Alinsky. Pero en el terreno hay mucho más allá que solo lo público. Y es ahí donde es necesario analizar la dominación mercantil como proceso, flujo e historia 🌊.

Volviendo a las referencias, quisiera añadir que sería imposible ahondar con suficiente profundidad en los contenidos de este texto, particularmente la segunda y tercera parte que involucran un análisis más intenso del capitalismo 💼, sin una revisión de Capitalismo y Esquizofrenia, particularmente los capítulos sobre la Máquina de Guerra y el Aparato de Captura 📚.
...

🏭 Con la caída del modelo de producción fordista y la pulverización de la fábrica, nos encontramos no solo frente a un momento de crisis en el modelo de trabajo del hombre-masa 🚶‍♂️, sino también frente a la acelerada pauperización de las resistencias y disidencias políticas 💥. El Imperio 🌐 se caracteriza por un reconocimiento cínico de la imposibilidad del proyecto universalista del Estado 🏛️. Entonces, la policía 👮 y la publicidad 📺, mecanismos del Estado moderno, se transforman en Espectáculo 🎭 y Biopoder 💉. Se borra todo grado de interioridad en la vida psíquica de las personas, pues la Ley 📜 ha pasado a ser la norma, a estar completamente internalizada. Nuestras relaciones son espectaculares 🎇 porque están mediadas a través de la representación cibernética 💻 y nuestro deseo bajo el Biopoder, porque la industria farmacopornográfica 💊🔞 se encarga de generar dinero 💰 de la enfermedad y de la frustración sexual. La cibernética es el arte del control 🎮, la disciplina propia de tiempos donde la información 📡 se vuelve la mercancía que más valor produce.

Frente al sinsentido contemporáneo 😕, el sujeto experimenta también una crisis profunda 🌀. El Comité Invisible 🕴️‍♀️ llama Bloom al hombre-masa que se encuentra en el límite de la deserción, frustrado y castrado, enfermo de nihilismo 🕳️ y dispuesto al afuera. Sin embargo, la redención de esta forma masculina ha producido un Partido de la nada 🚩, la neorreacción 🌪️, con una agenda tecnoutópica 🌐🤖 cuyo fin es hacer total el poder de la cibernética imperial. El Bloom es un hombre cínico 😒 que ha perdido incluso el significado que le daba el trabajo como recompensa frente a la alienación de verse reducido a un mero instrumento en una cadena de producción viva 🏭🔗. Su fuerza vital es capturada por los agentes del Estado 🕵️ encargados de producir el deseo de Estado para alimentar una posición totalitaria y exterminista 👁️🚫 detrás de la que en realidad se oculta un profundo sentimiento infantil de abandono y represión sexual 😢.

📉 Un evento muy importante que tener en mente fue que Wikipolítica fracasó. El partido Futuro Jalisco impulsado por la gente con el hambre electoral 🗳️ y el trabajo de campo necesario para lanzarse a la búsqueda de un presupuesto para competir 💸. No quisiera hablar demasiado sobre el tema más que lo que ya trata LEPHUCR, por ejemplo. Me conformo por señalar que el grupo dominante no supo construir una sinergia de sus grupos adversarios 🤝 ni continuar con el desarrollo de una cultura organizacional 🌱. Algo muy triste para un proyecto "wiki" 📚. La intención de los primeros textos fue socializar algunas ideas para militantes de Wikipolítica que venían de un contexto muy fresa 🍓 y poco socializado con otras prácticas políticas, que no tenían una formación teórica 🎓 y que no tenían una visión de la política como una práctica social 💡. La idea era que se pudieran organizar en grupos de trabajo 👥 y que pudieran hacer algo. Algo que no fuera una campaña electoral 🚫🗳️. Algo que no fuera una marcha 🚫🚶‍♂️.

En medio del fracaso de Wikipolítica 😔 (cuyo capital social fue absorbido por unas cuantas carreras políticas 🏃‍♂️), tuve que afrontar mi realidad material 💼. Gracias a ello, mi condición real de trabajador comenzó con mayor seriedad hasta abril del 2019 📅. Mucho más Leonor Silvestri 📚. Mucho más entendimiento del capital especulativo 💹. Mucho más experiencia del trabajo sobre mi cuerpo 🏋️‍♂️. Ambas vertientes, molar y molecular, rebasadas unas veces, exhaustadas otras 🔄. Quizá ya se podrían contar en kilos los gramos de mota que me he fumado desde entonces 🌿😵, y en galones la cantidad de semen que he desperdiciado con la pornografía 🔞🗑️. Quizá desde entonces he entendido el operaísmo desde otra posición que no fuera la del antropólogo 🎭...

¿Qué nos faltó en Wikipolítica? 🤔 De alguna manera todo es perfecto porque es como es y no pudo haber sido de otra forma porque ya es ✨. No tenemos portal guns 🔫 para desdoblar el espacio tiempo 🌌. Sin haber vivido lo vivido 📖, no entenderíamos lo que hoy tenemos 🌱, y el único terreno donde se puede disputar la realidad es aquí (donde estés) 📍 y a partir de ahora ⏰. En un plano más relativo, diría que al grupo de La Partida nos faltó operatividad 🛠️, puesta en escena 🎭, implementación ⚙️. Es difícil. Muchas cuerpas 💃, muchos deseos ❤️. A veces los dispositivos de poder nos desbordan 🌊, trascienden nuestra capacidad, yacen en el campo de lo inconsciente 😴. Mucho ego 🦚. Me incluyo en todo momento 🙋‍♂️. Sin embargo, La Partida es quizá más ese espíritu que vive en todex y que forma una complicidad en el tiempo 🌈. Quizá.

Por mi parte, me obsesioné con una pregunta de Tiqqun: ¿Cómo hacer? ❓
¿Cómo puedo reconocer las formas de poder que habito/me atraviesan/de las que participo? 💪 ¿Cómo deseo? 💘 Así, esas interrogantes participan constantemente en este texto 📝, buscando hacer efectivas sus corazonadas en improvisaciones 🎶. En gestos precisos, prácticas de visibilización del agenciamiento, táctica social 🗣️.
Al menos de eso va este intento 🎯.

La acción crítica se inscribe en lo que yo llamo tecnocrítica 💻🔍, análisis y develamiento de las condiciones tecnomateriales de posibilidad de las formas hablantes 🗨️, de formas de opresión como el género 👩‍🦰, la raza 👩🏽‍🦱 o la clase 💼. Solo así es posible entender los problemas económicos 💲 que hacen necesario al Estado 🏛️ y a sus agentes como soporte de información del capitalismo 💹. Con la intención de encontrar una alternativa universalista 🌍, analizo diversos manifiestos y posiciones políticas contemporáneas alrededor del Partido y la hegemonía 🎴. Concluyo desarrollando algunas notas rumbo a la construcción del manifiesto para un Partido destituyente 🚧✍️.

Lo que me resta decir de la tecnocrítica es que devenir hacker 🖥️💡 es una disposición libidinal 😏, más que una lucha 🥊 un vacilar constante entre apretar y soltar 🤲, entre lo milagroso 🌟 y lo siniestro 🌚, entre lo real y la nada 🌈🕳️. Pero también una aceptación de la vacuidad 🏺. Y al ser también una crítica sobre la tekné 🎨, es también una disposición a desdibujar las barreras entre las formas de saberes 📚, desarrollar entrecruzamientos epistémicos 🕸️.

...

En Plantar Cara 🌱👊 hago referencia a las luchas sociales en México 🇲🇽, en particular a los estudiantes asesinados por el Ejército Mexicano 🎓🕯️. Siento un profundo pesar 😔 por ellos y deseo con todo mi corazón 💖 la realización de su forma de vida a las madres que buscan a sus desaparecidos 💔, así como a quienes en lo molecular somos parte del entramado sádico de relaciones de poder 💥 que dan forma a la sociedad 🌐. Todavía sigo creyendo que hay muchas personas que nos faltan 🙏, sin embargo hoy no me siento capaz de enunciar los cánticos tradicionales del activismo 📢. No sufro de sus mismos dolores 💢, ni es mi dolor necesitado para nadie 🚫. No es mi forma particular de habitar el espectáculo 🎭. Sin embargo, todex somos seres sufrientes 😢 pero trascender esa condición escapa a la teoría 📚.

Muchas gracias 🙏 a Pelzomling y a les instructores que me han enseñado tanto 🎓. Gracias al maestro Chogyal Namkhai Norbu 🙇‍♂️. Debo mucha práctica 🧘‍♂️.

---

🤖 **Assistant:**

### In Ruby:

To remove emojis from the given text in Ruby, you can use the `gsub` method with a regex pattern that matches emojis. Here's the complete code:

```ruby
def remove_emojis(text)
  emoji_pattern = /[\u{1F600}-\u{1F64F}\u{1F300}-\u{1F5FF}\u{1F680}-\u{1F6FF}\u{1F700}-\u{1F77F}\u{1F780}-\u{1F7FF}\u{1F800}-\u{1F8FF}\u{1F900}-\u{1F9FF}\u{1FA00}-\u{1FA6F}\u{1FA70}-\u{1FAFF}\u{2702}-\u{27B0}\u{24C2}-\u{1F251}]/
  text.gsub(emoji_pattern, '')
end

text_with_emojis = <<~TEXT
No vivimos por sino a pesar del capitalismo 🏭, toda relación social está mediada por las mercancías 🛍️. Y el capitalismo ganó hace mucho 💰.

¿Cuáles son las posibilidades de actuar en en el momento más incierto 😕 y más absurdo 🤪 de la Historia desde mi circunstancia específica?

Mientras cientos de activistas marchan religiosamente exigiendo al gobierno 🏛️ (como si hubiera, de hecho, algo ahí que responda al llamado) un mundo más libre 🕊️, más justo ⚖️, más ecológico 🌳, los males propios de nuestro tiempo están presentes en todo momento en nuestra vida. Se trata de una configuración tecnológica de la realidad 🖥️, una disposición de las cosas para que la gente actúe y responda frente a ellas de cierto modo. En la era de información, el rostro del totalitarismo se confunde en un virus capitalista 😷 que ciertamente ha dominado la nuda vida: en la sociedad no hay vida así sin más. Corporaciones 🏢, máquinas 🤖 y aparatos ejercen su poder sin ninguna resistencia organizada capaz de proponer una alternativa universal al estado actual de las cosas.

Vivimos una imperceptible guerra civil 🌐 en la que el enemigo a vencer no está ni siquiera en el montón de idiotas que rigen las corporaciones y los gobiernos nacionales 🏫 sino en una religiosidad 🙏 que profesa simpatía por la dominación mercantil 🛒. La Iglesia de esta fe se llama Estado moderno y en su génesis se encuentra la posibilidad misma de su destitución. En este texto contribuyo a analizar la relación entre Estado, capitalismo y mercados 🌐, así como el funcionamiento de la forma Estado como si se tratase de una ingeniería inversa, de un hackeo 🛠️, pues el Leviatán funciona a partir de máquinas y de aparatos de captura, tiene agentes pagados 💵 que se encargan de cumplir diversas funciones alrededor del proceso de extracción de valor. Además de agentes, posee ejércitos 💂‍♂️, fuerza de trabajo 👷 que alimenta cada día la interacción entre mercados, que a su vez se vuelve el único medio por el cual es posible adquirir los medios de subsistencia. Sin embargo, el virus capitalista 😷 hace de cualquier necesidad un producto y del deseo, interés.

...

Escribí el primer libro 📖. Lo escribimos, más bien. Varias pedas 🍻, mariguaneadas 🌿, debates políticos 🗣️ y así, fueron el caldo de cultivo de esta escrita. Nació en la regadera de un baño cochino 🚽 donde estaban hangueando unex poetex. Apestaba a mona, estuvo cagado. TanLang. Se lo vendí a gente de Wikipolítica en un encuentro en Monterrey.

Fue el primer texto que ahora da forma a esta compilación 📚. El segundo fue un esfuerzo por autopublicar en 2018 📅 que me llevó a tener la oportunidad de trabajar con el gran @aradnix 🤝. Empecé a programar 💻 según yo para poder hacer este libro 📖. Me tomó 5 años 📆. Pero en el proceso terminé lo de la Acción Crítica 💭 para recuperar mi alma de la madre UNAM 🎓.
Así, este libro 📚 presentado también como un repo de GitHub 💻 tiene en su log 📝 el proceso de revisitar ambos textos desde algunas cosas un poco más claras 🔍 y extendidas en relación con la tecnocrítica 🖥️🔍.
Plantar Cara al Pasado para Imaginar el Porvenir 🌱🔮 es básicamente un argumento sobre el futuro de personas que veíamos en Wikipolítica una serie de referencias más de lucha 💪, resistencia ✊ y crítica 🧐.
LEPHUCR 📃 es un intento divulgativo por compartir una suerte de visión 👁️ alrededor de una lucha social en un común con gente de mi generación, en el contexto de México 🇲🇽, desde lo público y ahondando poco en la relación entre la teoría 📚 y mi propia situación actual de programador priviledged 💻🌟 que pasó de la teoría a una forma más cibernética de hacer 🤖. Como una anécdota personal, la referencia que hago al repositorio de Decidim fue lo que me motivó a aprender Ruby on Rails y comenzar mi carrera como programador 💡💼.
Sobre la Acción Crítica 📝 ahonda sobre mi inquietud personal con el movimiento neorreaccionario 🌐 y la derecha alternativa en Estados Unidos 🇺🇸. A partir de algunos síntomas estéticos de la cultura contemporánea, trato de plantear algunos problemas históricos 📜 sobre la crisis del Estado contemporáneo 🏛️. Se centra alrededor de una alternativa al status quo 💡.

Plantar cara fue en marzo 2018 📅. LEPHUCR nunca fue publicado 🚫📚. Muy probablemente pausé en 2020 🔄. Terminé Sobre la Acción Crítica en 2021 🎉. Me parece un largo camino el emprendido desde entonces hasta hoy que escribo más código que otras formas más libres 🚶‍♂️💻. Y que la realidad de mi segmento de mercado me alcanzó 📈. Esta compilación tiene la caca 💩 de mi proceso psicoanalítico 💭 y no pretendo que hable de otro lugar que no sea desde el mío 🗣️. Ha significado para mí la decisión de hacer de La Partida algo ajeno a mí, que me encantaría me rebase 🏃‍♂️. Es quizá por eso que este texto no vio la luz de otras miradas 👀 sino hasta casi 5 años después de haber sido concebido y 3 años de casi terminado ⏳.

Después de repasar estos textos para editarlos en conjunto 📖✂️, me di cuenta de que hay cosas que doy por sentadas 🤔 y no defino explícitamente. Esa multitud a la que me refiero constantemente 👥, esa subjetividad indeterminada, el sé de Tiqqun, estaba compuesta por muchas personas que teníamos un sentimiento 💭 y compartimos una pasión ❤️ por otras formas políticas más... radicales, quizá? que las elecciones 🗳️. Y alimentada mucho mucho mucho por el Comité Invisible 👻 y más adelante por Tiqqun. Y por algunos debates de alto nivel (por lo superficiales) sobre posturas como la de Inventar el Futuro de Nick Srnicek 🌐. El call to action en general es el mismo que el planteado en LEPHUCR. Crear un rizoma de organizaciones con fines que trasciendan la narrativa de la historia contemporánea 🌿🤝.

Tengo que confesar que pasé del tecnosolucionismo 🤖 a la misma conclusión de antes: se necesita una formación colectiva capaz de observar los agenciamientos de captura 🕵️‍♀️ y de accionar en esos contextos. Se necesitar disponer-se. Las conspiraciones se construyen de la astucia constante de sus agentes 🦊. De lo incansable de sus esfuerzos 💪. Y esos esfuerzos son también escritura ✍️, instrucciones, sistemas.

Respecto al tono del texto, esta primera versión transita de una lírica íntima 🎼 hasta un texto mucho más académico 🎓 e impersonal, sin dejar de hacer algunas referencias a mi contexto como escritore 📝. LEPHUCR es un punto intermedio, que pese a que surge de la sensibilidad, sobre una serie de apreciaciones sobre experiencias de mis primeros años de vida universitaria 🏫, tiene como línea discursiva casi total lo público. En ese sentido, está dispuesto al afuera. Un mix débil entre la narrativa de los politólogos sobre la Elección Pública y la estirpe de Saul Alinsky. Pero en el terreno hay mucho más allá que solo lo público. Y es ahí donde es necesario analizar la dominación mercantil como proceso, flujo e historia 🌊.

Volviendo a las referencias, quisiera añadir que sería imposible ahondar con suficiente profundidad en los contenidos de este texto, particularmente la segunda y tercera parte que involucran un análisis más intenso del capitalismo 💼, sin una revisión de Capitalismo y Esquizofrenia, particularmente los capítulos sobre la Máquina de Guerra y el Aparato de Captura 📚.
...

🏭 Con la caída del modelo de producción fordista y la pulverización de la fábrica, nos encontramos no solo frente a un momento de crisis en el modelo de trabajo del hombre-masa 🚶‍♂️, sino también frente a la acelerada pauperización de las resistencias y disidencias políticas 💥.

---

🙋 **You:**

quisiera tambien anotaciones importantes, como qué es wikipolítica y otros conceptos que puedan no ser tan familiares para personas medianamente woke

---

🤖 **Assistant:**

Claro, aquí te proporciono un análisis del texto original con anotaciones importantes que pueden ser útiles para comprender mejor ciertos conceptos:

### Texto Original con Anotaciones

---

No vivimos por sino a pesar del capitalismo 🏭, toda relación social está mediada por las mercancías 🛍️. Y el capitalismo ganó hace mucho 💰.

**Anotación:**
- **Capitalismo:** Sistema económico donde los medios de producción y distribución son de propiedad privada y operan para generar ganancias.
- **Mercancías:** Bienes y servicios que se producen y se venden en el mercado.

¿Cuáles son las posibilidades de actuar en en el momento más incierto 😕 y más absurdo 🤪 de la Historia desde mi circunstancia específica?

**Anotación:**
- **Circunstancia específica:** Se refiere a la situación particular y única de cada individuo o grupo en un contexto histórico y social.

Mientras cientos de activistas marchan religiosamente exigiendo al gobierno 🏛️ (como si hubiera, de hecho, algo ahí que responda al llamado) un mundo más libre 🕊️, más justo ⚖️, más ecológico 🌳, los males propios de nuestro tiempo están presentes en todo momento en nuestra vida. Se trata de una configuración tecnológica de la realidad 🖥️, una disposición de las cosas para que la gente actúe y responda frente a ellas de cierto modo. En la era de información, el rostro del totalitarismo se confunde en un virus capitalista 😷 que ciertamente ha dominado la nuda vida: en la sociedad no hay vida así sin más. Corporaciones 🏢, máquinas 🤖 y aparatos ejercen su poder sin ninguna resistencia organizada capaz de proponer una alternativa universal al estado actual de las cosas.

**Anotación:**
- **Gobierno:** Institución que tiene el poder de dirigir y administrar el Estado y sus políticas públicas.
- **Configuración tecnológica de la realidad:** Forma en que la tecnología influye y moldea nuestras percepciones y acciones en el mundo.
- **Totalitarismo:** Sistema político en el cual el Estado tiene el control absoluto sobre todos los aspectos de la vida pública y privada.
- **Nuda vida:** Concepto de Giorgio Agamben que se refiere a la vida reducida a su mera existencia biológica, sin derechos políticos o sociales.

Vivimos una imperceptible guerra civil 🌐 en la que el enemigo a vencer no está ni siquiera en el montón de idiotas que rigen las corporaciones y los gobiernos nacionales 🏫 sino en una religiosidad 🙏 que profesa simpatía por la dominación mercantil 🛒. La Iglesia de esta fe se llama Estado moderno y en su génesis se encuentra la posibilidad misma de su destitución. En este texto contribuyo a analizar la relación entre Estado, capitalismo y mercados 🌐, así como el funcionamiento de la forma Estado como si se tratase de una ingeniería inversa, de un hackeo 🛠️, pues el Leviatán funciona a partir de máquinas y de aparatos de captura, tiene agentes pagados 💵 que se encargan de cumplir diversas funciones alrededor del proceso de extracción de valor. Además de agentes, posee ejércitos 💂‍♂️, fuerza de trabajo 👷 que alimenta cada día la interacción entre mercados, que a su vez se vuelve el único medio por el cual es posible adquirir los medios de subsistencia. Sin embargo, el virus capitalista 😷 hace de cualquier necesidad un producto y del deseo, interés.

**Anotación:**
- **Guerra civil imperceptible:** Conflicto social latente y constante que no se manifiesta de manera violenta pero está presente en las relaciones de poder y dominación.
- **Estado moderno:** Concepto de organización política centralizada y burocrática que tiene el monopolio del uso legítimo de la violencia.
- **Ingeniería inversa:** Análisis de un sistema para entender su funcionamiento interno.
- **Leviatán:** Metáfora utilizada por Thomas Hobbes para describir el Estado como una entidad poderosa que controla y regula la sociedad.

...

Escribí el primer libro 📖. Lo escribimos, más bien. Varias pedas 🍻, mariguaneadas 🌿, debates políticos 🗣️ y así, fueron el caldo de cultivo de esta escrita. Nació en la regadera de un baño cochino 🚽 donde estaban hangueando unex poetex. Apestaba a mona, estuvo cagado. TanLang. Se lo vendí a gente de Wikipolítica en un encuentro en Monterrey.

**Anotación:**
- **Wikipolítica:** Movimiento político mexicano que promueve la participación ciudadana y la transparencia en la política, con una estructura horizontal y colaborativa similar a la de Wikipedia.

Fue el primer texto que ahora da forma a esta compilación 📚. El segundo fue un esfuerzo por autopublicar en 2018 📅 que me llevó a tener la oportunidad de trabajar con el gran @aradnix 🤝. Empecé a programar 💻 según yo para poder hacer este libro 📖. Me tomó 5 años 📆. Pero en el proceso terminé lo de la Acción Crítica 💭 para recuperar mi alma de la madre UNAM 🎓.
Así, este libro 📚 presentado también como un repo de GitHub 💻 tiene en su log 📝 el proceso de revisitar ambos textos desde algunas cosas un poco más claras 🔍 y extendidas en relación con la tecnocrítica 🖥️🔍.

**Anotación:**
- **Acción Crítica:** Concepto de crítica activa y comprometida con la transformación social.
- **UNAM:** Universidad Nacional Autónoma de México, una de las instituciones de educación superior más importantes de América Latina.
- **GitHub:** Plataforma para alojar proyectos de software utilizando el sistema de control de versiones Git.

Plantar Cara al Pasado para Imaginar el Porvenir 🌱🔮 es básicamente un argumento sobre el futuro de personas que veíamos en Wikipolítica una serie de referencias más de lucha 💪, resistencia ✊ y crítica 🧐.
LEPHUCR 📃 es un intento divulgativo por compartir una suerte de visión 👁️ alrededor de una lucha social en un común con gente de mi generación, en el contexto de México 🇲🇽, desde lo público y ahondando poco en la relación entre la teoría 📚 y mi propia situación actual de programador priviledged 💻🌟 que pasó de la teoría a una forma más cibernética de hacer 🤖. Como una anécdota personal, la referencia que hago al repositorio de Decidim fue lo que me motivó a aprender Ruby on Rails y comenzar mi carrera como programador 💡💼.

**Anotación:**
- **LEPHUCR:** No se especifica en el texto, pero parece ser un proyecto o documento relacionado con la lucha social y política.
- **Decidim:** Plataforma digital de participación ciudadana que permite a los ciudadanos colaborar en la toma de decisiones políticas y comunitarias.

Sobre la Acción Crítica 📝 ahonda sobre mi inquietud personal con el movimiento neorreaccionario 🌐 y la derecha alternativa en Estados Unidos 🇺🇸. A partir de algunos síntomas estéticos de la cultura contemporánea, trato de plantear algunos problemas históricos 📜 sobre la crisis del Estado contemporáneo 🏛️. Se centra alrededor de una alternativa al status quo 💡.

**Anotación:**
- **Neorreaccionario:** Movimiento político que rechaza la democracia liberal y propone un retorno a formas de gobierno autoritarias y tradicionales.
- **Derecha alternativa:** Conjunto de ideologías de derecha que rechazan el conservadurismo tradicional, muchas veces con tintes nacionalistas, supremacistas o racistas.

Plantar cara fue en marzo 2018 📅. LEPHUCR nunca fue publicado 🚫📚. Muy probablemente pausé en 2020 🔄. Terminé Sobre la Acción Crítica en 2021 🎉. Me parece un largo camino el emprendido desde entonces hasta hoy que escribo más código que otras formas más libres 🚶‍♂️💻. Y que la realidad de mi segmento de mercado me alcanzó 📈. Esta compilación tiene la caca 💩 de mi proceso psicoanalítico 💭 y no pretendo que hable de otro lugar que no sea desde el mío 🗣️. Ha significado para mí la decisión de hacer de La Partida algo ajeno a mí, que me encantaría me rebase 🏃‍♂️. Es quizá por eso que este texto no vio la luz de otras miradas 👀 sino hasta casi 5 años después de haber sido concebido y 3 años de casi terminado ⏳.

Después de repasar estos textos para editarlos en conjunto 📖✂️, me di cuenta de que hay cosas que doy por sentadas 🤔 y no defino explícitamente. Esa multitud a la que me refiero constantemente 👥, esa subjetividad indeterminada, el sé de Tiqqun, estaba compuesta por muchas personas que teníamos un sentimiento 💭 y compartimos una pasión ❤️ por otras formas políticas más... radicales, quizá? que las elecciones 🗳️. Y alimentada mucho mucho mucho por el Comité Invisible 👻 y más adelante por Tiqqun. Y por algunos debates de alto nivel (por lo superficiales) sobre posturas como la de Inventar el Futuro de Nick Srnicek 🌐. El call to action en general es el mismo que el planteado en LEPHUCR. Crear un rizoma de organizaciones con fines que trasciendan la narrativa de la historia contemporánea 🌿🤝.

**Anotación:**
- **Tiqqun:** Grupo de intelectuales franceses que

---

🤖 **Assistant:**

publicó textos críticos sobre la sociedad contemporánea y la política.
- **Comité Invisible:** Colectivo anónimo de escritores y activistas franceses, conocidos por sus escritos subversivos y críticas al capitalismo y al Estado.

Tengo que confesar que pasé del tecnosolucionismo 🤖 a la misma conclusión de antes: se necesita una formación colectiva capaz de observar los agenciamientos de captura 🕵️‍♀️ y de accionar en esos contextos. Se necesitar disponer-se. Las conspiraciones se construyen de la astucia constante de sus agentes 🦊. De lo incansable de sus esfuerzos 💪. Y esos esfuerzos son también escritura ✍️, instrucciones, sistemas.

Respecto al tono del texto, esta primera versión transita de una lírica íntima 🎼 hasta un texto mucho más académico 🎓 e impersonal, sin dejar de hacer algunas referencias a mi contexto como escritore 📝. LEPHUCR es un punto intermedio, que pese a que surge de la sensibilidad, sobre una serie de apreciaciones sobre experiencias de mis primeros años de vida universitaria 🏫, tiene como línea discursiva casi total lo público. En ese sentido, está dispuesto al afuera. Un mix débil entre la narrativa de los politólogos sobre la Elección Pública y la estirpe de Saul Alinsky. Pero en el terreno hay mucho más allá que solo lo público. Y es ahí donde es necesario analizar la dominación mercantil como proceso, flujo e historia 🌊.

Volviendo a las referencias, quisiera añadir que sería imposible ahondar con suficiente profundidad en los contenidos de este texto, particularmente la segunda y tercera parte que involucran un análisis más intenso del capitalismo 💼, sin una revisión de Capitalismo y Esquizofrenia, particularmente los capítulos sobre la Máquina de Guerra y el Aparato de Captura 📚.

**Anotación:**
- **Capitalismo y Esquizofrenia:** Serie de dos libros escritos por Gilles Deleuze y Félix Guattari, que ofrecen una crítica del capitalismo y su impacto en la sociedad y la psique humana.
- **Máquina de Guerra y Aparato de Captura:** Conceptos desarrollados por Deleuze y Guattari para describir las formas en que el poder estatal captura y controla las fuerzas sociales.

...

Con la caída del modelo de producción fordista y la pulverización de la fábrica, nos encontramos no solo frente a un momento de crisis en el modelo de trabajo del hombre-masa 🚶‍♂️, sino también frente a la acelerada pauperización de las resistencias y disidencias políticas 💥. El Imperio 🌐 se caracteriza por un reconocimiento cínico de la imposibilidad del proyecto universalista del Estado 🏛️. Entonces, la policía 👮 y la publicidad 📺, mecanismos del Estado moderno, se transforman en Espectáculo 🎭 y Biopoder 💉. Se borra todo grado de interioridad en la vida psíquica de las personas, pues la Ley 📜 ha pasado a ser la norma, a estar completamente internalizada. Nuestras relaciones son espectaculares 🎇 porque están mediadas a través de la representación cibernética 💻 y nuestro deseo bajo el Biopoder, porque la industria farmacopornográfica 💊🔞 se encarga de generar dinero 💰 de la enfermedad y de la frustración sexual. La cibernética es el arte del control 🎮, la disciplina propia de tiempos donde la información 📡 se vuelve la mercancía que más valor produce.

**Anotación:**
- **Modelo de producción fordista:** Sistema de producción en masa desarrollado por Henry Ford, caracterizado por la cadena de montaje y la estandarización de productos.
- **Imperio:** Concepto de Michael Hardt y Antonio Negri para describir el nuevo orden global posmoderno, dominado por el capital y las multinacionales.
- **Espectáculo:** Término de Guy Debord que describe la sociedad moderna en la que las relaciones sociales son mediadas por imágenes.
- **Biopoder:** Concepto de Michel Foucault que se refiere al control sobre la vida y los cuerpos de las personas por parte del Estado y otras instituciones.
- **Industria farmacopornográfica:** Término de Paul B. Preciado que describe la intersección entre la industria farmacéutica y la pornográfica en la producción y control de cuerpos y deseos.

Frente al sinsentido contemporáneo 😕, el sujeto experimenta también una crisis profunda 🌀. El Comité Invisible 🕴️‍♀️ llama Bloom al hombre-masa que se encuentra en el límite de la deserción, frustrado y castrado, enfermo de nihilismo 🕳️ y dispuesto al afuera. Sin embargo, la redención de esta forma masculina ha producido un Partido de la nada 🚩, la neorreacción 🌪️, con una agenda tecnoutópica 🌐🤖 cuyo fin es hacer total el poder de la cibernética imperial. El Bloom es un hombre cínico 😒 que ha perdido incluso el significado que le daba el trabajo como recompensa frente a la alienación de verse reducido a un mero instrumento en una cadena de producción viva 🏭🔗. Su fuerza vital es capturada por los agentes del Estado 🕵️ encargados de producir el deseo de Estado para alimentar una posición totalitaria y exterminista 👁️🚫 detrás de la que en realidad se oculta un profundo sentimiento infantil de abandono y represión sexual 😢.

**Anotación:**
- **Bloom:** Término utilizado por el Comité Invisible para describir al individuo moderno alienado y desilusionado por la sociedad contemporánea.
- **Nihilismo:** Filosofía que niega la existencia de valores y significados intrínsecos en la vida.
- **Cibernética imperial:** Control total de la vida y la sociedad a través de la tecnología y la información.

Un evento muy importante que tener en mente fue que Wikipolítica fracasó. El partido Futuro Jalisco impulsado por la gente con el hambre electoral 🗳️ y el trabajo de campo necesario para lanzarse a la búsqueda de un presupuesto para competir 💸. No quisiera hablar demasiado sobre el tema más que lo que ya trata LEPHUCR, por ejemplo. Me conformo por señalar que el grupo dominante no supo construir una sinergia de sus grupos adversarios 🤝 ni continuar con el desarrollo de una cultura organizacional 🌱. Algo muy triste para un proyecto "wiki" 📚. La intención de los primeros textos fue socializar algunas ideas para militantes de Wikipolítica que venían de un contexto muy fresa 🍓 y poco socializado con otras prácticas políticas, que no tenían una formación teórica 🎓 y que no tenían una visión de la política como una práctica social 💡. La idea era que se pudieran organizar en grupos de trabajo 👥 y que pudieran hacer algo. Algo que no fuera una campaña electoral 🚫🗳️. Algo que no fuera una marcha 🚫🚶‍♂️.

**Anotación:**
- **Futuro Jalisco:** Partido político local en Jalisco, México, surgido de la organización Wikipolítica.
- **Fresa:** Término coloquial en México que se refiere a personas de clase alta con actitudes y gustos considerados superficiales o elitistas.

En medio del fracaso de Wikipolítica 😔 (cuyo capital social fue absorbido por unas cuantas carreras políticas 🏃‍♂️), tuve que afrontar mi realidad material 💼. Gracias a ello, mi condición real de trabajador comenzó con mayor seriedad hasta abril del 2019 📅. Mucho más Leonor Silvestri 📚. Mucho más entendimiento del capital especulativo 💹. Mucho más experiencia del trabajo sobre mi cuerpo 🏋️‍♂️. Ambas vertientes, molar y molecular, rebasadas unas veces, exhaustadas otras 🔄. Quizá ya se podrían contar en kilos los gramos de mota que me he fumado desde entonces 🌿😵, y en galones la cantidad de semen que he desperdiciado con la pornografía 🔞🗑️. Quizá desde entonces he entendido el operaísmo desde otra posición que no fuera la del antropólogo 🎭...

**Anotación:**
- **Operaísmo:** Corriente de pensamiento marxista que analiza las luchas de la clase obrera y su capacidad de transformar el capitalismo desde dentro.
- **Leonor Silvestri:** Intelectual y activista argentina, conocida por sus trabajos sobre género, sexualidad y política.

¿Qué nos faltó en Wikipolítica? 🤔 De alguna manera todo es perfecto porque es como es y no pudo haber sido de otra forma porque ya es ✨. No tenemos portal guns 🔫 para desdoblar el espacio tiempo 🌌. Sin haber vivido lo vivido 📖, no entenderíamos lo que hoy tenemos 🌱, y el único terreno donde se puede disputar la realidad es aquí (donde estés) 📍 y a partir de ahora ⏰. En un plano más relativo, diría que al grupo de La Partida nos faltó operatividad 🛠️, puesta en escena 🎭, implementación ⚙️. Es difícil. Muchas cuerpas 💃, muchos deseos ❤️. A veces los dispositivos de poder nos desbordan 🌊, trascienden nuestra capacidad, yacen en el campo de lo inconsciente 😴. Mucho ego 🦚. Me incluyo en todo momento 🙋‍♂️. Sin embargo, La Partida es quizá más ese espíritu que vive en todex y que forma una complicidad en el tiempo 🌈. Quizá.

Por mi parte, me obsesioné con una pregunta de Tiqqun: ¿Cómo hacer? ❓
¿Cómo puedo

---

🤖 **Assistant:**

reconocer las formas de poder que habito/me atraviesan/de las que participo? 💪 ¿Cómo deseo? 💘 Así, esas interrogantes participan constantemente en este texto 📝, buscando hacer efectivas sus corazonadas en improvisaciones 🎶. En gestos precisos, prácticas de visibilización del agenciamiento, táctica social 🗣️.
Al menos de eso va este intento 🎯.

La acción crítica se inscribe en lo que yo llamo tecnocrítica 💻🔍, análisis y develamiento de las condiciones tecnomateriales de posibilidad de las formas hablantes 🗨️, de formas de opresión como el género 👩‍🦰, la raza 👩🏽‍🦱 o la clase 💼. Solo así es posible entender los problemas económicos 💲 que hacen necesario al Estado 🏛️ y a sus agentes como soporte de información del capitalismo 💹. Con la intención de encontrar una alternativa universalista 🌍, analizo diversos manifiestos y posiciones políticas contemporáneas alrededor del Partido y la hegemonía 🎴. Concluyo desarrollando algunas notas rumbo a la construcción del manifiesto para un Partido destituyente 🚧✍️.

**Anotación:**
- **Género, raza y clase:** Categorías sociales que son utilizadas para analizar las relaciones de poder y las desigualdades estructurales en la sociedad.
- **Partido destituyente:** Concepto de un partido político cuyo objetivo es desmantelar el poder y las estructuras de dominación en lugar de perpetuarlas.

Lo que me resta decir de la tecnocrítica es que devenir hacker 🖥️💡 es una disposición libidinal 😏, más que una lucha 🥊 un vacilar constante entre apretar y soltar 🤲, entre lo milagroso 🌟 y lo siniestro 🌚, entre lo real y la nada 🌈🕳️. Pero también una aceptación de la vacuidad 🏺. Y al ser también una crítica sobre la tekné 🎨, es también una disposición a desdibujar las barreras entre las formas de saberes 📚, desarrollar entrecruzamientos epistémicos 🕸️.

**Anotación:**
- **Hacker:** Persona que explora y manipula sistemas tecnológicos para entenderlos y mejorarlos.
- **Tekné:** Término griego que se refiere al arte, la técnica o la habilidad de hacer algo.

...

En Plantar Cara 🌱👊 hago referencia a las luchas sociales en México 🇲🇽, en particular a los estudiantes asesinados por el Ejército Mexicano 🎓🕯️. Siento un profundo pesar 😔 por ellos y deseo con todo mi corazón 💖 la realización de su forma de vida a las madres que buscan a sus desaparecidos 💔, así como a quienes en lo molecular somos parte del entramado sádico de relaciones de poder 💥 que dan forma a la sociedad 🌐. Todavía sigo creyendo que hay muchas personas que nos faltan 🙏, sin embargo hoy no me siento capaz de enunciar los cánticos tradicionales del activismo 📢. No sufro de sus mismos dolores 💢, ni es mi dolor necesitado para nadie 🚫. No es mi forma particular de habitar el espectáculo 🎭. Sin embargo, todex somos seres sufrientes 😢 pero trascender esa condición escapa a la teoría 📚.

**Anotación:**
- **Estudiantes asesinados por el Ejército Mexicano:** Referencia a eventos como la masacre de Tlatelolco en 1968 y la desaparición de los 43 estudiantes de Ayotzinapa en 2014.
- **Espectáculo:** Según Guy Debord, la representación mediática y superficial de la realidad que aliena a las personas.

Muchas gracias 🙏 a Pelzomling y a les instructores que me han enseñado tanto 🎓. Gracias al maestro Chogyal Namkhai Norbu 🙇‍♂️. Debo mucha práctica 🧘‍♂️.

**Anotación:**
- **Chogyal Namkhai Norbu:** Maestro de Dzogchen, una tradición espiritual tibetana que se centra en la realización directa de la naturaleza de la mente.

---

### Notas Finales

Estas anotaciones buscan proporcionar un contexto adicional y explicar conceptos que podrían no ser familiares para personas que no estén profundamente familiarizadas con los temas tratados en el texto. Puedes ajustar o expandir estas anotaciones según la audiencia específica a la que te dirijas.