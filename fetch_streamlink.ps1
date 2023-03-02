####
#Gewünschten Film eingeben (Underscore als Trennzeichen)
#fetcht Streamlink von kinox, womöglich muss man mehrere Anbieter abgrasen, diese haben IDs
#durchgehen der Mirrors, bis einer funktioniert
#myjdownloader integration, um nur die audio zu laden
###

#region Variablen
$Hoster = @(
    '91' #upstream.to
)

#endregion

$movieInput = Read-Host "Bitte Filmtitel eingeben (mit Unterstrichen): "

foreach($anbieter in $Hoster){
$raw_kinox = Invoke-WebRequest -URI "https://www.kinos.to/aGET/Mirror/$movieInput&Hoster=$anbieter&mirror=1" -UseBasicParsing #get link
$string = $raw_kinox.Content|ForEach-Object{$_.split('"')[4]} #extrahiere streamseite
if($null -ne $string){ #wenn nicht leer
    $streamlink = $string -replace "\\" #richtige formatierung, den hier an jdownloader übergeben
    Write-Host $streamlink
}
}