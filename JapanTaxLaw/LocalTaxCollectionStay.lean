/-\!
# LocalTaxCollectionStay — 地方税法 第十五条の七（滞納処分の停止）

L0 条項単位の実質的形式化。pinned 原文:
  data/raw/325AC0000000226_20261101_508AC0000000002.law.json Article:15_7

原文の規範構造（対象2単位）:
- 第1項二号：滞納処分をすることによって生活を著しく窮迫させるおそれがあるとき
  → 滞納処分の執行を停止することができる（裁量）。
- 第4項：執行停止が「三年間継続」したときは、徴収金を納付/納入する義務は消滅する。

変数: `hardshipFear` 生活著しく窮迫のおそれ, `yearsStopped` 執行停止の継続年数[Nat]。
「三年間継続」判定: yearsStopped >= 3。

具体的な「著しく窮迫」の認定は事実認定なので NOT MODELLED。
-/
namespace JapanTaxLaw.LocalTaxCollectionStay

-- 停止の可否：号2該当なら停止可能（裁量、ここでは根拠事実の成立を表す）
def hardshipStayGround (hardshipFear : Bool) : Bool := hardshipFear
theorem hardship_enables_stay : hardshipStayGround true = true := by decide
theorem no_hardship_no_ground : hardshipStayGround false = false := by decide

-- 3年継続判定
def threeYearsContinued (yearsStopped : Nat) : Bool := decide (3 <= yearsStopped)
theorem at_3_years_extinguishes : threeYearsContinued 3 = true := by decide
theorem before_3_years_no_extinction : threeYearsContinued 2 = false := by decide

-- 義務消滅：3年継続なら消滅
def obligationExtinguished (yearsStopped : Nat) : Bool := threeYearsContinued yearsStopped
theorem extinction_at_3 : obligationExtinguished 3 = true := by decide
theorem no_extinction_before_3 : obligationExtinguished 2 = false := by decide

def localTaxCollectionStayDeclared : Bool := true
theorem local_tax_collection_stay_is_declaration : localTaxCollectionStayDeclared = true := rfl

end JapanTaxLaw.LocalTaxCollectionStay
