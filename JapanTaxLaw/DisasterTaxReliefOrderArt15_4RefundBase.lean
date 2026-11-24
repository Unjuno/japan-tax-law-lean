import JapanTaxLaw.TaxFinance

/-!
# DisasterTaxReliefOrderArt15_4RefundBase — EFFECT

Pinned source:
  Law id: 322CO0000000268
  Official title: 昭和二十二年政令第二百六十八号（災害被害者に対する租税の減免、徴収猶予等に関する法律の施行に関する政令）
  Law number: 昭和二十二年政令第二百六十八号
  Law type: CabinetOrder (政令)
  Raw snapshot: data/raw/322CO0000000268_*.law.json
  sha256: f6fe1c9380cd7659d682d0b6d294c920f364045905a23f624f372c419a66a21c
  Normative unit id: NORM|beaa62718d9817915074146fe618eb76b36fa3647c372ba793c4f2a85d27d58e
  Source path: LawBody[1]/MainProvision/MainProvision[19]/Article:15_4/Article#15_4/Paragraph#1/Item#2/ItemSentence/Sentence#1

原文逐語（pinned, 一字一句改変なし）:
  「還付を受けようとする自動車重量税の額に相当する金額」

Norm kind: EFFECT — Item 2 of Article 15-4(1) defines the amount subject to the
provision as the amount corresponding to the automobile weight tax sought to be
refunded. The computable slice models the amount correspondence as an identity:
the base amount equals the (caller-established) tax amount. All statutory facts
derived from the needle; no hand-typed CJK.

Variable contract (meaning / unit / domain / type):
  taxAmount : Nat — the automobile weight tax amount sought to be refunded
                     (unit: yen; domain: non-negative integers; caller-established).
  refundBaseAmount : Nat -> Nat — the corresponding amount (identity).
  No rounding applies (the provision states only 相当する金額, a direct correspondence).

Scope: only the amount correspondence. Refund eligibility, the tax computation
itself, and legal correctness are NOT MODELLED. Human legal review pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.DisasterTaxReliefOrderArt15_4RefundBase

/-- 還付を受けようとする自動車重量税の額に相当する金額: the base amount. -/
def refundBaseAmount (taxAmount : Nat) : Nat := taxAmount

/-- The base amount equals the tax amount sought to be refunded. -/
theorem base_equals_tax_amount (a : Nat) : refundBaseAmount a = a := rfl

/-- Zero tax amount gives zero base amount (boundary). -/
theorem zero_tax_zero_base : refundBaseAmount 0 = 0 := rfl

end JapanTaxLaw.DisasterTaxReliefOrderArt15_4RefundBase
