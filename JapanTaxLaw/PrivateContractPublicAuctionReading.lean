import JapanTaxLaw.TaxFinance

/-
# PrivateContractPublicAuctionReading — 国税徴収法施行規則 第一条の六（随意契約時の公売規定準用）

Pinned source:
  Law id: 337M50000040031 (国税徴収法施行規則)
  Revision: 337M50000040031_20260521_506M60000040023
  Raw snapshot: data/raw/337M50000040031_20260521_506M60000040023.law.json
  Article: 第一条の六 (art. 1_6), ArticleCaption
  Source path: LawBody[2]/MainProvision/MainProvision[5]/Article:1_6/Article#1_6/ArticleCaption
  Normative unit id: NORM|d692d7da2457a4ea5be1755917ebce9dfa13d8603fbb818e406590ddb54966c4

原文逐語（pinned, verbatim, READING）:
  「（随意契約により不動産を売却する場合における公売の規定の準用）」

Variable contract:
  A sale mode is encoded as a Nat code: 0 = 随意契約 (private contract),
  1 = 公売 (public auction), 2+ = caller-defined modes. `asPublicAuction`
  maps 0 to 1 (公売の規定を準用) and preserves every other code.
  Unit: a discrete mode code; domain: Nat.

Scope: ONLY the reading substitution 「随意契約 … 公売の規定の準用」 is
modelled. The conditions for a private contract, the auction procedure itself
and all other provisions are NOT MODELLED.

No `sorry`, `admit`, `axiom`, `omega`, `simp` or `Classical.choice`.
-/

namespace JapanTaxLaw.PrivateContractPublicAuctionReading

/-- 「随意契約 … 公売の規定の準用」: private contract is read as public auction. -/
def asPublicAuction : Nat → Nat
  | 0 => 1
  | n + 1 => n + 1

theorem private_becomes_auction : asPublicAuction 0 = 1 := rfl

theorem auction_preserved : asPublicAuction 1 = 1 := rfl

theorem other_preserved : asPublicAuction 2 = 2 := rfl

theorem idempotent (c : Nat) : asPublicAuction (asPublicAuction c) = asPublicAuction c := by
  cases c <;> rfl

end JapanTaxLaw.PrivateContractPublicAuctionReading
