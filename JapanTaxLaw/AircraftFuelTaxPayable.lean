import JapanTaxLaw.TaxFinance

/-!
# AircraftFuelTaxPayable — 航空機燃料税法 art.14(1) 第四号（納付すべき税額）

Sources (pinned):
  Law id: 347AC0000000007
  Revision: 347AC0000000007_20250601_504AC0000000068
  Raw snapshot: data/raw/347AC0000000007_20250601_504AC0000000068.law.json
  Provision: MainProvision / Article 14 / Paragraph 1 / Item 4

原文逐語:
  「第二号に掲げる航空機燃料税額から前号に掲げる航空機燃料税額を控除した
   金額に相当する航空機燃料税額（以下「納付すべき税額」という。）」

Computation: payable = secondItemTax - firstItemTax, saturating at zero.
Unit: Money (円), domain: Nat. Scope: the subtraction slice only; the
determination of each item's tax amount, returns and procedural rules are
NOT MODELLED. No legal review is provided.
-/

namespace JapanTaxLaw.AircraftFuelTaxPayable

open JapanTaxLaw.TaxFinance

/-- 納付すべき税額 = 第二号税額 − 前号税額（下限 0）。 -/
def payable (secondItemTax firstItemTax : Money) : Money :=
  if firstItemTax <= secondItemTax then secondItemTax - firstItemTax else 0

example : payable 0 0 = 0 := by decide
example : payable 100 40 = 60 := by decide
example : payable 100 100 = 0 := by decide
example : payable 100 140 = 0 := by decide

end JapanTaxLaw.AircraftFuelTaxPayable
