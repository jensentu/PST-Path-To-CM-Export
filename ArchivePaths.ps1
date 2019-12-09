$Path = Read-Host -Prompt 'Enter the path for the folder containing the individual user archive folders'

Get-ChildItem -Path $Path -Directory | ForEach-Object {
    $(Get-ChildItem $PSItem.FullName -Recurse -File -Filter *.pst | Select-Object -ExpandProperty FullName) -join ";"  | Select-Object -Property @{
        Name = 'FullName'
        Expression = {$PSItem}
        }
} | Export-Csv -Path "$Path\export.csv" -Encoding ASCII -NoTypeInformation