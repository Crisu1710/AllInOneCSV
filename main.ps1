$csvs = Import-Csv -Path  (Get-ChildItem -Filter '*.csv').FullName                #Get all CSV files in folder
$csvs = $csvs  | Export-Csv -Path .\cash.csv -NoTypeInformation                   #Put all CSV files in one CSV file coled cash.csv
$inputCsv = Import-Csv ./cash.csv | Sort-Object * -Unique                         #Get cash CSV file and delete duplicate name
$inputCsv | Export-Csv ./Main.csv -NoTypeInformation                              #push all filterd names in Main.csv
$inputCo = Import-Csv ./Main.csv |  Where-Object {$_ -like '*ft_*'} | ConvertTo-Csv -NoTypeInformation | Select-Object -Skip 1 | Set-Content ./FT.csv
            #Get all names start with ft from Main.csv                                                   remove header            import as FT.scv
$inputCo = Import-Csv ./Main.csv |  Where-Object {$_ -like '*co_*'} | ConvertTo-Csv -NoTypeInformation | Select-Object -Skip 1 | Set-Content ./CO.csv
            #Get all names start with co from Main.csv                                                   remove header            import as CO.scv
Remove-Item ./cash.csv #delete cash.csv
