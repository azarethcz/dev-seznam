#!/bin/bash

# Sestavení Docker image
docker build -t devbuild .

# Pokud sestavení proběhlo úspěšně, spusť kontejner
if [ $? -eq 0 ]; then
    echo "Docker image byl úspěšně sestaven. Spouštím kontejner..."
    docker run -p 9400:9400 -it --rm devbuild
else
    echo "Chyba při sestavování Docker image!"
    exit 1
fi