// Agent sample_agent in project helloworld

/* Initial beliefs and rules */
ensolarado.
name(marcilio).
estaEm(marcilio, unesp).
linguagem(agentSpeak).
ensina(marcilio, linguagem(agentSpeak)).
temperatura(19).
fat(0,1).

/* Initial goals */
!start.

/* Plans */
+!start : name(X) <- .print("Olá ", X, ", como vai?");
					-ensolarado;
					+chuvoso;
					-+estaEm(marcilio, estrada);
					!checarLinguagem;
					!checarClima.

+!checarLinguagem : name(X) & linguagem(Y) & ensina(X, linguagem(Y))<- .println("Linguagem: ", Y).
+!checarClima : ensolarado <- .println("Beber algo gelado!").
+!checarClima : chuvoso & temperatura(Y) & Y <= 12 <- .println("Pegar o guarda-chuva e o casaco!").
-!checarClima <- .println("Temperatura acima de 12 graus").

// tratando o evento ola
+ola[source(A)] <- .println("Olá, agente ", A);
					.send(aluno, tellHow, "+!dizerOi <- .println(\"Olá, agente! \").");
					.send(aluno, achieve, dizerOi).

+!fatorial : fat(X, Y) & X < 5 <- +fat(X+1, (X+1)*Y);
			 !fatorial.

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
//{ include("$moiseJar/asl/org-obedient.asl") }
