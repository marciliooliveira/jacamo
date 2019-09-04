// Agent aluno in project helloworld

/* Initial beliefs and rules */

/* Initial goals */

!start.

/* Plans */

+!start : true <- .print("hello world."); 
					.send("sample_agent", tell, ola);
					.wait(1000);
					.send(sample_agent, achieve, fatorial);
					.wait(1000); // aguardo a resposta - eventos assíncronos!
					.send(sample_agent, askOne, fat(X, Y)); //unifica os valores X e Y
					!criaContador.

// tratamento para receber os valores da crença fat
+fat(X, Y) <- .println("Fatorial de ", X, " é ", Y).

//Plano para criar um artefato do tipo contador
+!criaContador <- makeArtifact("cont", "helloworld.Contador", [0], ID);
					focus(ID);
					inc.
				
// tratamento do sinal recebido!	
+tick <- .println("Sinal recebido! Count incrementado!").
					
{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
//{ include("$moiseJar/asl/org-obedient.asl") }


/*
*/