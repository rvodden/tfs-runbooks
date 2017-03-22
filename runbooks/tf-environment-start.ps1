workflow tf-environment-start
{
    $Conn = Get-AutomationConnection -Name AzureRunAsConnection
    Add-AzureRMAccount -ServicePrincipal -Tenant $Conn.TenantID -ApplicationId $Conn.ApplicationID -CertificateThumbprint $Conn.CertificateThumbprint
    Start-AzureRmVM -Name 'rdv-tfs-ad-1' -ResourceGroupName 'tfs'
    Parallel 
    {
        Start-AzureRmVM -Name 'rdv-tfs-db-1' -ResourceGroupName 'tfs'
        Start-AzureRmVM -Name 'rdv-tfs-tfs-1' -ResourceGroupName 'tfs'
        Start-AzureRmVM -Name 'rdv-tfs-sp-1' -ResourceGroupName 'tfs'
        Start-AzureRmVM -Name 'rdv-tfs-rdp-1' -ResourceGroupName 'tfs'
    }
}