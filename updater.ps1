# Date: 12/20/2014
# Title: Windows Update Checker
# Author: CodeMonkeyRawks
# Website: www.codemonkeyrawks.net

Write-Host ""
Write-Host "Fetching Update List:"
Write-Host ""

# Get Windows Updates -
$UpdateSession = New-Object -ComObject Microsoft.Update.Session
$UpdateSearcher = $UpdateSession.CreateUpdateSearcher()
$Result = $UpdateSearcher.Search("Type='Software' and IsInstalled=0") # Not Installed
$Result1 = $UpdateSearcher.Search("Type='Software' and IsInstalled=1") # Installed

# Write Windows Updates to Screen
Write-Host  "------------------------------------- Windows Update Checker ------------------------------------------"    
Write-Host ""                                                        

# For-Loop/For-Each Update
for($i=0; $i -le $Result.Updates.Count-1; $i++) {

 $Article = ("KB" + $Result.Updates.Item($i).KBArticleIDs.Item(0))
 
 # Format KB Articles
 if ($Article.Length -lt 9) { $Article = $Article + " " }
 
 # Write Each KB Seperatly
 if ($i -lt 9) { Write-Host [00$($i+1)] $Article - -nonewline }
  elseif ($i -lt 99) { Write-Host [0$($i+1)] $Article - -nonewline }
   else { Write-Host [$($i+1)] $Article - -nonewline }
 
 # After 6 KB's: Make New Line
 if ($Host.UI.RawUI.CursorPosition.X -gt 100) { Write-Host "" }
}

Write-Host ""
Write-Host "" 

 # Fix Counter: Formatting
 if (($Result.Updates.Count-1) -lt 100) {
  Write-Host "-------------------------------------" ($Result.Updates.Count) "Update(s): Needed --------------------------------------------"
  }
   else {
    Write-Host "-------------------------------------" ($Result.Updates.Count) "Update(s): Needed -------------------------------------------"
   }
   
Write-Host ""                                                         

# For-Loop/For-Each Update
for($i=0; $i -le $Result1.Updates.Count-1; $i++) {

 $Article = ("KB" + $Result1.Updates.Item($i).KBArticleIDs.Item(0))
 
 # Format KB Articles
 if ($Article.Length -lt 9) { $Article = $Article + " " }
 
 # Write Each KB Seperatly
 if ($i -lt 9) { Write-Host [00$($i+1)] $Article - -nonewline }
  elseif ($i -lt 99) { Write-Host [0$($i+1)] $Article - -nonewline }
   else { Write-Host [$($i+1)] $Article - -nonewline }
 
 # After 6 KB's: Make New Line
 if ($Host.UI.RawUI.CursorPosition.X -gt 100) { Write-Host "" }
}

Write-Host ""
Write-Host ""

 # Fix Counter: Formatting
 if (($Result1.Updates.Count-1) -lt 100) {
  Write-Host "------------------------------------" ($Result1.Updates.Count) "Update(s): Installed ------------------------------------------"
  }
   else {
    Write-Host "------------------------------------" ($Result1.Updates.Count) "Update(s): Installed -----------------------------------------"
   }
   
Write-Host "" 
