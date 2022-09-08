# Progetto Codifica di Testi A.A. 21-22
Il progetto "Codifica di Testi" è stato realizzato durante l'anno accademico 2021/2022 per l'esame del professor <b>Angelo Mario del Grosso </b>, per la laurea in <b> Informatica Umanistica</b> dell'<b>Università di Pisa</b> da:

- Benedetta Peccianti, matricola 600695
- Martina Tazzini, matricola 585137

Per la corretta riuscita del progetto sono stati utilizzati due strumenti di validazione:

# Validazione del file xml

```shell
   $ java -cp "tools/Xerces-J-bin.2.12.1/xerces-2_12_1/*" dom.Counter -v ./prolusione3.xml 
```

# Creazione dell'html con xsl

```shell
   $ java -jar tools/SaxonHE10-3J/saxon-he-10.3.jar -s:prolusione3.xml -xsl:style.xsl -o:pagina.html
 
```

