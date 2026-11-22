import JapanTaxLaw.TaxFinance

/-!
# OptionExercise12M — 租税特別措置法 art. 29_2（権利行使価額 年間合計 千二百万円以下）

Sources (pinned):

  Law id: 332AC0000000026
  Revision: 332AC0000000026_20261101_507AC0000000013
  Raw snapshot: data/raw/332AC0000000026_20261101_507AC0000000013.law.json

Pinned 原文: 「当該新株予約権の行使に係る権利行使価額の年間の合計額が、千二百万円を超えないこと。」

Scoped claim: only the 権利行使価額 年間合計 千二百万円以下 threshold; other conditions are caller-established.
-/

namespace JapanTaxLaw.OptionExercise12M

def exerciseCapYen : Nat := 12000000

def withinExerciseTotal (x : Nat) : Bool :=
  decide (x <= exerciseCapYen)

theorem threshold_value : exerciseCapYen = 12000000 := rfl

end JapanTaxLaw.OptionExercise12M
