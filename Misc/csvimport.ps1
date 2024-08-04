$test = Import-Csv "C:\Users\apagan\OneDrive - BizoIT, Inc\Documents\R\win-library\3.4\sf\gdal\unit_of_measure.csv"|
Foreach-Object {
   $_.revision_date = $_.revision_date -as [datetime]
   $_ } 

$test2 = Import-Csv "C:\Users\apagan\OneDrive - BizoIT, Inc\Documents\R\win-library\3.4\sf\gdal\unit_of_measure2.csv"|
Foreach-Object {
   $_.revision_date = $_.revision_date -as [datetime]
   $_ }
$d = get-date
$test2 | Add-Member -MemberType NoteProperty "exceptiondays" -Value 0
$test2| ForEach{[string]$_.exceptiondays = $d.Date - $_.revision_date.Date}
$test2 | foreach {$_.exceptiondays = $_.exceptiondays.trimend(".00:00")}


$Result = @()

 Foreach ($oum in $test)
{
    $Match = $test2 | where {$_.uom_code -eq $oum.uom_code}
    If($Match)
    {       
     $Result += New-Object PsObject -Property @{uom_code =$test.uom_code;
                                                     }
    }
   
}

$Result