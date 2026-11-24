import JapanTaxLaw.TaxFinance

/-!
# InheritanceTaxArt19SevenYearGiftCondition — CONDITION

Pinned source:
  Law id: 325AC0000000073
  Official title: 相続税法
  Law number: 昭和二十五年法律第七十三号
  Law type: Act (法律)
  Raw snapshot: data/raw/325AC0000000073_*.law.json
  sha256: c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7
  Normative unit id: NORM|5516848edbb7f5724c02b0141483fea8ef899ac593f2f53c9f5391cf56330214
  Source path: LawBody[3]/MainProvision/MainProvision[1]/Article:19/Article#19/ArticleCaption

原文逐語（pinned, 一字一句改変なし）:
  「（相続開始前七年以内に贈与があつた場合の相続税額）」

Norm kind: CONDITION — the ArticleCaption labels the condition: a 贈与 made
within 七年以内 before 相続開始前 (inheritance commencement) triggers the 相続税額
(gift add-back) rule. The computable slice models the applicability condition:
gift occurred AND years-before-inheritance <= 7 (七年以内 is inclusive). All
statutory terms below are reproduced programmatically from the verbatim needle;
the canonical quote is byte-verbatim.

Variable contract (meaning / domain / type):
  yearsBefore : Nat — years before 相続開始前 (caller-established; unit: years).
  giftOccurred : Bool — whether a 贈与 was made in the window.
  applies := giftOccurred && yearsBefore <= 7.
  No tax amount computation is modeled (that is GiftAddBack.lean, a separate module).

Scope: only the caption-level applicability condition. The 相続税額 amount computation,
the definition of add-back property, and legal correctness are NOT MODELLED.
Human legal review pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.InheritanceTaxArt19SevenYearGiftCondition

/-- 相続開始前七年以内に贈与があつた場合: caption-level applicability. -/
def applies (giftOccurred : Bool) (yearsBefore : Nat) : Bool :=
  giftOccurred && yearsBefore <= 7

/-- A gift within seven years applies. -/
theorem gift_at_seven_years : applies true 7 = true := rfl

/-- A gift at year zero applies. -/
theorem gift_at_zero_years : applies true 0 = true := rfl

/-- A gift beyond seven years does not apply. -/
theorem gift_beyond_seven : applies true 8 = false := by decide

/-- No gift does not apply. -/
theorem no_gift : applies false 7 = false := rfl

end JapanTaxLaw.InheritanceTaxArt19SevenYearGiftCondition
