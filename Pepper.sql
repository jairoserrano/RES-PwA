
INSERT INTO EstadoCivil (tipoEC) VALUES ( 'Soltero');
INSERT INTO EstadoCivil (tipoEC) VALUES ( 'Casado');
INSERT INTO EstadoCivil (tipoEC) VALUES ( 'Divorciado');
INSERT INTO EstadoCivil (tipoEC) VALUES ( 'Viudo');

INSERT INTO Nivel_Educativo (tipoNE) VALUES( 'Primaria');
INSERT INTO Nivel_Educativo (tipoNE) VALUES( 'Bachiller');
INSERT INTO Nivel_Educativo (tipoNE) VALUES( 'Universitario');
INSERT INTO Nivel_Educativo (tipoNE) VALUES( 'Tecnologia');
INSERT INTO Nivel_Educativo (tipoNE) VALUES( 'Master');
INSERT INTO Nivel_Educativo (tipoNE) VALUES( 'Doctorado');

INSERT INTO Cuidador (nombreUsuario,contrasena,Nombre ,correo,celular) VALUES( 'juleon',12345, 'Juan Leon', 'juleon@javeriana.edu.co',3204094111);

INSERT INTO PerfilPwa (nombre,apellido,fechaNacimiento,paisNacimiento,edad,cedula,profesion,EstadoCivil_tipoEC,Nivel_Educativo_tipoNE,Cuidador_nombreUsuario) VALUES( 'Juanita', 'Caballero',TO_DATE('17/05/1940', 'dd/mm/yyyy'), 'Colombia',80,123456789, 'Ingeniera industrial', 'Casado', 'Doctorado', 'juleon');


INSERT INTO CausaDemencia (condicion) VALUES ( 'Parkinson');
INSERT INTO CausaDemencia (condicion) VALUES ( 'Alzheimer');


INSERT INTO Perfil_Medico (PerfilPwa_cedula,tomaMedicamentos,discapAuditiva,discapVisual,discapMotora,estadioEnfermedad,periodoVigilia,causaDemencia_condicion) VALUES(123456789,1,0,1,0,5,60, 'Alzheimer');

INSERT INTO Perfil_Preferencia (PerfilPwa_cedula,nombrePreferido,gustoKaraoke,gustoMusica,gustoBaile,volPreferido,BRILLOPREFERIDO) VALUES(123456789, 'Juanis',0.7,1,1,50,40);

INSERT INTO Genero (genero) VALUES( 'Vallenato');
INSERT INTO Genero (genero) VALUES( 'Carranga');
INSERT INTO Genero (genero) VALUES( 'Pop');
INSERT INTO Genero (genero) VALUES( 'Latin');

INSERT INTO Cancion (nombre,Genero_genero,reminiscencia,url) VALUES( 'Mi cacharrito', 'Latin',1, 'http://10.195.22.103:49152/content/media/object_id/22/res_id/0');
INSERT INTO Cancion (nombre,Genero_genero,reminiscencia,url) VALUES( 'Mi querido viejo', 'Pop',1, 'http://10.195.22.103:49152/content/media/object_id/48/res_id/0');

INSERT INTO PreferenciaXCancion (Perfil_Preferencia_PerfilPwa_cedula,Cancion_nombre,gusto) VALUES(123456789, 'Mi cacharrito',0.8);
INSERT INTO PreferenciaXCancion (Perfil_Preferencia_PerfilPwa_cedula,Cancion_nombre,gusto) VALUES(123456789, 'Mi querido viejo',0.5);

INSERT INTO Genero (genero) VALUES('Literatura Infantil');
INSERT INTO Cuento (Genero_genero,Autor,nombre) VALUES( 'Literatura Infantil', 'Charles Perrault', 'Caperucita roja');
INSERT INTO Cuento (Genero_genero,Autor,nombre) VALUES( 'Literatura Infantil', 'Jon Scieszka', 'Los 3 cerditos');

INSERT INTO PreferenciaXCuento (Perfil_Preferencia_PerfilPwa_cedula,Cuento_nombre,gusto) VALUES(123456789, 'Caperucita roja',0.3);
INSERT INTO PreferenciaXCuento (Perfil_Preferencia_PerfilPwa_cedula,Cuento_nombre,gusto) VALUES(123456789, 'Los 3 cerditos',0.6);

INSERT INTO Tags (id,tag) VALUES(0, 'Familia');
INSERT INTO Tags (id,tag) VALUES(1, 'Matrimonio');
INSERT INTO Tags (id,tag) VALUES(2, 'Cumplea�os');
INSERT INTO Tags (id,tag) VALUES(3, 'Amigos');
INSERT INTO Tags (id,tag) VALUES(4, 'Graduacion');

INSERT INTO listaTags (Cancion_nombre,Tags_id) VALUES( 'Mi cacharrito',0);
INSERT INTO listaTags (Cancion_nombre,Tags_id) VALUES( 'Mi cacharrito',2);
INSERT INTO listaTags (Cancion_nombre,Tags_id) VALUES( 'Mi querido viejo',0);
INSERT INTO listaTags (Cancion_nombre,Tags_id) VALUES( 'Mi querido viejo',3);

INSERT INTO ActividadPwA (id,nombre,tipo,duracion) VALUES(0, 'MUSICOTERAPIA', 'Entretenimiento',60);
INSERT INTO ActividadPwA (id,nombre,tipo,duracion) VALUES(1, 'CUENTERIA', 'Entretenimiento',60);


INSERT INTO actXPreferencia (ActividadPwA_id,Perfil_Preferencia_cedula,activa,gusto,enriq) VALUES(0,123456789,1,0.8,5);
INSERT INTO actXPreferencia (ActividadPwA_id,Perfil_Preferencia_cedula,activa,gusto,enriq) VALUES(1,123456789,1,0.5,2);


INSERT INTO Familiar (id,nombre,parentesco,interes,estaVivo,nacimiento) VALUES(0, 'Olga', 'Hermana',1,0,TO_DATE('10/12/1945', 'dd/mm/yyyy'));
INSERT INTO Familiar (id,nombre,parentesco,interes,estaVivo,nacimiento) VALUES(1, 'Eugenio', 'Esposo',1,1,TO_DATE('05/03/1940', 'dd/mm/yyyy'));
INSERT INTO Familiar (id,nombre,parentesco,interes,estaVivo,nacimiento) VALUES(2, 'Jorge', 'Hijo',1,1,TO_DATE('25/07/1970', 'dd/mm/yyyy'));
INSERT INTO Familiar (id,nombre,parentesco,interes,estaVivo,nacimiento) VALUES(3, 'Cecilia', 'Hija',1,1,TO_DATE('20/09/1972', 'dd/mm/yyyy'));

INSERT INTO familiares (PerfilPwa_cedula,Familiar_id) VALUES(123456789,0);
INSERT INTO familiares (PerfilPwa_cedula,Familiar_id) VALUES(123456789,1);
INSERT INTO familiares (PerfilPwa_cedula,Familiar_id) VALUES(123456789,2);
INSERT INTO familiares (PerfilPwa_cedula,Familiar_id) VALUES(123456789,3);

INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( '�rase una vez una preciosa ni�a',1, 'Caperucita roja', ' ', ' ', 'http://10.195.22.103:49152/content/media/object_id/39/res_id/0');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'que siempre llevaba una capa roja con capucha para protegerse del fr�o',2, 'Caperucita roja', ' ', ' ', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'Por eso, todo el mundo la llamaba Caperucita Roja',3, 'Caperucita roja', ' ', ' ', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'Caperucita viv�a en una casita cerca del bosque',4, 'Caperucita roja', ' ', ' ', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'Un d�a, la mam� de� Caperucita le dijo',5, 'Caperucita roja', ' ', ' ', 'http://10.195.22.103:49152/content/media/object_id/54/res_id/0');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'Hija m�a, tu abuelita est� enferma',6, 'Caperucita roja', 'INTERNALNEGPLUS', ' ', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'He preparado una cestita con tortas y un tarrito de miel para que se la lleves',7, 'Caperucita roja', ' ', ' ', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( '�Ya ver�s qu� contenta se pone!',8, 'Caperucita roja', 'INTERNALPOSPLUS', ' ', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( '�Estupendo, mam�!',9, 'Caperucita roja', 'INTERNALPOSPLUS', 'EMOTIONRISEARMS', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'Yo tambi�n tengo muchas ganas de ir a visitarla, dijo Caperucita saltando de alegr�a',10, 'Caperucita roja', 'INTERNALPOSPLUS', ' ', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'Cuando Caperucita se dispon�a�a salir de casa',11, 'Caperucita roja', ' ', ' ', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'su mam�, con gesto un poco serio, le hizo una advertencia',12, 'Caperucita roja', 'INTERNALNEG', ' ', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'Ten mucho cuidado, cari�o. No te entretengas con nada y no hables con extra�os',13, 'Caperucita roja', ' ', 'FRAGCONVRIGHT', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'Sabes que en el bosque vive el lobo y es muy peligroso',14, 'Caperucita roja', ' ', 'FRAGCONVLEFT', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'Si ves que aparece, sigue tu camino sin detenerte',15, 'Caperucita roja', ' ', ' ', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'No te preocupes, mamita, dijo la ni�a. Tendr� en cuenta todo lo que me dices',16, 'Caperucita roja', ' ', ' ', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'Est� bien, contest� la mam�, confiada. Dame un besito y no tardes en regresar',17, 'Caperucita roja', ' ', ' ', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'As� lo har�, mam�, afirm� de nuevo Caperucita diciendo adi�s con su manita mientras se alejaba',18, 'Caperucita roja', ' ', 'WALK', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'Cuando lleg� al bosque',19, 'Caperucita roja', ' ', ' ', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'la peque�a comenz� a distraerse contemplando los pajaritos y recogiendo flores',20, 'Caperucita roja', ' ', ' ', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'No se dio cuenta de que alguien la observaba detr�s de un viejo y frondoso �rbol',21, 'Caperucita roja', ' ', ' ', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'De repente, oy� una voz dulce y zalamera',22, 'Caperucita roja', ' ', ' ', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( '�A d�nde vas, Caperucita?',23, 'Caperucita roja', ' ', 'QUESTION', 'http://10.195.22.103:49152/content/media/object_id/57/res_id/0');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'La ni�a, dando un respingo, se gir� y vio que quien le hablaba era un enorme lobo',24, 'Caperucita roja', ' ', ' ', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'Voy a casa de mi abuelita, al otro lado del bosque',25, 'Caperucita roja', ' ', ' ', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'Est� enferma y le llevo una deliciosa merienda y unas flores para alegrarle el d�a',26, 'Caperucita roja', ' ', ' ', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( '�Oh, eso es estupendo!, dijo el astuto lobo, Yo tambi�n vivo por all�',27, 'Caperucita roja', 'INTERNALPOS', ' ', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'Te echo una carrera a ver qui�n llega antes',28, 'Caperucita roja', ' ', ' ', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'Cada uno iremos por un camino diferente �te parece bien?',29, 'Caperucita roja', ' ', 'QUESTION', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'La inocente ni�a pens� que era una idea divertida y asinti� con la cabeza',30, 'Caperucita roja', 'INTERNALPOS', ' ', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'No sab�a que el lobo hab�a elegido el camino m�s corto para llegar primero a su destino',31, 'Caperucita roja', ' ', ' ', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'Cuando el animal �lleg� a casa de la abuela, llam� a la puerta',32, 'Caperucita roja', ' ', ' ', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( '�Qui�n es?, grit� la mujer',33, 'Caperucita roja', ' ', 'QUESTION', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'Soy yo, abuelita, tu querida nieta Caperucita',34, 'Caperucita roja', ' ', ' ', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( '�breme la puerta, dijo el lobo imitando la voz de la ni�a',35, 'Caperucita roja', ' ', 'FRAGCONVRIGHT', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'Pasa, querida m�a. La puerta est� abierta, contest� la abuela',36, 'Caperucita roja', ' ', ' ', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'El malvado lobo entr� en la casa y sin pens�rselo dos veces',37, 'Caperucita roja', ' ', ' ', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'salt� sobre la cama y se comi� a la anciana',38, 'Caperucita roja', ' ', ' ', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'Despu�s, se puso su camis�n y su gorrito de dormir',39, 'Caperucita roja', ' ', ' ', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'y se meti� entre las s�banas esperando a que llegara la ni�a',40, 'Caperucita roja', ' ', ' ', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'Al rato, se oyeron unos golpes',41, 'Caperucita roja', ' ', ' ', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( '�Qui�n llama?, dijo el lobo forzando la voz como si fuera la abuelita',42, 'Caperucita roja', ' ', 'QUESTION', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'Soy yo, Caperucita. Vengo a hacerte una visita y a traerte unos ricos dulces para merendar',43, 'Caperucita roja', ' ', ' ', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'Pasa, querida, estoy deseando abrazarte, dijo el lobo malvado relami�ndose',44, 'Caperucita roja', ' ', ' ', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'La habitaci�n estaba en penumbra',45, 'Caperucita roja', ' ', ' ', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'Cuando se acerc� a la cama, a Caperucita le pareci� que su abuela estaba muy cambiada',46, 'Caperucita roja', ' ', ' ', 'http://10.195.22.103:49152/content/media/object_id/9/res_id/0');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'Extra�ada, le dijo: Abuelita, abuelita �qu� ojos tan grandes tienes!',47, 'Caperucita roja', ' ', ' ', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'Son para verte mejor, preciosa m�a, contest� el lobo, suavizando la voz',48, 'Caperucita roja', ' ', ' ', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'Abuelita, abuelita �qu� orejas tan grandes tienes!',49, 'Caperucita roja', ' ', 'FRAGCONVLEFTOUTFOCUS', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'Son para o�rte mejor, querida',50, 'Caperucita roja', ' ', ' ', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'Pero abuelita, abuelita �qu� boca tan grande tienes!',51, 'Caperucita roja', ' ', ' ', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( '�Es para comerte mejor!, grit� el lobo dando un enorme salto y comi�ndose a la ni�a de un bocado',52, 'Caperucita roja', 'INTERNALNEG', ' ', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'Con la barriga llena despu�s de tanta comida, al lobo le entr� sue�o',53, 'Caperucita roja', ' ', ' ', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'Sali� de la casa, se tumb� en el jard�n y cay� profundamente dormido',54, 'Caperucita roja', ' ', ' ', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'El fuerte sonido de sus ronquidos llam� la atenci�n de un cazador que pasaba por all�',55, 'Caperucita roja', ' ', ' ', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'El hombre se acerc� y vio que el animal ten�a la panza muy hinchada, demasiado para ser un lobo',56, 'Caperucita roja', ' ', 'WALK', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'Sospechando que pasaba algo extra�o, cogi� un cuchillo y le raj� la tripa',57, 'Caperucita roja', ' ', ' ', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( '�Se llev� una gran sorpresa cuando vio que de ella salieron sanas y salvas la abuela y la ni�a!',58, 'Caperucita roja', ' ', ' ', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'Despu�s de liberarlas, el cazador cosi� la barriga del lobo',59, 'Caperucita roja', ' ', ' ', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'y esperaron un rato a que el animal se despertar�',60, 'Caperucita roja', ' ', ' ', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'Cuando por fin abri� los ojos, vio como los tres le rodeaban y escuch� la profunda',61, 'Caperucita roja', ' ', ' ', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'y amenazante voz del cazador que le gritaba enfurecido:',62, 'Caperucita roja', ' ', ' ', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( '�L�rgate, lobo malvado! �No te queremos en este bosque!',63, 'Caperucita roja', ' ', 'FRAGCONVRIGHT', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( '�Como vuelva a verte por aqu�, no volver�s a contarlo!',64, 'Caperucita roja', ' ', ' ', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'El lobo, aterrado, puso pies en polvorosa y sali� despavorido',65, 'Caperucita roja', 'INTERNALNEG', ' ', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'Caperucita y su abuelita, con l�grimas cayendo sobre sus mejillas, se abrazaron',66, 'Caperucita roja', 'INTERNALPOS', ' ', 'http://10.195.22.103:49152/content/media/object_id/51/res_id/0');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'El susto hab�a pasado y la ni�a hab�a aprendido una importante lecci�n:',67, 'Caperucita roja', ' ', ' ', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'nunca m�s desobedecer�a a su mam� ni se fiar�a de extra�os',68, 'Caperucita roja', ' ', ' ', ' ');

INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'Hab�a una vez tres hermanos cerditos que viv�an en el bosque',1, 'Los 3 cerditos', ' ', ' ', 'http://10.195.22.103:49152/content/media/object_id/42/res_id/0');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'Como el malvado lobo siempre los estaba persiguiendo para com�rselos dijo un d�a el mayor:',2, 'Los 3 cerditos', ' ', ' ', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'Tenemos que hacer una casa para protegernos de lobo',3, 'Los 3 cerditos', ' ', ' ', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'As� podremos escondernos dentro de ella cada vez que el lobo aparezca por aqu�',4, 'Los 3 cerditos', ' ', 'FRAGCONVRIGHT', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'A los otros dos les pareci� muy buena idea',5, 'Los 3 cerditos', 'INTERNALPOS', ' ', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'pero no se pon�an de acuerdo respecto a qu� material utilizar',6, 'Los 3 cerditos', ' ', ' ', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'Al final, y para no discutir, decidieron que cada uno la hiciera de lo que quisiese',7, 'Los 3 cerditos', ' ', ' ', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'El m�s peque�o opt� por utilizar paja, para no tardar mucho y poder irse a jugar despu�s',8, 'Los 3 cerditos', ' ', ' ', 'http://10.195.22.103:49152/content/media/object_id/45/res_id/0');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'El mediano prefiri� construirla de madera',9, 'Los 3 cerditos', ' ', ' ', 'http://10.195.22.103:49152/content/media/object_id/63/res_id/0');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'que era m�s resistente que la paja y tampoco le llevar�a mucho tiempo hacerla',10, 'Los 3 cerditos', ' ', ' ', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'Pero el mayor pens� que aunque tardara m�s que sus hermanos',11, 'Los 3 cerditos', ' ', ' ', 'http://10.195.22.103:49152/content/media/object_id/17/res_id/0');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'lo mejor era hacer una casa resistente y fuerte con ladrillos',12, 'Los 3 cerditos', ' ', ' ', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'Adem�s as� podr� hacer una chimenea con la que calentarme en invierno, pens� el cerdito',13, 'Los 3 cerditos', ' ', 'FRAGCONVLEFT', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'Cuando los tres acabaron sus casas se metieron cada uno en la suya',14, 'Los 3 cerditos', ' ', ' ', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'y entonces apareci� por ah� el malvado lobo',15, 'Los 3 cerditos', 'INTERNALNEG', ' ', 'http://10.195.22.103:49152/content/media/object_id/60/res_id/0');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'Se dirigi� a la de paja y llam� a la puerta:',16, 'Los 3 cerditos', ' ', 'WALK', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'Anda cerdito se bueno y d�jame entrar',17, 'Los 3 cerditos', ' ', ' ', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( '�No! �Eso ni pensarlo!',18, 'Los 3 cerditos', 'INTERNALNEG', ' ', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( '�Pues soplar� y soplar� y la casita derribar�!',19, 'Los 3 cerditos', ' ', ' ', 'http://10.195.22.103:49152/content/media/object_id/30/res_id/0');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'Y el lobo empez� a soplar y a estornudar, la d�bil casa acab� vini�ndose abajo',20, 'Los 3 cerditos', 'INTERNALNEG', ' ', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'Pero el cerdito ech� a correr y se refugi� en la casa de su hermano mediano',21, 'Los 3 cerditos', ' ', 'WALK', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'que estaba hecha de madera',22, 'Los 3 cerditos', ' ', ' ', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'Anda cerditos sed buenos y dejarme entrar',23, 'Los 3 cerditos', ' ', ' ', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( '�No! �Eso ni pensarlo!, dijeron los dos',24, 'Los 3 cerditos', 'INTERNALNEG', ' ', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( '�Pues soplar� y soplar� y la casita derribar�!',25, 'Los 3 cerditos', ' ', ' ', 'http://10.195.22.103:49152/content/media/object_id/36/res_id/0');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'El lobo empez� a soplar y a estornudar',26, 'Los 3 cerditos', ' ', ' ', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'aunque esta vez tuvo que hacer m�s esfuerzos para derribar la casa al final la madera acab� cediendo',27, 'Los 3 cerditos', 'INTERNALNEG', ' ', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'y los cerditos salieron corriendo en direcci�n hacia la casa de su hermano mayor',28, 'Los 3 cerditos', ' ', 'WALK', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'El lobo estaba cada vez m�s hambriento as� que sopl� y sopl� con todas sus fuerzas',29, 'Los 3 cerditos', ' ', ' ', 'http://10.195.22.103:49152/content/media/object_id/14/res_id/0');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'pero esta vez no ten�a nada que hacer porque la casa no se mov�a ni siquiera un poco',30, 'Los 3 cerditos', ' ', ' ', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'Dentro los cerditos celebraban la resistencia de la casa de su hermano',31, 'Los 3 cerditos', 'INTERNALPOS', 'CELEBRATE', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'y cantaban alegres por haberse librado del lobo:',32, 'Los 3 cerditos', 'INTERNALPOSPLUS', ' ', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( '�Quien teme al lobo feroz? �No, no, no!',33, 'Los 3 cerditos', ' ', 'QUESTION', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'Fuera el lobo continuaba soplando en vano, cada vez m�s enfadado',34, 'Los 3 cerditos', ' ', ' ', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'Hasta que decidi� parar para descansar y entonces repar� en que la casa ten�a una chimenea',35, 'Los 3 cerditos', ' ', ' ', 'http://10.195.22.103:49152/content/media/object_id/27/res_id/0');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( '�Ja! �Pensaban que de m� iban a librarse! �Subir� por la chimenea y me los comer� a los tres!',36, 'Los 3 cerditos', ' ', ' ', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'Pero los cerditos le oyeron, y para darle su merecido llenaron la chimenea de le�a',37, 'Los 3 cerditos', ' ', ' ', 'http://10.195.22.103:49152/content/media/object_id/33/res_id/0');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'y pusieron al fuego un gran caldero con agua',38, 'Los 3 cerditos', ' ', ' ', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'As� cuando el lobo cay� por la chimenea el agua estaba hirviendo',39, 'Los 3 cerditos', ' ', ' ', ' ');
INSERT INTO Frases (contenido,orden,Cuento_nombre,emotionalEvent,accion,urlImagen) VALUES( 'se quem� tanto que sali� gritando de la casa y no volvi� a comer cerditos en una larga temporada',40, 'Los 3 cerditos', 'INTERNALNEG', ' ', ' ');


INSERT INTO Robot (id,nombre) VALUES (0, 'pepper');

INSERT INTO Emocion (id,emotionalTag,robot_id) VALUES (0,'VHAPPY',0); 
INSERT INTO Emocion (id,emotionalTag,robot_id) VALUES (1,'HAPPY',0); 
INSERT INTO Emocion (id,emotionalTag,robot_id) VALUES (2,'NORMAL',0); 
INSERT INTO Emocion (id,emotionalTag,robot_id) VALUES (3,'SAD',0); 
INSERT INTO Emocion (id,emotionalTag,robot_id) VALUES (4,'VSAD',0); 

INSERT INTO Accion (id,nombre,Emocion_id,tipo) VALUES (0, 'POSTURA',4, 'postura'); 
INSERT INTO Accion (id,nombre,Emocion_id,tipo) VALUES (1, 'POSTURA',0, 'postura'); 
INSERT INTO Accion (id,nombre,Emocion_id,tipo) VALUES (4, 'POSTURA',3, 'postura'); 
INSERT INTO Accion (id,nombre,Emocion_id,tipo) VALUES (5, 'POSTURA',1, 'postura'); 
INSERT INTO Accion (id,nombre,Emocion_id,tipo) VALUES (6, 'POSTURA',2, 'postura'); 



INSERT INTO Joint (id,nombre,angulo,tiempo) VALUES (2, 'HipPitch',-0.726057,0.76); 
INSERT INTO Joint (id,nombre,angulo,tiempo) VALUES (3, 'HipRoll',-0.00359941,0.76); 
INSERT INTO Joint (id,nombre,angulo,tiempo) VALUES (4, 'KneePitch',-0.00905603,0.76); 
INSERT INTO Joint (id,nombre,angulo,tiempo) VALUES (5, 'LElbowRoll',-0.110514,0.76); 
INSERT INTO Joint (id,nombre,angulo,tiempo) VALUES (6, 'LElbowYaw',-1.71537,0.76); 
INSERT INTO Joint (id,nombre,angulo,tiempo) VALUES (7, 'LHand',0.6942,0.76); 
INSERT INTO Joint (id,nombre,angulo,tiempo) VALUES (8, 'LShoulderPitch',1.20428,0.76); 
INSERT INTO Joint (id,nombre,angulo,tiempo) VALUES (9, 'LShoulderRoll',0.113541,0.76); 
INSERT INTO Joint (id,nombre,angulo,tiempo) VALUES (10, 'LWristYaw',0.0345809,0.76); 
INSERT INTO Joint (id,nombre,angulo,tiempo) VALUES (11, 'RElbowRoll',0.0923345,0.76); 
INSERT INTO Joint (id,nombre,angulo,tiempo) VALUES (12, 'RElbowYaw',1.68466,0.76); 
INSERT INTO Joint (id,nombre,angulo,tiempo) VALUES (13, 'RHand',0.688049,0.76); 
INSERT INTO Joint (id,nombre,angulo,tiempo) VALUES (14, 'RShoulderPitch',1.20446,0.76); 
INSERT INTO Joint (id,nombre,angulo,tiempo) VALUES (15, 'RShoulderRoll',-0.117913,0.76); 
INSERT INTO Joint (id,nombre,angulo,tiempo) VALUES (16, 'RWristYaw',-0.0225847,0.76); 
INSERT INTO Joint (id,nombre,angulo,tiempo) VALUES (19, 'HipPitch',0.0733038,0.76); 
INSERT INTO Joint (id,nombre,angulo,tiempo) VALUES (20, 'HipRoll',0,0.76); 
INSERT INTO Joint (id,nombre,angulo,tiempo) VALUES (21, 'KneePitch',0,0.76); 
INSERT INTO Joint (id,nombre,angulo,tiempo) VALUES (22, 'LElbowRoll',-1.22173,0.76); 
INSERT INTO Joint (id,nombre,angulo,tiempo) VALUES (23, 'LElbowYaw',-1.71042,0.76); 
INSERT INTO Joint (id,nombre,angulo,tiempo) VALUES (24, 'LHand',0.7,0.76); 
INSERT INTO Joint (id,nombre,angulo,tiempo) VALUES (25, 'LShoulderPitch',1.51669,0.76); 
INSERT INTO Joint (id,nombre,angulo,tiempo) VALUES (26, 'LShoulderRoll',0.10821,0.76); 
INSERT INTO Joint (id,nombre,angulo,tiempo) VALUES (27, 'LWristYaw',0.0349066,0.76); 
INSERT INTO Joint (id,nombre,angulo,tiempo) VALUES (28, 'RElbowRoll',1.22173,0.76); 
INSERT INTO Joint (id,nombre,angulo,tiempo) VALUES (29, 'RElbowYaw',1.67552,0.76); 
INSERT INTO Joint (id,nombre,angulo,tiempo) VALUES (30, 'RHand',0.7,0.76); 
INSERT INTO Joint (id,nombre,angulo,tiempo) VALUES (31, 'RShoulderPitch',1.53589,0.76); 
INSERT INTO Joint (id,nombre,angulo,tiempo) VALUES (32, 'RShoulderRoll',-0.115192,0.76); 
INSERT INTO Joint (id,nombre,angulo,tiempo) VALUES (33, 'RWristYaw',-0.0244346,0.76); 
INSERT INTO Joint (id,nombre,angulo,tiempo) VALUES (34, 'LElbowRoll',-1.22173,0.36); 
INSERT INTO Joint (id,nombre,angulo,tiempo) VALUES (35, 'LShoulderPitch',1.02974,0.36); 
INSERT INTO Joint (id,nombre,angulo,tiempo) VALUES (36, 'LShoulderPitch',2.08567,0.76); 
INSERT INTO Joint (id,nombre,angulo,tiempo) VALUES (37, 'LShoulderPitch',1.02974,1.16); 
INSERT INTO Joint (id,nombre,angulo,tiempo) VALUES (38, 'LShoulderPitch',2.08567,1.56); 
INSERT INTO Joint (id,nombre,angulo,tiempo) VALUES (39, 'RElbowRoll',1.22173,0.36); 
INSERT INTO Joint (id,nombre,angulo,tiempo) VALUES (40, 'RShoulderPitch',2.74312,0.36); 
INSERT INTO Joint (id,nombre,angulo,tiempo) VALUES (41, 'RShoulderPitch',1.02974,0.76); 
INSERT INTO Joint (id,nombre,angulo,tiempo) VALUES (42, 'RShoulderPitch',2.74312,1.16); 
INSERT INTO Joint (id,nombre,angulo,tiempo) VALUES (43, 'RShoulderPitch',1.02974,1.56); 
INSERT INTO Joint (id,nombre,angulo,tiempo) VALUES (44, 'LElbowRoll',-0.698132,0.36); 
INSERT INTO Joint (id,nombre,angulo,tiempo) VALUES (45, 'RElbowRoll',0.698132,0.36); 
INSERT INTO Joint (id,nombre,angulo,tiempo) VALUES (47, 'HipPitch',-0.436332,0.76); 
INSERT INTO Joint (id,nombre,angulo,tiempo) VALUES (48, 'LShoulderPitch',1.309,0.76); 
INSERT INTO Joint (id,nombre,angulo,tiempo) VALUES (49, 'RShoulderPitch',1.309,0.76); 
INSERT INTO Joint (id,nombre,angulo,tiempo) VALUES (51, 'HipPitch',0.0349066,0.76); 
INSERT INTO Joint (id,nombre,angulo,tiempo) VALUES (52, 'LElbowRoll',-0.959931,0.76); 
INSERT INTO Joint (id,nombre,angulo,tiempo) VALUES (53, 'RElbowRoll',0.959931,0.76); 
INSERT INTO Joint (id,nombre,angulo,tiempo) VALUES (55, 'HipPitch',0,0.76); 
INSERT INTO Joint (id,nombre,angulo,tiempo) VALUES (56, 'LElbowRoll',-0.349066,0.76); 
INSERT INTO Joint (id,nombre,angulo,tiempo) VALUES (57, 'RElbowRoll',0.349066,0.76);


INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (0,0); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (0,1); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (0,2); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (0,3); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (0,4); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (0,5); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (0,6); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (0,7); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (0,8); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (0,9); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (0,10); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (0,11); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (0,12); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (0,13); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (0,14); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (0,15); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (0,16); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (1,17); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (1,18); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (1,19); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (1,20); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (1,21); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (1,22); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (1,23); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (1,24); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (1,25); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (1,26); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (1,27); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (1,28); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (1,29); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (1,30); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (1,31); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (1,32); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (1,33); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (2,34); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (2,35); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (2,36); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (2,37); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (2,38); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (2,39); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (2,40); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (2,41); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (2,42); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (2,43); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (3,35); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (3,36); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (3,37); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (3,38); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (3,40); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (3,41); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (3,42); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (3,43); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (3,44); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (3,45); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (4,1); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (4,3); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (4,4); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (4,5); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (4,6); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (4,7); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (4,9); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (4,10); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (4,11); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (4,12); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (4,13); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (4,15); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (4,16); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (4,46); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (4,47); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (4,48); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (4,49); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (5,18); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (5,20); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (5,21); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (5,23); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (5,24); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (5,25); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (5,26); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (5,27); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (5,29); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (5,30); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (5,31); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (5,32); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (5,33); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (5,50); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (5,51); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (5,52); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (5,53); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (6,18); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (6,20); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (6,21); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (6,23); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (6,24); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (6,25); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (6,26); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (6,27); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (6,29); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (6,30); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (6,31); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (6,32); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (6,33); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (6,54); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (6,55); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (6,56); 
INSERT INTO AccionxJoint (Accion_id,Joint_id) VALUES (6,57); 


Insert into emotionaxisconfig values (0,0.3, 0.2,'Tristeza', 'Felicidad' );

INSERT INTO eventinfluence (id,eventinfluence,eventname,EVTINF_ID) VALUES (0,0.7,'INTERNALPOSPLUS',0);
INSERT INTO eventinfluence (id,eventinfluence,eventname,EVTINF_ID) VALUES (1,0.3,'INTERNALPOS',0);
INSERT INTO eventinfluence (id,eventinfluence,eventname,EVTINF_ID) VALUES (2,0.3,'INTERNALNEG',0);
INSERT INTO eventinfluence (id,eventinfluence,eventname,EVTINF_ID) VALUES (3,0.7,'INTERNALNEGPLUS',0);
INSERT INTO eventinfluence (id,eventinfluence,eventname,EVTINF_ID) VALUES (4,0.4,'SPOKE',0);
INSERT INTO eventinfluence (id,eventinfluence,eventname,EVTINF_ID) VALUES (5,0.4,'NOTLOOKING',0);
INSERT INTO eventinfluence (id,eventinfluence,eventname,EVTINF_ID) VALUES (6,0.1,'NOTDETECTED',0);
INSERT INTO eventinfluence (id,eventinfluence,eventname,EVTINF_ID) VALUES (7,0.3,'NORESPONSE',0);
INSERT INTO eventinfluence (id,eventinfluence,eventname,EVTINF_ID) VALUES (8,0.5,'MOVEDAWAY',0);
INSERT INTO eventinfluence (id,eventinfluence,eventname,EVTINF_ID) VALUES (9,0.5,'APPROACHED',0);
INSERT INTO eventinfluence (id,eventinfluence,eventname,EVTINF_ID) VALUES (10,0.2,'SMILING',0);
INSERT INTO eventinfluence (id,eventinfluence,eventname,EVTINF_ID) VALUES (11,0.4,'POSVOICEEMOTION',0);
INSERT INTO eventinfluence (id,eventinfluence,eventname,EVTINF_ID) VALUES (12,0.4,'NEGVOICEEMOTION',0);
INSERT INTO eventinfluence (id,eventinfluence,eventname,EVTINF_ID) VALUES (13,0.6,'POSEMOSTATE',0);
INSERT INTO eventinfluence (id,eventinfluence,eventname,EVTINF_ID) VALUES (14,0.6,'NEGEMOSTATE',0);
INSERT INTO eventinfluence (id,eventinfluence,eventname,EVTINF_ID) VALUES (15,0.4,'SPEECHDETECTED',0);


INSERT INTO BAILE (ID, NOMBRE, GENERO_GENERO) VALUES (0, 'MACARENA', 'Carranga');
INSERT INTO BAILE (ID, NOMBRE, GENERO_GENERO) VALUES (1, 'CELEBRATE', 'Vallenato' );
INSERT INTO BAILE (ID, NOMBRE, GENERO_GENERO) VALUES (2, 'LAMBADA',  'Pop');

insert into preferenciaxbaile (BAILE_ID,PERFIL_PREFERENCIA_PERFILPWA_CEDULA,GUSTO) values (0,123456789,0.7);
insert into preferenciaxbaile (BAILE_ID,PERFIL_PREFERENCIA_PERFILPWA_CEDULA,GUSTO) values (1,123456789,1);
insert into preferenciaxbaile (BAILE_ID,PERFIL_PREFERENCIA_PERFILPWA_CEDULA,GUSTO) values (2,123456789, 0.4);

commit;