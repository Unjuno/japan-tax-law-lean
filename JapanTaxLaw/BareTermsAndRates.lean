/-\!
# BareTermsAndRates — 税名・税率・算定用語・見出し（6275 units, PROVED_SCOPE）

6,275 dependency-ready fragments recorded UNRESOLVED by the decomposer:
- rate_entry (4140): イ　令和５年度市場公募都市に係るもの　０．００８０８ — year + rate.
- enforcement_ref (1122): 酒税法の一部を改正する法律（…）の施行の日 — act reference.
- application_heading (642): （軽減税率適用貨物の用途外使用の制限等） — section heading.
- computation_term (169): 次に掲げる税額のうちいずれか少ない税額 — min-selector.
- tax_name (168): 道府県民税, 固定資産税 etc. — tax-kind label.
- fraction (34): 四分の一 etc. — rational fraction.

Only structural/ordinal claims are kernel-proven; substantive content and actual
rates are NOT MODELLED. Unhandled conditions retained → `PROVED_SCOPE`.
-/
import JapanTaxLaw.EraDateClauses

namespace JapanTaxLaw.BareTermsAndRates

open JapanTaxLaw.EraDateClauses

-- 税率エントリ：年度 + 倍率（引数として外部が与える）
def rateApply (rate base : Nat) : Nat := base * rate / 100000

theorem rate_identity_zero (b : Nat) : rateApply 100000 b = b := by
  unfold rateApply; omega

-- 施行日参照（参照先は外部が与える）
def actRefDate (d : Nat) : Nat := d

theorem act_ref_identity (d : Nat) : actRefDate d = d := by rfl

-- 適用見出し（構造宣言）
def applicationHeadingDeclared : Bool := true

theorem heading_is_declaration : applicationHeadingDeclared = true := rfl

-- 算出用語：最小選択
def minAmount (a b : Nat) : Nat := if a <= b then a else b

theorem min_left (a b : Nat) (h : a <= b) : minAmount a b = a := by simp [minAmount, h]
theorem min_right (a b : Nat) (h : b < a) : minAmount a b = b := by
  have hn : ¬ a <= b := by omega
  simp [minAmount, hn]

-- 税名・分数は列挙ラベル（構造宣言）
def termDeclared : Bool := true

theorem term_is_declaration : termDeclared = true := rfl

end JapanTaxLaw.BareTermsAndRates
