# Webseite der Münchner Open-Source-Treffen

Die Quelldateien der Webseite werden mittels eines Git-Repositories verwaltet. In dem Repository befindet sich die Datei `_layout.ejs` und mehrere Markdown Dateien (`*.md`). `_layout.ejs` legt das Layout(Header, Menü, Footer, etc) der Seite fest fest. ejs ist eine Templatesprache für node.js, es besteht aus HTML mit Platzhaltern. Die Dateien mit der Endung *.md enthalten die Inhalte der Seite. Diese Dateien werden bei jedem `git push` mittels eines statischen Webseitengenerators (harp) in html Dateien übersetzt und zum Webserver übertragen. Dies erfolgt mittels eines post-receive hooks des Git-Repostories. (siehe auch: `uebersicht.svg`)

## Ändern der Seite

Um die Seite zu editieren sind folgende Schritte notwendig:
* Git Repository clonen
  `$git clone git@...:ost-website.git`
* Editieren der Dateien im Verzeichnis `site`. 
* Übertragen der Änderungen zum Server   
  `$git add <dateiname>`   
  `$git commit -m " ... geändert"`   
  `$git push origin master`   
* Nach dem Pushen der Änderungen wird die Seite sofort neu generiert und deployed.


## lokales ausprobieren der generierten Seite (optional)

* node.js in der Version 4.x oder 5.x installieren (https://nodejs.org/en/)
* Harp installieren (npm ist in einer node.js installation enthalten):   
  `$npm install -g harp`
* In das Verzeichnis `site` wechseln und `harp server` aufrufen
* Anschliessend die Url `http://localhost:9000/` aufrufen


## Hinzufügen weiterer Benutzer

Um die Seite editieren zu können, ist es notwendig das ein SSH pubkey in gitolite hinterlegt ist. Deinen Key habe ich dort bereits hinterlegt, weitere Benutzer können wie folgt hinzugefügt werden:
Klonen des Admin Repositories:
`$git clone git@...:gitolite-admin.git`

Ablegen der SSH Keys im Verzeichnis `keydir`   
`$git add <dateiname>`   
`$git commit -m "Schlüssel von ... hinzugefügt"`   
`$git push origin master`   


## Verwendete Software
* gitolite (http://gitolite.com/gitolite/index.html)
* node.js (https://nodejs.org/en/)
* harp (https://harpjs.com/)


## Pfade auf dem Server
* Git-Repository: `/var/lib/gitolite/repositories/ost-website.git/`
* post-receive hook: `/var/lib/gitolite/repositories/ost-website.git/hooks/post-receive`
* Node Installation (beinhaltet harp): `/opt/node-v4.4.4-linux-x64/`
* html-Webseite: `/var/www/opensourcetreffen.de`

