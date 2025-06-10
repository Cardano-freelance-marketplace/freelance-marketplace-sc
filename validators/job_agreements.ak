use cardano/address.{Address, Credential, VerificationKey}
use cardano/assets
use cardano/certificate.{Certificate}
use cardano/governance.{ProposalProcedure, Voter}
use cardano/transaction.{OutputReference, Transaction}
use aiken/collection/list

pub type Milestone {
  reward: Int,
  approved_by_freelancer: Bool,
  approved_by_client: Bool,
  paid: Bool,
}

pub type JobAgreement {
  freelancer: ByteArray,
  client: ByteArray,
  milestone: Milestone,
}

pub type Action {
  ApproveMilestone
  RedeemMilestone
  Refund
}
pub type Redeemer {
  signer: ByteArray,
  action: Action,
  is_client: Bool,
  is_freelancer: Bool
}


validator job_agreements {
  spend(
    d: Option<JobAgreement>,
    redeemer: Redeemer,
    utxo: OutputReference,
    tx: Transaction,
  )-> Bool {
    expect Some(datum) = d
    
    when redeemer.action is {
      ApproveMilestone -> True
      RedeemMilestone -> {
        expect Some(payment) = 
        list.find(
          tx.outputs,
          fn(output) {
            output.address.payment_credential == VerificationKey(datum.freelancer)
          }
        )
        let payment_valid = assets.lovelace_of(payment.value) == datum.milestone.reward
        let is_valid_redeemer = list.has(tx.extra_signatories, datum.client) || list.has(tx.extra_signatories, datum.freelancer)
        let is_milestone_approved = datum.milestone.approved_by_client == True && datum.milestone.approved_by_freelancer == True
        is_valid_redeemer && is_milestone_approved && payment_valid
      }
      Refund -> {
        expect Some(refund) = 
        list.find(
          tx.outputs,
          fn(output) {
            output.address.payment_credential == VerificationKey(datum.client)
          }
        )
        let is_refund_valid = assets.lovelace_of(refund.value) == datum.milestone.reward
        // Must be signed by either client or freelancer and the output must go to the client and match the reward amount 
        (list.has(tx.extra_signatories, datum.client) 
        || list.has(tx.extra_signatories, datum.freelancer))
        && is_refund_valid      
      }
    }
  }
}
