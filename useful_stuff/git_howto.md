git ist cool. Und git hilft euch: es wimmelt in vielen
Ausgaben an konkreten Hilfestellungen, gerade, wenn etwas nicht funktioniert.

Einfacher workflow
==================

Wir initialisieren das Repository

    git init

fügen alle Dateien hinzu,

    git add .

und erstellen das erste commit.
    
    git commit -m "Initial commit"

Noch befinden wir uns im master-branch. In dem wollen wir allerdings nicht
arbeiten, sondern immer nur stabilen Code haben. Also erstellen wir einen
weiteren Zweig mit dem Namen development:

    git checkout -b development

----

Ab hier beginnt ein Kreislauf. 


Darin erstellen wir code, den wir, nach Möglichkeit in sinnvollen Abständen und
guten Betreffzeilen, regelmässigen commiten:

    git commit -a

bzw.

    git add datei
    git commit -m "guter Betreff"

Sind wir soweit, dass wir den code in den stabilen master-branch übertragen
wollen, wechseln wir in diesen:

    git checkout master

Es gibt zwei Möglichkeiten, den code zu übertragen: mit merge oder rebase. Der
einfachere Weg ist merge:
    
    git merge development

Sollten hierbei Konflikte auftreten, sagt git euch das. In den problematische
Dateien sind die Stellen markiert:

    <<<<<<< HEAD:file.txt
    Hello world
    =======
    Goodbye
    >>>>>>> 77976da35a11db4580b80ae27e8d65caf5208086:file.txt

Bearbeitet die kritischen Stellen, added die Datei und commitet neu. Alles
sollte glatt laufen.

rebase hat den Vorteil, dass ihr damit commits zusammenfassen könnt und somit
nicht alle commits aus dem development-Zweig im master-Zweig habt. Allerdings
kann rebase auch Dinge kaputt machen, ich gehe darum erstmal nicht weiter drauf
ein. 

Jetzt könnt ihr zurück zu eurem development-Zweig wechseln und am nächsten
feature arbeiten, der Kreis schliesst sich:
    
    git checkout development


Befehle, die ihr ständig benutzen werdet
----------------------------------------

    git status
    git diff
    git log

Ahh! Ich will etwas rückgängig machen!
--------------------------------------

Was vermutlich am häufigsten vorkommt: ihr habt commited und merkt danach, dass
ihr eine Datei vergessen habt oder der Betreff scheisse gewählt war. Das Problem
ist einfach gelöst:
    
    git commit --amend

Wollt ihr commiten und merkt, dass ihr eine Datei bereits geadded habt, die ihr
eigentlich in einen eigenen commit packen wolltet, dann unstaged sie einfach.
Die Datei wird dabei nicht verändert.

    git reset HEAD pfad/zur/dateiname

Und was, wenn ihr schon in der Datei gearbeitet habt und sie in den Zustand des
letzten commits zurückversetzen wollt? Auch kein Problem. Aber vorsicht, alle
Änderungen an der Datei seit dem letzten commit sind futsch!

    git checkout -- pfad/zur/dateiname

Und was, wenn die Datei in nem alten commit liegt? Dann nehmt anstelle der -- den revision key (das ist diese Zahlen-/Buchstabenkombi, der ihr des öfteren begegnet) des betreffenden commits. 

    git checkout 61e4589 pfad/zur/dateiname

git ist, was die Angabe des revision keys angeht, recht flexibel. In der Regel kann man das auch in Relation zum aktuellen Stand machen. Hier wollen wir die Datei aus dem vorletzten Commit haben:

    git checkout HEAD~2 pfad/zur/dateiname

Aber wie sah die Datei denn im vorletzten commit überhaupt aus:

    git show HEAD~2:pfad/zur/dateiname

Zu github und zurück
--------------------

Soweit macht ihr alles auf eurem Rechner. Es gibt zwei grundlegende Befehle, um
eure Sachen auf github zu übertragen, diese sind recht selbsterklärend und
reichen eigentlich aus.

    git pull

und

    git push

Beim pullen kann es unter Umständen wieder zu Konflikten kommen, die ihr, wie
oben, lösen müsst.
