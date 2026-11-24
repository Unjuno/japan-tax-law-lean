import JapanTaxLaw.TaxFinance

/-!
# GiftTaxSettlementBasicDeduction600k — 相続税法 art.21の11の2 贈与税基礎控除 60万円（bounded L4 モデル）

Sources (pinned): law 325AC0000000073, revision 325AC0000000073_20260401_506AC0000000008,
raw data/raw/325AC0000000073_20260401_506AC0000000008.law.json.
原文逐語: 「…その年分の贈与税については、贈与税の課税価格から六十万円を控除する。」
Computation（控除のみ、Nat の下限切り捨て）:
  afterDeduction(base) = if base > 600000 then base - 600000 else 0
Scope / NOT MODELLED: 相続時精算課税の適用要件・特定贈与者の定義・贈与税額の算定は NOT MODELLED。
本モデルは 60万円控除のみを扱い、法的レビューを提供しない。
-/

namespace JapanTaxLaw.GiftTaxSettlementBasicDeduction600k

open JapanTaxLaw.TaxFinance

def basicDeduction : Money := 600000

def afterDeduction (base : Money) : Money :=
  if base > basicDeduction then base - basicDeduction else 0

example : afterDeduction 0 = 0 := by decide
example : afterDeduction 600000 = 0 := by decide
example : afterDeduction 600001 = 1 := by decide

end JapanTaxLaw.GiftTaxSettlementBasicDeduction600k
