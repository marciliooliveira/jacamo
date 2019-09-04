// Agent telescopio in project helloworld

/* Initial beliefs and rules */
planet("Mercury").
planet("Venus").
planet("Earth").
planet("Mars").
planet("Jupiter").
planet("Saturn").
planet("Neptune").
planet("Uranus").

/* Initial goals */

!start.

/* Plans */

+!start : true <- .print("hello world.");
					.println("I can tell all the planets of the solar system! : ");
					.findall(X, planet(X), L);
					.println("They are : ", L);
					!procurarArtefato. // lanço um objetivo!
					
+!procurarArtefato <- lookupArtifact("cont", Id);
						focus(Id).
						
-!procurarArtefato <- !procurarArtefato.


{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
//{ include("$moiseJar/asl/org-obedient.asl") }
