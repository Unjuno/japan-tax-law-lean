/-\!
# TreatyJPUSScope — 日米租税条約 第一条（適用範囲）L3 auxiliary layer

Formalization of two self-contained operators in Article 1 of the Japan–US
income tax treaty (2003, consolidated text), from the pinned and SHA-verified
MOF PDF text at data/raw/treaties/JP_US_INCOME_TAX_2003.txt:

  １ この条約は、…一方又は双方の締約国の居住者である者にのみ適用する。
  ２ この条約の規定は、…租税の減免をいかなる態様においても制限するものと
    解してはならない。

This belongs to L3_TREATY, an AUXILIARY layer with its own denominator; it is
NOT merged into the L0 statute ledger. Concrete residency facts and relief
amounts are caller-supplied and NOT MODELLED. Human legal review pending.
-/
namespace JapanTaxLaw.TreatyJPUSScope

-- 第一条1: 一方又は双方の締約国の居住者である者にのみ適用
def inScope (residentJP residentUS : Bool) : Bool := residentJP || residentUS

theorem jp_resident_in_scope (r : Bool) : inScope true r = true := by simp [inScope]
theorem us_resident_in_scope (r : Bool) : inScope r true = true := by simp [inScope]
theorem non_resident_out : inScope false false = false := by rfl
theorem scope_comm (a b : Bool) : inScope a b = inScope b a := by
  cases a <;> cases b <;> rfl

-- 第一条2: 条約は他の法令による租税減免を制限しない（保存演算子）
def preservesRelief (relief : Nat) : Nat := relief

theorem relief_preserved (r : Nat) : preservesRelief r = r := rfl
theorem relief_zero : preservesRelief 0 = 0 := rfl

-- 構造宣言
def treatyScopeDeclared : Bool := true
theorem treaty_scope_is_declaration : treatyScopeDeclared = true := rfl

end JapanTaxLaw.TreatyJPUSScope
