# Otimização Moderna e Segura de Rede – Windows 10/11

Este repositório apresenta um script moderno, seguro e compatível com Windows 10/11 para limpeza e ajuste da pilha de rede, com foco em:

-estabilidade\
-baixa latência real\
-compatibilidade com ambientes corporativos (Active Directory / GPO)

O objetivo não é “hackear” a internet, mas restaurar e ajustar corretamente o que o próprio Windows já faz bem, evitando tweaks obsoletos que ainda circulam na internet.

------------------------------------------------------------

## 🎯 Objetivos do Script

Limpar estados problemáticos de rede (DNS, ARP, DHCP)\
Reset controlado da pilha TCP/IP e Winsock\
Ajustes TCP válidos para versões atuais do Windows\
Redução de jitter em aplicações sensíveis (jogos, VoIP, videoconferência)\
Manter compatibilidade com políticas de domínio

------------------------------------------------------------

## 🖥️ Cenários de Uso

Jogos online e aplicações em tempo real\
Trabalho remoto e VPNs corporativas\
Máquinas que passaram por múltiplas VPNs/firewalls\
Ambientes Windows ingressados em domínio

------------------------------------------------------------

## ⚠️ Avisos Importantes

Execute o script como Administrador\
Algumas alterações exigem reinicialização\
Em ambientes com GPO, parte das configurações pode ser revertida após reboot\
Este script não substitui QoS, bom roteador ou link de qualidade

-------------------------------------------------------------

## 📜 Script

| # ============================================================ 
#  OTIMIZAÇÃO MODERNA E SEGURA DE REDE - WINDOWS 10/11
# ============================================================ |
|--------------------------------------------------------------|

Clear-Host
Write-Host "====================================================" -ForegroundColor Cyan
Write-Host " OTIMIZACAO MODERNA E SEGURA DE REDE - WINDOWS 10/11 " -ForegroundColor Cyan
Write-Host "====================================================" -ForegroundColor Cyan

Write-Host "`n[LIMPEZA DE ESTADO DE REDE]" -ForegroundColor Yellow
ipconfig /flushdns
ipconfig /release
ipconfig /renew
arp -d *

Write-Host "`n[RESET CONTROLADO DA PILHA DE REDE]" -ForegroundColor Yellow
netsh winsock reset
netsh int ip reset

Write-Host "`n[AJUSTES TCP MODERNOS]" -ForegroundColor Yellow
netsh int tcp set global autotuninglevel=normal
netsh int tcp set global rss=enabled
netsh int tcp set global rsc=disabled
netsh int tcp set global ecncapability=enabled
netsh int tcp set global timestamps=disabled

Write-Host "`n[AJUSTES AUXILIARES DE LATENCIA]" -ForegroundColor Yellow
netsh int tcp set global pacingprofile=off

Write-Host "`nScript finalizado. Reinicie o computador." -ForegroundColor Green

-------------------------------------------------------------

🔍 Explicação Técnica (Resumo)

AutoTuning normal → janela TCP dinâmica e eficiente

RSS enabled → melhor uso de múltiplos núcleos

RSC disabled → menos jitter em tempo real

ECN enabled → controle moderno de congestionamento

Pacing off → menor latência perceptível

Parâmetros obsoletos ou removidos do Windows moderno não são utilizados.

🧠 Filosofia do Projeto

Menos tweak, mais engenharia.

Este projeto existe para desmistificar scripts milagrosos e demonstrar como a pilha TCP do Windows funciona hoje.
O Windows moderno é inteligente — o papel do profissional é não sabotá-lo.

📌 Licença

Uso livre para estudo e aplicação prática.
Teste sempre antes de usar em produção.
