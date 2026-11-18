import JapanTaxLaw.InheritanceAnnuityMaxima

/-!
# InheritanceAnnuityMaxima spec — 相続税法 art. 24(1) 一号・二号・三号 の独立定式

Source (pinned): Law id 325AC0000000073 /
  revision 325AC0000000073_20260401_506AC0000000008 / enforcement 2026-04-01.

本モジュールは実装 (`InheritanceAnnuityMaxima.lean`) とは独立した定式を与える:

  * `specMax3` — 「いずれか多い金額」を比較の連鎖（`if`）で選ぶ独立表現。
  * `specTermAnnuityValue` / `specPerpetualAnnuityValue` / `specLifetimeAnnuityValue`
    — 各号の max 構造を `specMax3` で書き直したもの。
  * `specSelectLumpSum` / `specLumpSumAmount` — 一時金選択分岐の独立定式。
  * `agree*` — 有限グリッド上で impl ≡ spec を `==` 比較し、カーネルが `decide` する。

### Verification approach（誠実な限界）

各 `agree*` は有限サンプル上の一致確認であり、全 `Money` (= `Nat`) に対する
普遍的同値でも、法的意味の等価証明でもない。複利現価率・予定利率・余命年数は
本スライスで NOT MODELLED（各入力は caller-established Money）。
-/ 

namespace JapanTaxLaw.InheritanceAnnuityMaxima

open JapanTaxLaw.TaxFinance

/-- 独立定式（3 値の最大）: 比較の連鎖で最大値を選ぶ。実装の入れ子 max とは別定義。 -/
def specMax3 (a b c : Nat) : Nat :=
  if b ≤ a then
    if c ≤ a then a else c
  else
    if c ≤ b then b else c

/-- spec 側の一号 有期定期金。 -/
def specTermAnnuityValue (surrenderValue lumpSum annuityPresentValue : Money) : Money :=
  specMax3 surrenderValue lumpSum annuityPresentValue

/-- spec 側の二号 無期定期金。 -/
def specPerpetualAnnuityValue (surrenderValue lumpSum dividedByRate : Money) : Money :=
  specMax3 surrenderValue lumpSum dividedByRate

/-- spec 側の三号 終身定期金（区分名のみ異なる。max 構造は一号と同一）。 -/
def specLifetimeAnnuityValue (surrenderValue lumpSum annuityPresentValue : Money) : Money :=
  specMax3 surrenderValue lumpSum annuityPresentValue

/-- spec 側の一時金選択（Bool）。 -/
def specSelectLumpSum (canReceive : Bool) (amount : Money) : Money :=
  if canReceive then amount else 0

/-- spec 側の一時金選択（Option）。 -/
def specLumpSumAmount (lumpSum : Option Money) : Money :=
  match lumpSum with
  | none => 0
  | some v => v

-- ==== spec 自身の境界スモーク ====

example : specMax3 30 20 10 = 30 := by decide
example : specMax3 10 30 20 = 30 := by decide
example : specMax3 10 20 30 = 30 := by decide
example : specMax3 20 20 20 = 20 := by decide
example : specMax3 0 0 0 = 0 := by decide
example : specSelectLumpSum false 100 = 0 := by decide
example : specLumpSumAmount (some 100 : Option Money) = 100 := by decide

-- ==== agree（実装 ≡ spec、有限サンプルをカーネルが decide） ====

/-- 各号の max 構造: 3 入力の代表グリッド（0,1,2,3,7,10,99,100,1000）で一致。 -/
def agreeAnnuityMaxima : Bool :=
  let vals := [0, 1, 2, 3, 7, 10, 99, 100, 1000]
  vals.all fun s =>
    vals.all fun l =>
      vals.all fun a =>
        (termAnnuityValue s l a == specTermAnnuityValue s l a) &&
        (perpetualAnnuityValue s l a == specPerpetualAnnuityValue s l a) &&
        (lifetimeAnnuityValue s l a == specLifetimeAnnuityValue s l a)

example : agreeAnnuityMaxima = true := by decide

/-- 一時金選択（Bool / Option）の一致。 -/
def agreeLumpSumSelection : Bool :=
  [0, 1, 100].all fun v =>
    (selectLumpSum true v == specSelectLumpSum true v) &&
    (selectLumpSum false v == specSelectLumpSum false v) &&
    (lumpSumAmount (some v) == specLumpSumAmount (some v)) &&
    (lumpSumAmount none == specLumpSumAmount none) &&
    (termAnnuityValueOpt 10 (some v) 30 == termAnnuityValue 10 v 30) &&
    (perpetualAnnuityValueOpt 10 none 30 == perpetualAnnuityValue 10 0 30) &&
    (lifetimeAnnuityValueOpt 10 (some v) 30 == lifetimeAnnuityValue 10 v 30)

example : agreeLumpSumSelection = true := by decide

end JapanTaxLaw.InheritanceAnnuityMaxima
