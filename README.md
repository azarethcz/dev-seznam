1.) Přidána metoda.
-Úprava statusového kodu v src/main/java/NginxDataReader.java


2.) -Zde chyba ERROR: failed to solve: ubuntu:noble: failed to resolve source metadata for docker.io/library/ubuntu:noble: error getting credentials - err: exit status 1, out: ``
-Kdyby obraz nenaběhnul pustit tento command: docker pull ubuntu:noble 
mě to z docker image nechtělo stáhnout



-Zbuildíme dockerimage:  "docker build -t devbuild ."

-Po zbuildování dockerimage spustíme kontejner "docker run -p 9400:9400 -it --rm devbuild"



-A veškeré metriky se nám zobrazí na localhost:9400/metrics

-Ke skriptu jsem přidal ./start.sh pro automatizované spouštění.

-Spočteme "wget -q  -O - http://localhost:9400/metrics | grep nginxlog_status_codes_total"

-------------------------------------------------------------------------
