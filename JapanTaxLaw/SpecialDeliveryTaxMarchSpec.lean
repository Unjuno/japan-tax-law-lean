import JapanTaxLaw.SpecialDeliveryTaxMarch

/-!
# SpecialDeliveryTaxMarch spec — 特別交付税省令 art.10 の独立整数定式

Sources (pinned; identical to SpecialDeliveryTaxMarch.lean):
  Law id: 351M50000008035
  Revision: 351M50000008035_20260316_508M60000008025
  Article Num 10.

Independent integer restatement (coordinator の数式は信じず原文から直接):
  * 〇・八 = 8/10、〇・七 = 7/10。
  * 「乗じて得た額」は整数乗除（切り捨て）。
  * 「控除した額」は saturating（負なら 0）。
  * 「表示単位千円・四捨五入」は round half up。
  * 「合算額を加えた額」= base + Σ items。

Spec は impl の def を参照せず、原文から直接書いた整数式のみを使う。
Scope boundaries identical to the implementation。
-/

namespace JapanTaxLaw.SpecialDeliveryTaxMarch

/-- Spec: 「調査額に num/den を乗じて得た額」（整数乗除）。 -/
def specScaled (surveyed num den : Nat) : Nat := surveyed * num / den

/-- Spec: 「控除した額」（saturating）。Nat 減算は既に saturating。 -/
def specItem (scaled annex : Nat) : Nat := scaled - annex

/-- Spec: 表示単位千円・四捨五入（round half up）。 -/
def specRound (x : Nat) : Nat := (x + 500) / 1000 * 1000

/-- Spec: 合算額。 -/
def specTotal (items : List Nat) : Nat := items.foldl (fun a b => a + b) 0

/-- Spec: 第四条第一項第一号の額 = base + 合算額。 -/
def specMarch (base : Nat) (items : List Nat) : Nat := base + specTotal items

-- ==== spec smoke (kernel-decided) ====
example : specScaled 1000 8 10 = 800 := by decide
example : specScaled 1000 7 10 = 700 := by decide
example : specItem 100 150 = 0 := by decide
example : specItem 100 40 = 60 := by decide
example : specRound 499 = 0 := by decide
example : specRound 500 = 1000 := by decide
example : specRound 1500 = 2000 := by decide
example : specMarch 100 [10, 20, 30, 40, 50, 60, 70, 80] = 460 := by decide

/-- Agreement between impl and Spec on a finite grid（定数値一致、有限グリッド、by decide）。 -/
def agreeSpecialDeliveryTaxMarch : Bool :=
  (scaledSurvey 1000 rate08 == specScaled 1000 8 10)
  && (scaledSurvey 1000 rate07 == specScaled 1000 7 10)
  && (scaledSurvey 1234 rateOne == specScaled 1234 1 1)
  && (itemAfterDeduction 100 150 == specItem 100 150)
  && (itemAfterDeduction 100 40 == specItem 100 40)
  && ([499, 500, 0, 1500, 1234, 999_999].all fun x => roundToThousand x == specRound x)
  && (marchAmount 100 10 20 30 40 50 60 70 80 ==
      specMarch 100 [10, 20, 30, 40, 50, 60, 70, 80])

example : agreeSpecialDeliveryTaxMarch = true := by decide

end JapanTaxLaw.SpecialDeliveryTaxMarch
