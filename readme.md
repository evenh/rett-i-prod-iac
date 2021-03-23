# IaC med Terraform

## Beskrivelse
Dette repoet inneholder enkel eksempelkode for å sette opp [petclinic](https://github.com/spring-projects/spring-petclinic) på Azure Container Instances, backet av en managed MySQL-database. DNS blir kontrollert av DigitalOcean. 

## Forutsetninger

Last ned Terraform (0.14.8), suppler så credentials i en egen fil, f.eks. `rett-i-prod.auto.tfvars`:

```hcl
subscription_id = "min-azure-subscription"
tenant_id       = "min-ad-tenant"
location        = "westeurope" # norwayeast tilbyr ikke alt enda

do_domain = "domene-som-du-manager-pa-digitalocean.com"
do_token  = "personlig-api-token"
```

Kjør så `terraform init` for å laste ned providere, og `terraform apply` for å spinne opp ressursene.

## Bakgrunn

I [Bekk](https://bekk.no) har vi mange faggrupper, herunder faggruppen Rett i prod 🚀. I møtet 2021-03-24 ble [denne presentasjonen](./doc/slides.pdf) holdt, og koden i dette repoet ble brukt for å introdusere Terraform.
