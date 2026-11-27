/-!
# BenefitTariffLowerRate — 関税暫定措置法施行令 第三条（便益関税の税率）

Sources (pinned): law `330CO0000000237` / rev `330CO0000000237_20250401_507CO0000000141`.
Raw snapshot: `data/raw/330CO0000000237_20250401_507CO0000000141.law.json`.

原文（第一項）:
「前条に規定する同譲許表に掲げる貨物に対して課する関税の税率は、当該貨物の区分に応じ、同譲許表に定める税率とする。」
原文（第二項）:
「前項の規定は、同項に定める税率より低い税率を定める法令の規定の適用を妨げない。」

Computation: 譲許表の税率を `tableRate` として受け取り、より低い税率を定める法令が
適用される場合（`some lower`）はその低い方を、それ以外は表の税率を適用する。
Scope: 譲許表の内容・貨物の区分・税率の数値・「法令の規定」の特定は NOT MODELLED
（表と法令は入力として受け取る）。法的レビューを提供しない。
-/

namespace JapanTaxLaw.BenefitTariffLowerRate

/-- 第二項の優先関係: より低い税率を定める法令があればその税率、なければ表の税率。 -/
def effectiveRate (tableRate : Nat) (lowerLawRate : Option Nat) : Nat :=
  match lowerLawRate with
  | none => tableRate
  | some lower => if lower < tableRate then lower else tableRate

example : effectiveRate 20 none = 20 := by decide
example : effectiveRate 20 (some 10) = 10 := by decide
example : effectiveRate 20 (some 20) = 20 := by decide
example : effectiveRate 20 (some 25) = 20 := by decide
example : effectiveRate 0 (some 0) = 0 := by decide

end JapanTaxLaw.BenefitTariffLowerRate
