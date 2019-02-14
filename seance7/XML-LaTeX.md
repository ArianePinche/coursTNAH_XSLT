# séance 7 : Transformation XML vers LaTeX
---
# Exercice

---
 
## Étape 1

À partir du fichier TEI lucain.xml
Régler un scénario XSL avec en entrée lucain.xml lucain.xsl en sortie lucain.tex

- Préparez votre structure LaTeX à l’aide du document de départ ProjetLucain.tex;
- Paramétrez votre en-tête pour une sortie XML vers text;
- Créer une structure LaTeX d’accueil pour le texte de Lucain;
- Paramétrer un document de sortie directement dans l’XSL;
- Intégrer les vers à la structure;
- Ne sélectionner que le texte des lem;
- Faire commencer la numérotation au numéro du premier vers de l’extrait grâce au paramètre  \setline de LaTeX.
      
---
# LaTeX : package Reledmac

LateX offre de nombreuses possibilités de mise en page dont la possibilité de mettre en page une édition avec un apparat critique.

Le package pour créer des apparats critiques est **Reledmac**.
https://ctan.org/pkg/reledmac 

Le package fonctionne sur un système d’étage de note :
\Afootnote \Bfootnote \Cfootnote qui permette de créer différents étages d’apparat.

---

L’apparat se signale au fil du texte, le texte  à éditer dans *edtext* et la leçon dans le *footnote*.

`\edtext{texte_edité}{\Afootnote{leçon, sigle}}`
 
Pour signaler l’apparat, le package s’appuie sur la numérotation des lignes, il est donc nécessaire de paramétrer celle-ci pour produire son édition avec les commandes : \beginnumbering et \endnumbering.

**NB** : Pour créer des vers compatibles avec le package utiliser la commande `\stanza` pour les strophes.

Les vers sont compris dans les strophes, la fin d’un vers est marqué par `&` et la fin de la strophe par `\&`.  

---
  

## Étape 2

- Constituer l’apparat critique à l’aide de Reledmac 
- Associer le texte édité à un apparat critique en notes de bas de page;
	- Récupérer les différentes leçons suivies de leurs sigles ;
	- Séparer chaque leçon par une virgule sauf la dernière ;
	- Quand une leçon est une omission, faire apparaître omisit en italique, suivi du sigle du ou des manuscrit(s) ;
	- Quand une leçon est sous une rature (rasura), faire apparaître après le texte de la leçon la mention rasura en italique et entre parenthèses.
