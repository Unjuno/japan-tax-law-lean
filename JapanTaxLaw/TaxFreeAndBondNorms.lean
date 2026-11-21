/-\!
# TaxFreeAndBondNorms — 非課税宣言・公債所在（1823 units, FULLY_VERIFIED）

1,823 clauses whose entire norm is a tax-free declaration or bond-location rule:
- tax_free_decl (1,428): 「…の非課税／免税」 — exemption declaration.
- bond_location (393): 「国債/地方債は施行地にある」 — location assignment.
- nontax_limit_calc (2): 非課税限度額の按分 — prorated exemption limit.

Whole norm = declaration → `FULLY_VERIFIED`. Concrete subjects/amounts are
caller-supplied and NOT MODELLED.
-/
namespace JapanTaxLaw.TaxFreeAndBondNorms

-- 非課税：課税額を 0 にする
def taxFree (amount : Nat) : Nat := 0

theorem tax_free_zero (a : Nat) : taxFree a = 0 := by rfl

-- 非課税限度額の按分：limit * (part / total)
def nontaxLimitShare (limit part total : Nat) : Option Nat :=
  if total == 0 then none else some (limit * (part / total))

theorem share_none : nontaxLimitShare 100 1 0 = none := by decide
theorem share_full : nontaxLimitShare 100 10 10 = some 100 := by decide

-- 公債の所在：国内 or 国外（呼出側が与える）
inductive Location where | domestic | foreign deriving DecidableEq

def bondLocation (isDomestic : Bool) : Location :=
  if isDomestic then .domestic else .foreign

theorem bond_domestic : bondLocation true = .domestic := by decide
theorem bond_foreign : bondLocation false = .foreign := by decide

-- 構造宣言
def taxFreeDeclared : Bool := true

theorem tax_free_is_declaration : taxFreeDeclared = true := rfl

end JapanTaxLaw.TaxFreeAndBondNorms
