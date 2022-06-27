[CmdletBinding()]
param (
  [string]
  $filter='*',
  [ValidateSet('always', 'never')]
  [string] $pull = 'always',
  [switch] $mountTmp
)

# Run all tests using docker and a read-only file system so the docker image cannot impact the local files.

$rootFolder = Split-Path $PSScriptRoot
docker run --pull $pull --rm -v "${rootFolder}:/pwd:ro" $(
  if ($mountTmp) {
    $null=new-item -type directory -force $rootFolder/tmp
    '-v'
    "$rootFolder/tmp:/tmp"
  }) python bash /pwd/tests/run-unittests.sh $filter