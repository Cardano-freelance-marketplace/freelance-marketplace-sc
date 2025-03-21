# Decentralized Freelance Marketplace

## Project Overview

A decentralized freelance marketplace built on the Cardano blockchain, enabling secure and transparent job agreements through smart contracts. Freelancers can create profiles, and clients can hire them, with payments locked in a smart contract and released based on milestone approvals. Authentication is handled via Cardano wallet integration, ensuring trustless transactions without intermediaries.

## **Table of Contents**
- [Tech Stack](#tech-stack)
- [Features](#key-features)
- [API Documentation](#api-documentation)
- [Useful Links](#useful-links)
- [License](#license)

## **Tech Stack**
- **Frontend:** React + TypeScript
- **Backend:** FastAPI (using Poetry for dependency management)
- **On-Chain Logic:** Aiken (for smart contracts)
- **Wallet Integration:** MeshJS (Eternl, Nami, Flint, Gero, Lace)
- **Blockchain APIs:** Cardano-Node & Ogmios
- **Database:** PostgreSQL & MongoDB

## Key Features

### User Profiles & Listings

- Freelancers create profiles with skills, experience, and pricing.
- Clients browse profiles and initiate contact.

### Project Agreements & Milestone-based Payments

- Clients and freelancers agree on project guidelines.
- They define **milestone-based payments**, which act as benchmarks for progress.
- Payments are locked in a smart contract and released when both parties confirm milestone completion.
- Upon project completion, the remaining balance is released to the freelancer.

### Dispute Resolution

- If disagreements occur, funds remain locked until an arbitrator intervenes.
- Dispute resolution can be handled via a decentralized governance mechanism.

### Authentication

- Users authenticate using a MeshJS Cardano wallet connector.
- It has compatibility with :
  - **Eternl** ([eternl.io](https://eternl.io))
  - **Nami** ([namiwallet.io](https://namiwallet.io))
  - **Flint** ([flintwallet.io](https://flintwallet.io))
  - **Gero** ([gerowallet.io](https://gerowallet.io))
  - **Lace** ([lace.io](https://www.lace.io))

### Smart Contract Functionality (Using Aiken)

- **Locking Funds:** When a project starts, the agreed amount is locked in a smart contract.
- **Releasing Payments:** Payments are released upon mutual approval at each milestone.
- **Final Payout:** Upon project completion, the final amount is transferred to the freelancer.
- **Dispute Handling:** If no agreement is reached, arbitration can be triggered.

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
