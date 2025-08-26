# Opella Terraform Infrastructure

This repository provisions Azure infrastructure using **modular Terraform** with **GitHub Actions CI/CD**.  
You can deploy individual resources (Resource Group, Virtual Network, Network Security Group, Virtual Machine) independently.

---

## 📂 Project Structure

```
opella/
├── .github/
│   └── workflows/
│       └── terraform.yml        # GitHub Actions workflow
├── modules/
│   ├── resource_group/          # Module for RG
│   ├── vnet/                    # Module for Virtual Network
│   ├── nsg/                     # Module for Network Security Group
│   └── vm/                      # Module for Virtual Machine
├── envs/
│   ├── dev/                     # Dev environment configs
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── terraform.tfvars
│   └── prod/                    # (Optional) Prod environment
├── backend.tf                   # Remote state backend
├── providers.tf                 # Provider setup
├── variables.tf                 # Global variables
├── terraform.tfvars.example     # Example variables file
└── README.md
```

---

## 🚀 Usage

### 1. Prerequisites
- Terraform `>=1.5`
- Azure subscription
- GitHub repository secrets:
  - `AZURE_CREDENTIALS` (Service Principal JSON with Contributor access)

### 2. Initialize Terraform
```bash
cd envs/dev
terraform init
```

### 3. Plan & Apply Specific Components

Each component is a module. You can **target** specific ones:

- Resource Group  
  ```bash
  terraform plan -target=module.rg
  terraform apply -target=module.rg
  ```
- Virtual Network  
  ```bash
  terraform plan -target=module.vnet
  terraform apply -target=module.vnet
  ```
- Network Security Group  
  ```bash
  terraform plan -target=module.nsg
  terraform apply -target=module.nsg
  ```
- Virtual Machine  
  ```bash
  terraform plan -target=module.vm
  terraform apply -target=module.vm
  ```

---

## ⚙️ GitHub Actions Workflow

The workflow is defined in `.github/workflows/terraform.yml`.

It supports **manual runs**:

1. Go to **Actions → Run Workflow**.
2. Select which component to deploy:
   - `rg`, `vnet`, `nsg`, or `vm`.
3. Workflow runs:
   - `terraform init`
   - `terraform plan -target=module.<component>`
   - `terraform apply`

---

## 🔑 Secrets & Remote State

- Store Azure credentials in GitHub as `AZURE_CREDENTIALS`.
- Configure backend in `backend.tf` (e.g., Azure Storage Account for remote state).

---

## 📌 Notes

- Edit `envs/dev/terraform.tfvars` to override variable values.
- Add `envs/prod/` for production with its own variables.
- Use `.gitignore` to avoid committing `.terraform/`, `*.tfstate`, and secrets.
