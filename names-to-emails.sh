#!/bin/bash

domain="example.com"

while IFS=',' read -r first_name last_name; do
    # Remove accents from the first name and last name
    first_name=$(echo $first_name | iconv -f utf8 -t ascii//TRANSLIT)
    last_name=$(echo $last_name | iconv -f utf8 -t ascii//TRANSLIT)
    
    # Remove apostrophes from the last name
    last_name=${last_name//\'/}
    
    # Generate email addresses using different combinations of the first name and last name
    email1="${first_name}.${last_name}@${domain}"
    email2="${last_name}.${first_name}@${domain}"
    email3="${first_name:0:1}.${last_name}@${domain}"
    email4="${last_name:0:1}.${first_name}@${domain}"
    
    # Print the generated email addresses
    echo $email1
    echo $email2
    echo $email3
    echo $email4
done < file.csv
