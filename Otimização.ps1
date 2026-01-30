# ============================================================
#  OTIMIZAÇÃO MODERNA E SEGURA DE REDE - WINDOWS 10/11
#  Compatível com ambientes corporativos
# ============================================================

Clear-Host
Write-Host "====================================================" -ForegroundColor Cyan
Write-Host " OTIMIZACAO MODERNA E SEGURA DE REDE - WINDOWS 10/11 " -ForegroundColor Cyan
Write-Host "====================================================" -ForegroundColor Cyan

# ------------------------------------------------------------
# 1. Limpeza de estado de rede
# ------------------------------------------------------------

Write-Host "`n[LIMPEZA DE ESTADO DE REDE]" -ForegroundColor Yellow

ipconfig /flushdns
ipconfig /release
ipconfig /renew
arp -d *

# ------------------------------------------------------------
# 2. Reset controlado da pilha de rede
# ------------------------------------------------------------

Write-Host "`n[RESET CONTROLADO DA PILHA DE REDE]" -ForegroundColor Yellow

netsh winsock reset
netsh int ip reset

# ------------------------------------------------------------
# 3. Ajustes TCP modernos (Windows atual)
# ------------------------------------------------------------

Write-Host "`n[AJUSTES TCP MODERNOS]" -ForegroundColor Yellow

netsh int tcp set global autotuninglevel=normal
netsh int tcp set global rss=enabled
netsh int tcp set global rsc=disabled
netsh int tcp set global ecncapability=enabled
netsh int tcp set global timestamps=disabled

# ------------------------------------------------------------
# 4. Ajustes auxiliares de latência
# ------------------------------------------------------------

Write-Host "`n[AJUSTES AUXILIARES DE LATENCIA]" -ForegroundColor Yellow

netsh int tcp set global pacingprofile=off

# ------------------------------------------------------------
# Finalização
# ------------------------------------------------------------

Write-Host "`nScript finalizado com sucesso." -ForegroundColor Green
Write-Host "Reinicie o computador para aplicar todas as alteracoes." -ForegroundColor Green
