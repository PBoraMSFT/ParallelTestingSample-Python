$tests = Get-ChildItem .\ -Filter "test*"
$totalAgents = [int]$Env:SYSTEM_TOTALJOBSINPHASE
$agentNumber = [int]$Env:SYSTEM_JOBPOSITIONINPHASE
$testCount = $tests.Count
Write-Host "Total agents: $totalAgents"
Write-Host "Agent number: $agentNumber"
Write-Host "Total tests: $testCount"

$testsToRun= @()

For ($i=$agentNumber; $i -le $testCount;) {
    $file = $tests[$i-1]
    $testsToRun = $testsToRun + $file
    Write-Host "Added $file"
    $i = $i + $totalAgents 
 }
$testFiles = $testsToRun -Join " "
Write-Host "Test files $testFiles"
Write-Host "##vso[task.setvariable variable=pytestfiles;]$testFiles"
