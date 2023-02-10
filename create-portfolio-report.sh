#!/bin/bash

# Name of notebook WITHOUT .ipynb extension
notebookName="jk-janney-portfolio"

# Run notebook
jupyter-nbconvert --to notebook --execute --inplace "${notebookName}.ipynb"

currentDate=`date +"%Y-%m-%d"`

pdfName="${notebookName}-${currentDate}.pdf"

# Convert to pdf
jupyter-nbconvert $notebookName --to pdf --output "reports/$pdfName"
