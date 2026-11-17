import JapanTaxLaw.TaxFinance

/-!
# InheritanceAnnuityValuation — 相続税法 art. 25（定期金給付契約の権利の評価）L4 モデル

Source (pinned):

  Law id: 325AC0000000073
  Revision: 325AC0000000073_20260401_506AC0000000008
  Amendment enforcement date: 2026-04-01
  Raw snapshot: data/raw/325AC0000000073_20260401_506AC0000000008.law.json

Models the computable core of art. 25 — pinned bytes 逐語:

  「定期金給付契約（生命保険契約を除く。）で当該契約に関する権利を取得した時において
    定期金給付事由が発生していないものに関する権利の価額は、次の各号に掲げる場合の
    区分に応じ、当該各号に定める金額による。
    一 …次に掲げる場合の区分に応じ、それぞれ次に定める金額に、百分の九十を乗じて
       得た金額
       イ …予定利率の複利による計算をして得た元利合計額
       ロ …複利年金終価率を乗じて得た金額
    二 前号に掲げる場合以外の場合 …解約返戻金の金額」

Computation (Money = Nat):

  annuityRightValue noSurrenderClause base =
    if noSurrenderClause then base * 90 / 100 else base   -- 第1号は90%、第2号は解約返戻金そのまま

Scope & honest boundaries:

* 第1号の基礎額（複利による元利合計額／複利年金終価率を乘じた金額）は
  **財務省令で定める**複利計算に依存 — caller-established Money。
* 第2号の解約返戻金も caller-established Money。
* 「解約返戻金を支払う旨の定めがない場合」該当性は caller-established Bool。
* 生命保険契約の除外、定期金給付事由の発生有無は caller-established。
* 丸めは applyFloor（切り捨て）。
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- art. 25 第1号 — 百分の九十（90/100）。 -/
def annuityNinetyPercentRate : TaxRate := ⟨90, 100, by decide⟩

/-- art. 25 — 定期金給付契約の権利の価額。 -/
def annuityRightValue (noSurrenderClause : Bool) (baseOrSurrenderValue : Money) : Money :=
  if noSurrenderClause then annuityNinetyPercentRate.applyFloor baseOrSurrenderValue
  else baseOrSurrenderValue

-- ==== verified facts ====

theorem annuityNinetyPercentRate_eq : annuityNinetyPercentRate = ⟨90, 100, by decide⟩ := rfl

theorem annuityRightValue_no_surrender_clause (base : Money) :
    annuityRightValue true base = base * 90 / 100 := rfl

theorem annuityRightValue_with_surrender_clause (base : Money) :
    annuityRightValue false base = base := rfl

theorem annuityRightValue_le_base (b : Bool) (base : Money) :
    annuityRightValue b base ≤ base := by
  cases b with
  | false => exact Nat.le_refl _
  | true =>
    unfold annuityRightValue annuityNinetyPercentRate TaxRate.applyFloor
    simp
    apply Nat.div_le_of_le_mul
    rw [Nat.mul_comm 100 base]
    exact Nat.mul_le_mul_left base (by decide : 90 ≤ 100)

-- ==== kernel-decided smoke checks ====

example : annuityNinetyPercentRate = ⟨90, 100, by decide⟩ := by rfl
example : annuityRightValue true 1_000_000 = 900_000 := by decide
example : annuityRightValue false 1_000_000 = 1_000_000 := by decide
example : annuityRightValue true 1 = 0 := by decide  -- 切り捨て
example : annuityRightValue true 0 = 0 := by decide

end JapanTaxLaw
