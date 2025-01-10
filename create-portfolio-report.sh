#!/bin/bash

# Name of notebook WITHOUT .ipynb extension
notebookName="jk-janney-portfolio"

# Run notebook
jupyter-nbconvert --to notebook --execute --inplace "${notebookName}.ipynb" --Execute.Preprocessor.kernel_name=finance-env

currentDate=`date +"%Y-%m-%d"`

pdfName="${notebookName}-${currentDate}.pdf"

# Convert to pdf
jupyter-nbconvert $notebookName --to pdf --output "reports/$pdfName"
