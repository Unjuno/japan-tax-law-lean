import JapanTaxLaw.TaxFinance

/-
# LocalTax18_2TwoYearSuspension — pinned clause 「地方税の徴収権で、偽りその他不正の行為によりその全部若しくは一部の税額を免れ、又はその全部若しくは一部の税額の還付を受けた地方税（当該地方税に係る延滞金及び加算金を含む。以下この項において同じ。）に係るものの時効は、当該地方税の前条第一項に規定する法定納期限の翌日から起算して二年間は、進行しない。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 18_2, paragraph 3.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|c6c6ebfe3b65f96cd41b54b0d44d36c4e527eed0c0098cad3c4793389b8bc5fe.
原文逐語: 「地方税の徴収権で、偽りその他不正の行為によりその全部若しくは一部の税額を免れ、又はその全部若しくは一部の税額の還付を受けた地方税（当該地方税に係る延滞金及び加算金を含む。以下この項において同じ。）に係るものの時効は、当該地方税の前条第一項に規定する法定納期限の翌日から起算して二年間は、進行しない。」
Scope: ONLY the 不正行為による地方税に係る時効の二年間の進行停止の INCLUSIVE 上限（years <= 2）. 延滞金・加算金の取扱い・法定納期限の算定・時効中断・他項他条項は NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax18_2TwoYearSuspension

open JapanTaxLaw.TaxFinance

/-- Statutory threshold literal (2) with the inclusive/strict boundary fixed by the clause. -/
def inScope (years : Nat) : Prop := years <= 2

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (years : Nat) : Bool := decide (years <= 2)

end JapanTaxLaw.LocalTax18_2TwoYearSuspension
