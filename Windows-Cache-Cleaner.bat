@echo off
setlocal DisableDelayedExpansion
rem Single-file CMD launcher; the embedded PowerShell runs in this same console.
powershell.exe -NoLogo -NoProfile -ExecutionPolicy Bypass -Command "$file='%~f0';$env:EMERTELS_CACHE_BATCH=$file;$lines=[IO.File]::ReadAllLines($file);$marker=[Array]::IndexOf($lines,'#PS_PAYLOAD');if($marker -lt 0){exit 3};$payload=$lines[($marker+1)..($lines.Length-1)] -join [Environment]::NewLine;. ([scriptblock]::Create($payload))"
set "RESULT=%ERRORLEVEL%"
exit /b %RESULT%
#PS_PAYLOAD
$ErrorActionPreference='Continue'
$culture=[Globalization.CultureInfo]::CurrentUICulture.Name
$lang=switch -Regex ($culture) {
    '^pt' {'pt-BR';break} '^es' {'es';break} '^fr' {'fr';break} '^de' {'de';break}
    '^it' {'it';break} '^ja' {'ja';break} '^ko' {'ko';break}
    '^zh-(TW|HK|MO)' {'pt-BR';break} '^(zh|cmn)' {'zh-CN';break}
    '^ru' {'ru';break} default {'pt-BR'}
}
$T=@{
    'pt-BR'=@('LIMPEZA AVANÇADA DO WINDOWS E CACHES DE NAVEGADORES','Sessão iniciada','Idioma detectado','Solicitando privilégios de administrador...','Não foi possível solicitar elevação. Execute como administrador.','Arquivos temporários do usuário','Arquivos temporários do Windows','Cache de entrega do Windows','Cache de miniaturas do Windows','Cache do Microsoft Edge','Cache do Google Chrome','Cache do Mozilla Firefox','Ignorado: feche o navegador antes de limpar o cache.','Cache limpo','Nada para limpar','Falha parcial ao limpar','Resumo da limpeza','Pastas verificadas','Itens removidos','Itens ignorados ou com erro','Concluído. Histórico, favoritos, senhas, cookies e sessões foram preservados.','Pressione Enter para fechar.')
    en=@('ADVANCED WINDOWS AND BROWSER CACHE CLEANUP','Session started','Detected language','Requesting administrator privileges...','Could not request elevation. Run as administrator.','User temporary files','Windows temporary files','Windows delivery cache','Windows thumbnail cache','Microsoft Edge cache','Google Chrome cache','Mozilla Firefox cache','Skipped: close the browser before its cache can be cleaned.','Cache cleaned','Nothing to clean','Some items could not be removed','Cleanup summary','Folders checked','Items removed','Items skipped or failed','Completed. Browser history, bookmarks, passwords, cookies, and sessions were preserved.','Press Enter to close.')
    es=@('LIMPIEZA AVANZADA DE WINDOWS Y CACHÉS DE NAVEGADORES','Sesión iniciada','Idioma detectado','Solicitando privilegios de administrador...','No se pudo solicitar elevación. Ejecute como administrador.','Archivos temporales del usuario','Archivos temporales de Windows','Caché de distribución de Windows','Caché de miniaturas de Windows','Caché de Microsoft Edge','Caché de Google Chrome','Caché de Mozilla Firefox','Omitido: cierre el navegador antes de limpiar la caché.','Caché limpiada','No hay nada que limpiar','Algunos elementos no se pudieron eliminar','Resumen de limpieza','Carpetas comprobadas','Elementos eliminados','Elementos omitidos o con errores','Finalizado. Se conservaron el historial, favoritos, contraseñas, cookies y sesiones.','Pulse Enter para cerrar.')
    fr=@('NETTOYAGE AVANCÉ DE WINDOWS ET DES CACHES NAVIGATEUR','Session démarrée','Langue détectée','Demande des droits administrateur...','Impossible de demander l''élévation. Exécutez en tant qu''administrateur.','Fichiers temporaires utilisateur','Fichiers temporaires Windows','Cache de distribution Windows','Cache des miniatures Windows','Cache Microsoft Edge','Cache Google Chrome','Cache Mozilla Firefox','Ignoré : fermez le navigateur avant de nettoyer le cache.','Cache nettoyé','Rien à nettoyer','Certains éléments n''ont pas pu être supprimés','Résumé du nettoyage','Dossiers vérifiés','Éléments supprimés','Éléments ignorés ou en échec','Terminé. Historique, favoris, mots de passe, cookies et sessions sont préservés.','Appuyez sur Entrée pour fermer.')
    de=@('ERWEITERTE BEREINIGUNG VON WINDOWS- UND BROWSER-CACHES','Sitzung gestartet','Erkannte Sprache','Administratorrechte werden angefordert...','Rechteerhöhung fehlgeschlagen. Als Administrator ausführen.','Temporäre Benutzerdateien','Temporäre Windows-Dateien','Windows-Übermittlungscache','Windows-Miniaturansichtscache','Microsoft-Edge-Cache','Google-Chrome-Cache','Mozilla-Firefox-Cache','Übersprungen: Browser vor dem Bereinigen schließen.','Cache bereinigt','Nichts zu bereinigen','Einige Elemente konnten nicht entfernt werden','Bereinigungsübersicht','Geprüfte Ordner','Entfernte Elemente','Übersprungene oder fehlgeschlagene Elemente','Abgeschlossen. Verlauf, Lesezeichen, Kennwörter, Cookies und Sitzungen bleiben erhalten.','Zum Schließen die Eingabetaste drücken.')
    it=@('PULIZIA AVANZATA DI WINDOWS E DELLE CACHE DEI BROWSER','Sessione avviata','Lingua rilevata','Richiesta dei privilegi di amministratore...','Impossibile richiedere l''elevazione. Esegui come amministratore.','File temporanei utente','File temporanei di Windows','Cache di recapito di Windows','Cache miniature di Windows','Cache di Microsoft Edge','Cache di Google Chrome','Cache di Mozilla Firefox','Saltato: chiudi il browser prima di pulire la cache.','Cache pulita','Niente da pulire','Impossibile rimuovere alcuni elementi','Riepilogo pulizia','Cartelle controllate','Elementi rimossi','Elementi ignorati o non riusciti','Completato. Cronologia, preferiti, password, cookie e sessioni sono stati conservati.','Premi Invio per chiudere.')
    ja=@('Windows とブラウザーのキャッシュを高度にクリーンアップ','セッション開始','検出された言語','管理者権限を要求しています...','昇格を要求できませんでした。管理者として実行してください。','ユーザーの一時ファイル','Windows の一時ファイル','Windows 配信キャッシュ','Windows サムネイル キャッシュ','Microsoft Edge キャッシュ','Google Chrome キャッシュ','Mozilla Firefox キャッシュ','スキップ: キャッシュを消去する前にブラウザーを閉じてください。','キャッシュを消去しました','消去する項目はありません','一部の項目を削除できませんでした','クリーンアップの概要','確認したフォルダー','削除した項目','スキップまたは失敗した項目','完了しました。履歴、お気に入り、パスワード、Cookie、セッションは保持されています。','Enter キーを押して閉じます。')
    ko=@('Windows 및 브라우저 캐시 고급 정리','세션 시작','감지된 언어','관리자 권한을 요청하는 중...','권한 상승을 요청할 수 없습니다. 관리자 권한으로 실행하세요.','사용자 임시 파일','Windows 임시 파일','Windows 배달 캐시','Windows 썸네일 캐시','Microsoft Edge 캐시','Google Chrome 캐시','Mozilla Firefox 캐시','건너뜀: 캐시를 정리하기 전에 브라우저를 닫으세요.','캐시 정리 완료','정리할 항목 없음','일부 항목을 삭제하지 못했습니다','정리 요약','확인한 폴더','삭제한 항목','건너뛰거나 실패한 항목','완료되었습니다. 방문 기록, 즐겨찾기, 암호, 쿠키 및 세션은 보존되었습니다.','Enter 키를 눌러 닫으세요.')
    'zh-CN'=@('Windows 和浏览器缓存高级清理','会话开始时间','检测到的语言','正在请求管理员权限...','无法请求提升权限。请以管理员身份运行。','用户临时文件','Windows 临时文件','Windows 传递缓存','Windows 缩略图缓存','Microsoft Edge 缓存','Google Chrome 缓存','Mozilla Firefox 缓存','已跳过：清理缓存前请关闭浏览器。','缓存已清理','没有需要清理的内容','部分项目无法删除','清理摘要','检查的文件夹','已删除项目','已跳过或失败的项目','已完成。历史记录、书签、密码、Cookie 和会话均已保留。','按 Enter 关闭。')
    ru=@('РАСШИРЕННАЯ ОЧИСТКА WINDOWS И КЭША БРАУЗЕРОВ','Сеанс начат','Обнаруженный язык','Запрос прав администратора...','Не удалось запросить повышение прав. Запустите от имени администратора.','Временные файлы пользователя','Временные файлы Windows','Кэш доставки Windows','Кэш эскизов Windows','Кэш Microsoft Edge','Кэш Google Chrome','Кэш Mozilla Firefox','Пропущено: закройте браузер перед очисткой кэша.','Кэш очищен','Нет данных для очистки','Не удалось удалить некоторые элементы','Итог очистки','Проверено папок','Удалено элементов','Пропущено или не удалено','Готово. История, закладки, пароли, cookie и сеансы сохранены.','Нажмите Enter, чтобы закрыть.')
}
$L=$T[$lang]
$S=@{
    'pt-BR'=@('Caches e pastas temporárias do Windows','Arquivos temporários do usuário','Caches temporários dos navegadores','Caches de shaders gráficos e aplicativos','Cache de miniaturas do Windows','Logs temporários de instalação','Cache de resolução DNS','Verificação final e resumo')
    en=@('Windows caches and temporary folders','User temporary files','Temporary browser caches','Graphics shader and application caches','Windows thumbnail cache','Temporary setup logs','DNS resolver cache','Final review and summary')
    es=@('Cachés y carpetas temporales de Windows','Archivos temporales del usuario','Cachés temporales de navegadores','Cachés de sombreadores y aplicaciones','Caché de miniaturas de Windows','Registros temporales de instalación','Caché de resolución DNS','Revisión final y resumen')
    fr=@('Caches et dossiers temporaires de Windows','Fichiers temporaires utilisateur','Caches temporaires des navigateurs','Caches de shaders graphiques et applications','Cache des miniatures Windows','Journaux temporaires d''installation','Cache du résolveur DNS','Vérification finale et résumé')
    de=@('Windows-Caches und temporäre Ordner','Temporäre Benutzerdateien','Temporäre Browser-Caches','Grafikshader- und Anwendungscaches','Windows-Miniaturansichtscache','Temporäre Installationsprotokolle','DNS-Auflösungscache','Abschlussprüfung und Übersicht')
    it=@('Cache e cartelle temporanee di Windows','File temporanei utente','Cache temporanee dei browser','Cache shader grafici e delle applicazioni','Cache miniature di Windows','Registri temporanei di installazione','Cache del resolver DNS','Controllo finale e riepilogo')
    ja=@('Windows のキャッシュと一時フォルダー','ユーザーの一時ファイル','ブラウザーの一時キャッシュ','グラフィックス シェーダーとアプリのキャッシュ','Windows サムネイル キャッシュ','一時セットアップ ログ','DNS リゾルバー キャッシュ','最終確認と概要')
    ko=@('Windows 캐시 및 임시 폴더','사용자 임시 파일','브라우저 임시 캐시','그래픽 셰이더 및 앱 캐시','Windows 썸네일 캐시','임시 설치 로그','DNS 확인자 캐시','최종 검토 및 요약')
    'zh-CN'=@('Windows 缓存和临时文件夹','用户临时文件','浏览器临时缓存','图形着色器和应用缓存','Windows 缩略图缓存','临时安装日志','DNS 解析缓存','最终检查和摘要')
    ru=@('Кэш и временные папки Windows','Временные файлы пользователя','Временный кэш браузеров','Кэш графических шейдеров и приложений','Кэш эскизов Windows','Временные журналы установки','Кэш DNS-резолвера','Итоговая проверка и сводка')
}[$lang]
$StartMessage=@{'pt-BR'='Iniciando limpeza direta e segura...';en='Starting a direct and safe cleanup...';es='Iniciando una limpieza directa y segura...';fr='Démarrage du nettoyage direct et sécurisé...';de='Direkte und sichere Bereinigung wird gestartet...';it='Avvio della pulizia diretta e sicura...';ja='直接かつ安全なクリーンアップを開始します...';ko='직접 안전 정리를 시작합니다...';'zh-CN'='正在开始直接且安全的清理...';ru='Запуск прямой и безопасной очистки...'}[$lang]
$batchPath=$env:EMERTELS_CACHE_BATCH
try { [Console]::OutputEncoding=[Text.UTF8Encoding]::new($false) } catch {}
try { $Host.UI.RawUI.BackgroundColor='Black'; $Host.UI.RawUI.ForegroundColor='Gray'; $Host.UI.RawUI.WindowTitle='cmd.exe'; Clear-Host } catch {}
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    try { Start-Process -FilePath $batchPath -Verb RunAs; exit 0 }
    catch { Write-Host $L[4] -ForegroundColor Red; Read-Host $L[21] | Out-Null; exit 1 }
}
$started=Get-Date
$stats=@{Folders=0;Removed=0;Skipped=0;Failed=0}
$visited=[Collections.Generic.HashSet[string]]::new([StringComparer]::OrdinalIgnoreCase)
function Show-Stage([int]$Number,[string]$Title) { Write-Host ''; Write-Host ('='*72) -ForegroundColor DarkCyan; Write-Host ("[{0}/8] {1}..." -f $Number,$Title) -ForegroundColor Cyan; Write-Host ('='*72) -ForegroundColor DarkCyan }
function Clear-CachePath([string]$Path) {
    if ([string]::IsNullOrWhiteSpace($Path) -or -not $script:visited.Add($Path)) { return }
    $script:stats.Folders++
    if (-not (Test-Path -LiteralPath $Path)) { $script:stats.Skipped++; return }
    try {
        $root=Get-Item -LiteralPath $Path -Force -ErrorAction Stop
        if (($root.Attributes -band [IO.FileAttributes]::ReparsePoint) -ne 0) { $script:stats.Skipped++; return }
        foreach($item in Get-ChildItem -LiteralPath $Path -Force -ErrorAction Stop) {
            if (($item.Attributes -band [IO.FileAttributes]::ReparsePoint) -ne 0) { $script:stats.Skipped++; continue }
            try { Remove-Item -LiteralPath $item.FullName -Force -Recurse -ErrorAction Stop; $script:stats.Removed++ } catch { $script:stats.Failed++ }
        }
    } catch { $script:stats.Failed++ }
}
function Clear-LogFiles([string]$Path) {
    if (-not (Test-Path -LiteralPath $Path)) { return }
    foreach($file in Get-ChildItem -LiteralPath $Path -Filter '*.log' -File -Force -ErrorAction SilentlyContinue) {
        try { Remove-Item -LiteralPath $file.FullName -Force -ErrorAction Stop; $script:stats.Removed++ } catch { $script:stats.Failed++ }
    }
}
function Clear-ChromiumCaches([string]$Root,[string]$ProcessName) {
    if (-not (Test-Path -LiteralPath $Root)) { return }
    if (Get-Process -Name $ProcessName -ErrorAction SilentlyContinue) { $script:stats.Skipped++; Write-Host $L[12] -ForegroundColor Yellow; return }
    foreach($profile in Get-ChildItem -LiteralPath $Root -Directory -Force -ErrorAction SilentlyContinue) {
        foreach($name in @('Cache','Code Cache','GPUCache','DawnCache','ShaderCache','GrShaderCache','Media Cache','Service Worker\CacheStorage','Crashpad\reports')) { Clear-CachePath (Join-Path $profile.FullName $name) }
    }
}
Write-Host ('='*72) -ForegroundColor DarkCyan
Write-Host $L[0] -ForegroundColor Cyan
Write-Host ("v1.0.0  |  {0}: {1}" -f $L[1],$started.ToString('yyyy-MM-dd HH:mm:ss')) -ForegroundColor Gray
Write-Host ("{0}: {1} ({2})" -f $L[2],$lang,$culture) -ForegroundColor Gray
Write-Host ('='*72) -ForegroundColor DarkCyan
Write-Host ("[i] {0}" -f $StartMessage) -ForegroundColor Yellow
Write-Host ("[V] {0}" -f $L[20]) -ForegroundColor Green

Show-Stage 1 $S[0]
foreach($path in @((Join-Path $env:windir 'Prefetch'),(Join-Path $env:windir 'SoftwareDistribution\Download'),(Join-Path $env:windir 'Temp'),(Join-Path $env:ProgramData 'Microsoft\Windows\WER\ReportQueue'),(Join-Path $env:ProgramData 'Microsoft\Windows\WER\ReportArchive'),(Join-Path $env:ProgramData 'Microsoft\Windows\WER\Temp'),(Join-Path $env:LOCALAPPDATA 'Microsoft\Windows\INetCache'),(Join-Path $env:ProgramData 'Microsoft\Windows\DeliveryOptimization\Cache'),(Join-Path $env:LOCALAPPDATA 'Microsoft\Windows\DeliveryOptimization\Cache'),(Join-Path $env:LOCALAPPDATA 'CrashDumps'),(Join-Path $env:windir 'Minidump'))) { Clear-CachePath $path }

Show-Stage 2 $S[1]
Clear-CachePath $env:TEMP
Clear-CachePath (Join-Path $env:LOCALAPPDATA 'Temp')

Show-Stage 3 $S[2]
Clear-ChromiumCaches (Join-Path $env:LOCALAPPDATA 'Microsoft\Edge\User Data') 'msedge'
Clear-ChromiumCaches (Join-Path $env:LOCALAPPDATA 'Google\Chrome\User Data') 'chrome'
Clear-ChromiumCaches (Join-Path $env:LOCALAPPDATA 'BraveSoftware\Brave-Browser\User Data') 'brave'
Clear-ChromiumCaches (Join-Path $env:LOCALAPPDATA 'Vivaldi\User Data') 'vivaldi'
if (Get-Process -Name firefox -ErrorAction SilentlyContinue) { $stats.Skipped++; Write-Host $L[12] -ForegroundColor Yellow }
else { foreach($profile in Get-ChildItem -LiteralPath (Join-Path $env:LOCALAPPDATA 'Mozilla\Firefox\Profiles') -Directory -Force -ErrorAction SilentlyContinue) { foreach($name in @('cache2','startupCache','jumpListCache','shader-cache')) { Clear-CachePath (Join-Path $profile.FullName $name) } } }
foreach($operaRoot in @((Join-Path $env:LOCALAPPDATA 'Opera Software'),(Join-Path $env:APPDATA 'Opera Software'))) { foreach($profileName in @('Opera Stable','Opera GX Stable')) { $root=Join-Path $operaRoot $profileName; if(Test-Path -LiteralPath $root){if(Get-Process -Name opera -ErrorAction SilentlyContinue){$stats.Skipped++;Write-Host $L[12] -ForegroundColor Yellow}else{foreach($name in @('Cache','Code Cache','GPUCache','ShaderCache')){Clear-CachePath (Join-Path $root $name)}}} } }

Show-Stage 4 $S[3]
foreach($path in @((Join-Path $env:LOCALAPPDATA 'D3DSCache'),(Join-Path $env:LOCALAPPDATA 'NVIDIA\DXCache'),(Join-Path $env:LOCALAPPDATA 'NVIDIA\GLCache'),(Join-Path $env:LOCALAPPDATA 'AMD\DxCache'),(Join-Path $env:LOCALAPPDATA 'Intel\ShaderCache'),(Join-Path $env:APPDATA 'discord\Cache'),(Join-Path $env:APPDATA 'discord\Code Cache'),(Join-Path $env:APPDATA 'discord\GPUCache'),(Join-Path $env:APPDATA 'Code\Cache'),(Join-Path $env:APPDATA 'Code\CachedData'),(Join-Path $env:APPDATA 'Code\CachedExtensions'),(Join-Path $env:APPDATA 'Code\Code Cache'),(Join-Path $env:APPDATA 'Code\GPUCache'))) { Clear-CachePath $path }

Show-Stage 5 $S[4]
$explorerCache=Join-Path $env:LOCALAPPDATA 'Microsoft\Windows\Explorer'
foreach($pattern in @('thumbcache_*.db','iconcache_*.db')) { foreach($file in Get-ChildItem -LiteralPath $explorerCache -Filter $pattern -File -Force -ErrorAction SilentlyContinue) { try { Remove-Item -LiteralPath $file.FullName -Force -ErrorAction Stop; $stats.Removed++ } catch { $stats.Failed++ } } }

Show-Stage 6 $S[5]
foreach($path in @((Join-Path $env:windir 'Logs\CBS'),(Join-Path $env:windir 'Logs\MoSetup'),(Join-Path $env:windir 'Panther'),(Join-Path $env:windir 'inf'),(Join-Path $env:windir 'Microsoft.NET'))) { Clear-LogFiles $path }

Show-Stage 7 $S[6]
try { Clear-DnsClientCache -ErrorAction Stop; Write-Host $L[13] -ForegroundColor Green } catch { & ipconfig.exe /flushdns | Out-Null; if($LASTEXITCODE -eq 0){Write-Host $L[13] -ForegroundColor Green}else{$stats.Failed++;Write-Host $L[15] -ForegroundColor Yellow} }

Show-Stage 8 $S[7]
Write-Host ("{0}: {1}" -f $L[17],$stats.Folders) -ForegroundColor Gray
Write-Host ("{0}: {1}" -f $L[18],$stats.Removed) -ForegroundColor Green
Write-Host ("{0}: {1}" -f $L[19],$stats.Skipped) -ForegroundColor Yellow
if($stats.Failed -eq 0){Write-Host $L[20] -ForegroundColor Green}else{Write-Host ("{0}: {1}" -f $L[15],$stats.Failed) -ForegroundColor Yellow}
Read-Host $L[21] | Out-Null
