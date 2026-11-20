import JapanTaxLaw.TaxFinance

/-!
# ForestGrantRounding — 森林環境譲与税法 art.31（譲与額の端数処理）bounded L4 モデル

Sources (pinned):
  Law id: 431AC0000000003
  Revision: 431AC0000000003_20260401_508AC0000000002
  Raw snapshot: data/raw/431AC0000000003_20260401_508AC0000000002.law.json
  Article Num 31, flat/normalized leaf text 151 chars, U+3000 count 0.

原文逐語:
  「（各譲与時期の譲与額の計算）第三十一条…第二十七条から前条までの規定を適用して
   計算した金額に千円未満の端数金額があるときは、その端数金額を控除した金額を
   もって、当該譲与時期に譲与すべき森林環境譲与税の額とする。」

Computation（原文逐語から導出）:
  unitGrain = 1_000（千円）
  roundDownThousand(amount) = amount - (amount % 1000)
    千円未満の端数（0〜999円）を控除し、千円単位に切り捨てる。

Scope: 本スライスは端数処理（千円未満を控除）のみを扱う。
第二十七条〜第三十条の「計算した金額」を導出する配分・基準・算定手続は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.ForestGrantRounding

open JapanTaxLaw.TaxFinance

/-- 端数処理の粒度 = 千円。 -/
def grainYen : Money := 1_000

/-- 千円未満の端数を控除した金額（千円単位への切捨て）。 -/
def roundDownThousand (amount : Money) : Money :=
  amount - amount % grainYen

example : grainYen = 1_000 := by decide
example : roundDownThousand 0 = 0 := by decide
example : roundDownThousand 999 = 0 := by decide
example : roundDownThousand 1_000 = 1_000 := by decide
example : roundDownThousand 1_499 = 1_000 := by decide
example : roundDownThousand 1_500 = 1_000 := by decide
example : roundDownThousand 12_345 = 12_000 := by decide
example : roundDownThousand 100_000 = 100_000 := by decide

end JapanTaxLaw.ForestGrantRounding
