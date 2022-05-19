curl -X GET "https://api.localizely.com/v1/projects/942e7477-7f15-4bb1-813f-99e9c6f83a46/files/download?type=flutter_arb&export_empty_as=empty" -H "accept: */*" -H "X-Api-Token: 0b94e0613faa4c868f341747c90a4f743d140942ae0540fdb2eed66d6f3c2f4b" -o /dev/tmp/lang.zip
unzip -o \dev\tmp\lang.zip -d .\lib\src\l10n\
del \dev\tmp\lang.zip