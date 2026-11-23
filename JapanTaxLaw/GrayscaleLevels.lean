import JapanTaxLaw.TaxFinance

/-!
# GrayscaleLevels — 階調 256 以上（国税関係情報通信技術省令 art.5 §2）bounded L4 モデル

Sources (pinned):
  Law id: 415M60000040071
  Revision: 415M60000040071_20260924_506M60000040031
  Raw snapshot: data/raw/415M60000040071_20260924_506M60000040031.law.json
  Article Num 5 §2, flat/normalized leaf text 3448 chars. Needles contain no U+3000.

原文逐語（第2項 二号）:
  「白色から黒色までの階調が二百五十六階調以上であること」

Computation（原文逐語から導出、数値閾値のみ）:
  二百五十六 = 256
  meetsGrayscaleRequirement(levels) = levels >= 256

Scope / NOT MODELLED:
  - 第1項の申請等方法・第3項の例外（当該申請等を行う者の申出）は NOT MODELLED。
  - 他の号（カラー階調等）・入出力用プログラムの仕様は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.GrayscaleLevels

open JapanTaxLaw.TaxFinance

/-- 階調が 256 以上を満たすか。 -/
def meetsGrayscaleRequirement (levels : Nat) : Bool := levels >= 256

example : meetsGrayscaleRequirement 255 = false := by decide
example : meetsGrayscaleRequirement 256 = true := by decide -- ちょうど256は可
example : meetsGrayscaleRequirement 257 = true := by decide
example : meetsGrayscaleRequirement 0 = false := by decide

end JapanTaxLaw.GrayscaleLevels
