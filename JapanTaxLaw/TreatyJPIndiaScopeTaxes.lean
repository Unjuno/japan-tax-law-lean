/-!
# Japan-India 1989 treaty — 第一条（適用範囲）・第二条（対象租税）

L3 条約層（別層、インド）。原文 pinned: data/raw/treaties/*_IN_*.txt
- 第一条：一方又は双方の締約国の居住者である者に適用（論理和）。
- 第二条：対象租税（現行租税 又は 後続の同一/実質類似租税）。

法的効力・具体租税リストは NOT MODELLED。legal_review PENDING（独立的軸）。
-/
namespace JapanTaxLaw.TreatyJPIndiaScopeTaxes

def inScope (residentJP residentOther : Bool) : Bool := residentJP || residentOther
theorem jp_resident_in_scope : inScope true false = true := by decide
theorem other_resident_in_scope : inScope false true = true := by decide
theorem neither_not_in_scope : inScope false false = false := by decide

def coveredTax (listed successorSimilar : Bool) : Bool := listed || successorSimilar
theorem listed_tax_covered : coveredTax true false = true := by decide
theorem successor_tax_covered : coveredTax false true = true := by decide
theorem unrelated_tax_not_covered : coveredTax false false = false := by decide

def scopeTaxesDeclared : Bool := true
theorem scope_taxes_is_declaration : scopeTaxesDeclared = true := rfl

end JapanTaxLaw.TreatyJPIndiaScopeTaxes
