import JapanTaxLaw.TaxFinance

/-!
# GasolineTransferRounding — 地方揮発油譲与税法 art.5（譲与時期ごとの譲与額の計算）bounded L4 モデル

Sources (pinned):
  Law id: 330AC0000000113
  Revision: 330AC0000000113_20190401_431AC0000000002
  Raw snapshot: data/raw/330AC0000000113_20190401_431AC0000000002.law.json
  Article Num 5, flat/normalized leaf text 149 chars, U+3000 count 0.

原文逐語:
  「前三条の規定を適用して計算した金額に千円未満の端数金額があるときは、
    その端数金額を控除した金額をもつて、当該各譲与時期ごとに譲与すべき
    地方揮発油譲与税の額とする。」

Computation（原文逐語から導出）:
  「千円未満の端数金額を控除した金額」= amount − (amount mod 1000)
  = (amount / 1000) × 1000（千円単位への切り捨て）。

Scope: 「前三条の規定を適用して計算した金額」は caller-established。
前三条の具体的算定・配分は NOT MODELLED。
-/

namespace JapanTaxLaw.GasolineTransferRounding

open JapanTaxLaw.TaxFinance

/-- 千円未満の端数を控除した譲与額 = 千円単位へ切り捨て。 -/
def transferAmount (amount : Money) : Money := amount - amount % 1000

example : transferAmount 0 = 0 := by decide
example : transferAmount 999 = 0 := by decide
example : transferAmount 1000 = 1000 := by decide
example : transferAmount 12_345 = 12_000 := by decide
example : transferAmount 12_999 = 12_000 := by decide

theorem transferAmount_le (amount : Money) : transferAmount amount ≤ amount := by
  unfold transferAmount
  exact Nat.sub_le _ _

end JapanTaxLaw.GasolineTransferRounding
