# Decentralized Freelance Marketplace

## Project Overview

A decentralized freelance marketplace built on the Cardano blockchain, enabling secure and transparent job agreements through smart contracts. Freelancers can create profiles, and clients can hire them, with payments locked in a smart contract and released based on milestone approvals. Authentication is handled via Cardano wallet integration, ensuring trustless transactions without intermediaries.

## **Table of Contents**
- [Tech Stack](#tech-stack)
- [Features](#key-features)
- [Setup Guide](#setup-guide)
  - [Prerequisites](#prerequisites)
  - [Backend (FastAPI with Poetry)](#backend-fastapi-with-poetry)
  - [Frontend (React with TypeScript)](#frontend-react-with-typescript)
  - [Smart Contracts (Aiken)](#smart-contracts-aiken)
- [API Documentation](#api-documentation)
- [Useful Links](#useful-links)
- [License](#license)

## **Tech Stack**
- **Frontend:** React + TypeScript
- **Backend:** FastAPI (using Poetry for dependency management)
- **On-Chain Logic:** Aiken (for smart contracts)
- **Wallet Integration:** MeshJS (Eternl, Nami, Flint, Gero, Lace)
- **Blockchain APIs:** Blockfrost / Koios or Own Node - TBD
- **Database:** Decentralized BD or centralized BD - TBD

## Key Features

### 1. User Profiles & Listings

- Freelancers create profiles with skills, experience, and pricing.
- Clients browse profiles and initiate contact.

### 2. Project Agreements & Milestone-based Payments

- Clients and freelancers agree on project guidelines.
- They define **milestone-based payments**, which act as benchmarks for progress.
- Payments are locked in a smart contract and released when both parties confirm milestone completion.
- Upon project completion, the remaining balance is released to the freelancer.

### 3. Dispute Resolution

- If disagreements occur, funds remain locked until an arbitrator intervenes.
- Dispute resolution can be handled via a decentralized governance mechanism.

### 4. Authentication

- Users authenticate using a MeshJS Cardano wallet connector.
- It has compatibility with :
  - **Eternl** ([eternl.io](https://eternl.io))
  - **Nami** ([namiwallet.io](https://namiwallet.io))
  - **Flint** ([flintwallet.io](https://flintwallet.io))
  - **Gero** ([gerowallet.io](https://gerowallet.io))
  - **Lace** ([lace.io](https://www.lace.io))

### 5. Smart Contract Functionality (Using Aiken)

- **Locking Funds:** When a project starts, the agreed amount is locked in a smart contract.
- **Releasing Payments:** Payments are released upon mutual approval at each milestone.
- **Final Payout:** Upon project completion, the final amount is transferred to the freelancer.
- **Dispute Handling:** If no agreement is reached, arbitration can be triggered.

### 6. Deployment & Infrastructure

- **Frontend Hosting:** TBD
- **Backend Hosting:** TBD
- **Smart Contracts:** Deployed on Cardano Testnet → Mainnet

## **Setup Guide**

### **Prerequisites**
Ensure you have the following installed:

```sh
# Install Node.js & npm
sudo apt update && sudo apt install nodejs npm -y

# Install Python 3 & Poetry
sudo apt install python3 python3-pip -y
curl -sSL https://install.python-poetry.org | python3 -

# Install Git
sudo apt install git -y
```

### **Backend (FastAPI with Poetry)**

```sh
# Clone the repository
git clone https://github.com/yourusername/cardano-marketplace.git
cd cardano-marketplace/backend

# Install dependencies
poetry install

# Run the FastAPI server
poetry run uvicorn app.main:app --reload --host 0.0.0.0 --port 8000
```

### **Frontend (React with TypeScript)**

```sh
cd ../frontend

# Install dependencies
npm install

# Start the development server
npm run dev
```

### **Smart Contracts (Aiken)**

```sh
# Install Aiken
curl --proto '=https' --tlsv1.2 -LsSf https://install.aiken-lang.org | sh

# Install aiken to PATH by following terminal instructions

# Verify installation
aiken --version

# Initialize the Aiken project
cd ../smart-contracts
aiken new marketplace-contract
cd marketplace-contract

# Build the contract
aiken build

# Run tests
aiken check
```
### **Cardano Node**

Clone Ogmios repository
```sh
git clone git@github.com:CardanoSolutions/ogmios.git
```

Get the cardano node file configs from : 

https://developers.cardano.org/docs/get-started/cardano-node/running-cardano

Into /server/config/network/preview/cardano-node

```sh
NETWORK=preview docker compose up -d
```

---

## **API Documentation**
Once the backend is running, access the **FastAPI interactive docs** at:
- Swagger UI: [http://127.0.0.1:8000/docs](http://127.0.0.1:8000/docs)
- ReDoc: [http://127.0.0.1:8000/redoc](http://127.0.0.1:8000/redoc)

---

## **Useful Links**
- **Aiken Documentation:** [https://aiken-lang.org](https://aiken-lang.org)
- **FastAPI Documentation:** [https://fastapi.tiangolo.com](https://fastapi.tiangolo.com)
- **React Documentation:** [https://react.dev](https://react.dev)
- **MeshJS Wallet Integration:** [https://meshjs.dev](https://meshjs.dev)
- **Blockfrost API:** [https://blockfrost.io](https://blockfrost.io)

---

## **License**
This project is licensed under the MIT License.
