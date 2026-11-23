/-\!
# InheritanceTaxAnnuityValuation — 相続税法 第二十五条（定期金給付契約の評価）

L0 条項単位の実質的形式化。pinned 原文:
  data/raw/325AC0000000073_20260401_506AC0000000008.law.json Article:25

原文の規範構造：
- 定期金給付契約（生命保険契約を除く。）で権利取得時に定期金給付事由が
  発生していないものの権利の価額は、次の各号の区分に応じ当該各号の金額による。
- 号1：解約返戻金を支払う旨の定めがない場合 → 次に掲げる区分の金額に
  「百分の九十」(90%) を乗じて得た金額。
  - イ：掛金/保険料が一時に払い込まれた場合 → 払込開始から権利取得までの期間に
    つき、払込金額に予定利率の複利で計算した元利合計額 ← 対象単位
  - ロ：イ以外 → 経過期間の年平均払込額 × 複利年金終価率
- 号2：号1以外 → 解約するとしたならば支払われる解約返戻金の金額。

変数の意味・単位・定義域：
  noSurrenderValue : Bool — 解約返戻金の定めがない
  lumpSumPremium : Bool — 掛金/保険料が一時払い（号1イ）
  baseAmount : Nat — 区分に対応する算定基礎額（円、呼出側が与える）
  surrenderValue : Nat — 解約返戻金額（円）

次元整合性：value[円] = (90 × base[円]) / 100（百分の九十）。
複利・終価率の具体的算定は NOT MODELLED（呼出側が baseAmount を提供）。
-/
namespace JapanTaxLaw.InheritanceTaxAnnuityValuation

-- 号1：解約返戻金なし → 基礎額の 90%（百分の九十）
def rate90Base (base : Nat) : Nat := (90 * base) / 100

theorem ninety_percent_le_base (base : Nat) : rate90Base base <= base := by
  unfold rate90Base
  have h90 : 90 <= 100 := by decide
  have hmul : 90 * base <= 100 * base := Nat.mul_le_mul_right base h90
  exact Nat.div_le_of_le_mul hmul

theorem ninety_zero : rate90Base 0 = 0 := by simp [rate90Base]

-- 号1の区分：一時払い(イ) か その他(ロ) かで基礎額を選択
def case1Base (lumpSum : Bool) (lumpSumAmount periodicAmount : Nat) : Nat :=
  if lumpSum then lumpSumAmount else periodicAmount
theorem lump_sum_selects_1 : case1Base true 10 20 = 10 := by simp [case1Base]
theorem periodic_selects_2 : case1Base false 10 20 = 20 := by simp [case1Base]

-- 評価結果：号1(解約返戻金なし)なら90%base、号2なら解約返戻金
def contractValue (noSurrenderValue lumpSum : Bool)
    (lumpSumAmount periodicAmount surrenderValue : Nat) : Nat :=
  if noSurrenderValue then
    rate90Base (case1Base lumpSum lumpSumAmount periodicAmount)
  else surrenderValue

theorem no_surrender_lump_sum (a p s : Nat) :
    contractValue true true a p s = rate90Base a := by simp [contractValue, case1Base]
theorem no_surrender_periodic (a p s : Nat) :
    contractValue true false a p s = rate90Base p := by simp [contractValue, case1Base]
theorem with_surrender (l : Bool) (a p s : Nat) :
    contractValue false l a p s = s := by simp [contractValue]

def inheritanceTaxAnnuityDeclared : Bool := true
theorem inheritance_tax_annuity_is_declaration : inheritanceTaxAnnuityDeclared = true := rfl

end JapanTaxLaw.InheritanceTaxAnnuityValuation
