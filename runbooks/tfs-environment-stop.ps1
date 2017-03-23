workflow tfs-environment-stop
{
    $Conn = Get-AutomationConnection -Name AzureRunAsConnection
    Add-AzureRMAccount -ServicePrincipal -Tenant $Conn.TenantID -ApplicationId $Conn.ApplicationID -CertificateThumbprint $Conn.CertificateThumbprint
    Parallel 
    {
        Stop-AzureRmVM -Name 'rdv-tfs-db-1' -ResourceGroupName 'tfs'
        Stop-AzureRmVM -Name 'rdv-tfs-tfs-1' -ResourceGroupName 'tfs'
        Stop-AzureRmVM -Name 'rdv-tfs-sp-1' -ResourceGroupName 'tfs'
        Stop-AzureRmVM -Name 'rdv-tfs-rdp-1' -ResourceGroupName 'tfs'
    }
    Stop-AzureRmVM -Name 'rdv-tfs-ad-1' -ResourceGroupName 'tfs'
}