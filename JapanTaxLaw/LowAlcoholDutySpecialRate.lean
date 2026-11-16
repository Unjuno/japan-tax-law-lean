import JapanTaxLaw.TaxFinance

/-!
# LowAlcoholDutySpecialRate — 租税特別措置法 art. 87の2（低アルコール分の蒸留酒類等に係る酒税の税率の特例）L4 モデル

Sources (pinned):

  Law id: 332AC0000000026
  Revision: 332AC0000000026_20261101_507AC0000000013
  Amendment enforcement date: 2026-11-01
  Raw snapshot sha256: E6E6013BBC0608C6B48DEA01D50AC847C3E5D094F0420223171FFE1B5CF8D5EE
  (data/raw/332AC0000000026_20261101_507AC0000000013.law.json,
   revision CurrentEnforced per data/INVENTORY.json;
   same pin as SpecialGiftRate.lean / DeemedCapitalGainsCost.lean / ResidentialTransferSpecialTax.lean)

Models art. 87の2 — pinned raw bytes 逐語:

  「酒類の製造場から移出され、又は保税地域から引き取られる酒税法第三条第五号に規定する蒸留酒類
   （同号ホに掲げる酒類及び発泡性を有するものを除く。）及び同条第二十一号に規定するリキュール
   （発泡性を有するものを除く。）でアルコール分（同条第一号に規定するアルコール分をいう。以下この条において同じ。）
   が十三度未満のもの（リキュールについては、アルコール分が十二度未満のものに限る。）に係る
   酒税の税率は、同法第二十三条の規定にかかわらず、次の各号に掲げる区分に応じ、
   一キロリットルにつき、当該各号に定める金額とする。
     一アルコール分が十一度未満のもの十万円
     二アルコール分が十一度以上十三度未満のもの十万円にアルコール分が十度を超える一度ごとに一万円を加えた金額"

Computation:

  distilled (alcoholDeg < 13) OR liqueur (alcoholDeg < 12):
    if alcoholDeg < 11 → ¥100,000
    else → ¥100,000 + (alcoholDeg - 10) × ¥10,000

Scope & honest boundaries:

* alcoholDeg is an externally established non-negative integer degree measure
  (caller-established granularity; this model does not verify the 1°/10° boundary decimals)
* art. 87（承認酒類製造者に対する酒税の税率の特例）— 別スライス・別射程
* 酒税法 art. 23 一般税率は射程外

Pinned evidence in doc-comments only; all theorems claim model properties only.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- 蒸留酒類（アルコール分 < 13）とリキュール（アルコール分 < 12）の区別 — 酒税法第3条第五号／第二十一号に規定する種類の別。 -/
inductive LowAlcoholCategory
  | distilled
  | liqueur
  deriving DecidableEq, Repr

/-- art. 87の2 蒸留酒類カラム: 各号の決め ¥100,000/kL、超過の一度ごとに +¥10,000/kL。 -/
def distilledDutyRate (alcoholDeg : Nat) : Option Money :=
  if alcoholDeg < 11 then some 100_000
  else if alcoholDeg < 13 then some (100_000 + (alcoholDeg - 10) * 10_000)
  else none

/-- art. 87の2 リキュールカラム: アルコール分 < 12 に限る。式は同一。 -/
def liqueurDutyRate (alcoholDeg : Nat) : Option Money :=
  if alcoholDeg < 11 then some 100_000
  else if alcoholDeg < 12 then some (100_000 + (alcoholDeg - 10) * 10_000)
  else none

/-- art. 87の2 統合カラム。 -/
def lowAlcoholDutyPerKiloLitre (cat : LowAlcoholCategory) (alcoholDeg : Nat) : Option Money :=
  match cat with
  | LowAlcoholCategory.distilled => distilledDutyRate alcoholDeg
  | LowAlcoholCategory.liqueur => liqueurDutyRate alcoholDeg

theorem lowAlcoholDutyPerKiloLitre_distilled (a : Nat) :
    lowAlcoholDutyPerKiloLitre LowAlcoholCategory.distilled a = distilledDutyRate a := rfl

theorem lowAlcoholDutyPerKiloLitre_liqueur (a : Nat) :
    lowAlcoholDutyPerKiloLitre LowAlcoholCategory.liqueur a = liqueurDutyRate a := rfl

/-- art. 87の2 カテゴリごとの閾値違反の判定。 -/
def lowAlcoholDutyEligible (cat : LowAlcoholCategory) (alcoholDeg : Nat) : Bool :=
  match cat with
  | LowAlcoholCategory.distilled => alcoholDeg < 13
  | LowAlcoholCategory.liqueur => alcoholDeg < 12

theorem lowAlcoholDutyEligible_distilled_lt_13 (alcoholDeg : Nat) :
    lowAlcoholDutyEligible LowAlcoholCategory.distilled alcoholDeg = decide (alcoholDeg < 13) := rfl

theorem lowAlcoholDutyEligible_liqueur_lt_12 (alcoholDeg : Nat) :
    lowAlcoholDutyEligible LowAlcoholCategory.liqueur alcoholDeg = decide (alcoholDeg < 12) := rfl

/-- art. 87の2 のカテゴリ・度数範囲が valid であれば、税額は常に ¥100,000/kL 以上。
    （カテゴリ外（distilled ≥ 13°／liqueur ≥ 12°）は `none` を返すので、
      hypothesis は some x への等式だけで足り、カテゴリ内は各分岐で直接確認する。） -/
theorem lowAlcoholDutyPerKiloLitre_ge_base (cat : LowAlcoholCategory) (alcoholDeg : Nat) :
    ∀ x, lowAlcoholDutyPerKiloLitre cat alcoholDeg = some x → 100_000 ≤ x := by
  cases cat with
  | distilled =>
    rw [lowAlcoholDutyPerKiloLitre_distilled]
    unfold distilledDutyRate
    by_cases h1 : alcoholDeg < 11
    · intro x hh
      rw [ite_eq_left h1] at hh
      injection hh with he
      cases he
      exact Nat.le_refl _
    · rw [ite_eq_right h1]
      by_cases h2 : alcoholDeg < 13
      · intro x hh
        rw [ite_eq_left h2] at hh
        injection hh with he
        cases he
        exact Nat.le_add_right 100_000 _
      · intro x hh
        rw [ite_eq_right h2] at hh
        cases hh
  | liqueur =>
    rw [lowAlcoholDutyPerKiloLitre_liqueur]
    unfold liqueurDutyRate
    by_cases h1 : alcoholDeg < 11
    · intro x hh
      rw [ite_eq_left h1] at hh
      injection hh with he
      cases he
      exact Nat.le_refl _
    · rw [ite_eq_right h1]
      by_cases h2 : alcoholDeg < 12
      · intro x hh
        rw [ite_eq_left h2] at hh
        injection hh with he
        cases he
        exact Nat.le_add_right 100_000 _
      · intro x hh
        rw [ite_eq_right h2] at hh
        cases hh

-- ==== kernel-decided smoke checks ====

example : lowAlcoholDutyPerKiloLitre LowAlcoholCategory.distilled 0 = some 100_000 := by decide
example : lowAlcoholDutyPerKiloLitre LowAlcoholCategory.distilled 10 = some 100_000 := by decide
example : lowAlcoholDutyPerKiloLitre LowAlcoholCategory.distilled 11 = some 110_000 := by decide
example : lowAlcoholDutyPerKiloLitre LowAlcoholCategory.distilled 12 = some 120_000 := by decide
example : lowAlcoholDutyPerKiloLitre LowAlcoholCategory.distilled 13 = none := by decide

example : lowAlcoholDutyPerKiloLitre LowAlcoholCategory.liqueur 0 = some 100_000 := by decide
example : lowAlcoholDutyPerKiloLitre LowAlcoholCategory.liqueur 10 = some 100_000 := by decide
example : lowAlcoholDutyPerKiloLitre LowAlcoholCategory.liqueur 11 = some 110_000 := by decide
example : lowAlcoholDutyPerKiloLitre LowAlcoholCategory.liqueur 12 = none := by decide

-- ω examples for the full-coverage decide
example : lowAlcoholDutyEligible LowAlcoholCategory.distilled 12 = true := by decide
example : lowAlcoholDutyEligible LowAlcoholCategory.distilled 13 = false := by decide
example : lowAlcoholDutyEligible LowAlcoholCategory.liqueur 11 = true := by decide
example : lowAlcoholDutyEligible LowAlcoholCategory.liqueur 12 = false := by decide

end JapanTaxLaw
