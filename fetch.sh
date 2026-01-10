#!/bin/bash
mvn dependency:copy-dependencies -f $1 -DoutputDirectory=$2 -DincludeScope=runtime --settings settings.xml
