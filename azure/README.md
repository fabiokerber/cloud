# Azure

## Create Azure Budget
(It's possible to create a Budge only to a Resource)
This is important because there is no risk of spend more than expected with cloud! <br>
- Azure subscription 1 | Budgets
- Add a new budget monthly with a limit of 20 and send an email to alert you if the amount is exceeded

## Core Services
- Virtual Machines
- Virtual Networking (Connectivity, Security, Delivery, Monitoring)
- Storage (Blobs, queues, tables, files - hot, cool and archive tiers)
- Microservices (Servive Fabric, Functions, Logic Apps, API's, AKS)
<br>
<br>

## Networking - Connectivity
- Virtual Network (VNet)
- Virtual WAN
- ExpressRoute
- VPN Gateway
- Azure DNS
- Peering (connects services from different regions)
- Bastion (more secure than common RDP)

## Networking - Security
- Network Security Groups (NSG)
- Azure Private Link
- DDoS Protection
- Azure Firewall
- Web Application Firewall (WAF)
- Virtual Network Endpoints

## Networking - Delivery
- CDN
- Azure Front Door
- Traffic Manager
- Application Gateway
- Load Balancer

## Networking - Monitoring (Mostly Debug tools)
- Network Watcher
- ExpressRoute Monitor
- Azure Monitor
- VNet Terminal Access Point (TAP)

```
az login
az logout
az account list -o table '

az account show
az account set --subscription "Azure subscription 1" (verificar se está conectado na Subscription correta)
```