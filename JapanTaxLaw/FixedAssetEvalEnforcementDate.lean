import JapanTaxLaw.TaxFinance

/-!
# FixedAssetEvalEnforcementDate — 固定資産評価基準省令の施行期日（art.1）bounded L4 モデル

Sources (pinned):
  Law id: 328M50000002091
  Revision: 328M50000002091_20240425_506M60000008045
  Raw snapshot: data/raw/328M50000002091_20240425_506M60000008045.law.json
  Article Num 1, flat/normalized leaf text 32 chars, U+3000 count 0.

原文逐語:
  「この省令は、昭和五十七年四月一日から施行する。」

Computation（原文逐語から導出、施行日の算定のみ）:
  昭和 57 年 = 1926 + 57 - 1 = 1982（昭和元年 = 1926）
  enforcementDate = (1982, 4, 1)
  inForce(y, m, d) = (y, m, d) >= (1982, 4, 1)（暦日比較）

Scope / NOT MODELLED:
  - 附則の経過措置・適用除外・改正による施行日の変更は NOT MODELLED。
  - 本スライスは原文に明記された施行日のみを扱う。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.FixedAssetEvalEnforcementDate

open JapanTaxLaw.TaxFinance

/-- 昭和年を西暦年に換算（昭和元年 = 1926）。 -/
def showaToSeireki (showaYear : Nat) : Nat := 1925 + showaYear

/-- 施行日 = 昭和57年4月1日 = 1982-04-01。 -/
def enforcementDate : Nat × Nat × Nat := (showaToSeireki 57, 4, 1)

/-- 暦日を単一の Nat キー YYYYMMDD に符号化（単調、比較可能）。 -/
def dateKey (date : Nat × Nat × Nat) : Nat :=
  date.1 * 10000 + date.2.1 * 100 + date.2.2

/-- 施行日のキー = 19820401。 -/
def enforcementKey : Nat := dateKey enforcementDate

/-- 指定日が施行日以降か（キー比較）。 -/
def inForce (date : Nat × Nat × Nat) : Bool := dateKey date >= enforcementKey

example : showaToSeireki 57 = 1982 := by decide
example : enforcementDate = (1982, 4, 1) := by decide
example : enforcementKey = 19820401 := by decide
example : inForce (1982, 4, 1) = true := by decide
example : inForce (1982, 3, 31) = false := by decide
example : inForce (2000, 1, 1) = true := by decide

end JapanTaxLaw.FixedAssetEvalEnforcementDate
