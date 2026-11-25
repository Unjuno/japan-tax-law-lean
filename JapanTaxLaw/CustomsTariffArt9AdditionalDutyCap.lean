import JapanTaxLaw.TaxFinance

/-!
# CustomsTariffArt9AdditionalDutyCap — CONDITION (+ additive relation)

Pinned source:
  Law id: 143AC0000000054
  Official title: 関税定率法
  Law number: 明治四十三年法律第五十四号
  Law type: Act (法律)
  Raw snapshot: data/raw/143AC0000000054_*.law.json
  sha256: 924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c
  Normative unit id: NORM|7cfb458918c95cb9c89dfc9e3f230612412a98de1f8426918de7269131260be4
  Source path: LawBody[1]/MainProvision/MainProvision[19]/Article:9/Article#9/Paragraph#4/Item#1/ItemSentence/Sentence#1

原文逐語（pinned, 一字一句改変なし）:
  「当該貨物につき、別表の税率による関税のほか、当該輸入される貨物の課税価格と同額以下の関税を課すること。」

Norm kind: CONDITION (with EFFECT aspect) — the additional customs duty imposed
on the goods is not to exceed the taxable value of the imported goods, and is
imposed in addition to the table-rate duty. The computable slice models exactly
those two structural relations over natural-number amounts. The statutory quote
above is byte-verbatim from the pinned source; English prose here is descriptive.

Variable contract (meaning / domain / type):
  taxableValue : Nat — taxable value of the imported goods (currency amount).
  additionalDuty : Nat — additional duty imposed (same currency amount unit).
  tableDuty : Nat — duty under the table rate (same currency amount unit).
  withinCap : Nat -> Nat -> Prop — additionalDuty <= taxableValue.
  totalDuty : Nat -> Nat -> Nat — tableDuty + additionalDuty.
  Both amounts are natural numbers; no negative amounts, no rounding modelled.
  The actual rate table, valuation rules, and legal correctness are NOT MODELLED.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CustomsTariffArt9AdditionalDutyCap

/-- The additional duty is within the cap: not greater than the taxable value. -/
def withinCap (additionalDuty taxableValue : Nat) : Prop :=
  additionalDuty <= taxableValue

/-- Total duty is the table-rate duty plus the additional duty. -/
def totalDuty (tableDuty additionalDuty : Nat) : Nat :=
  tableDuty + additionalDuty

/-- Equality with the taxable value is within the cap. -/
theorem cap_equal_allowed (v : Nat) : withinCap v v := Nat.le_refl v

/-- A duty strictly greater than the taxable value is outside the cap. -/
theorem cap_exceeded_rejected (d v : Nat) (h : v < d) : ¬ withinCap d v :=
  Nat.not_le_of_gt h

/-- Zero additional duty is within the cap. -/
theorem zero_duty_allowed (v : Nat) : withinCap 0 v := Nat.zero_le v

/-- The table-rate duty is bounded by the total duty. -/
theorem total_at_least_table (t a : Nat) : t <= totalDuty t a := by
  unfold totalDuty
  exact Nat.le_add_right t a

/-- The additional duty is bounded by the total duty. -/
theorem total_at_least_additional (t a : Nat) : a <= totalDuty t a := by
  unfold totalDuty
  exact Nat.le_add_left a t

end JapanTaxLaw.CustomsTariffArt9AdditionalDutyCap
